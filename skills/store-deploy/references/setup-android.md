# Android 설정 상세

## 1. 릴리스 서명 구성
`android/key.properties` (git-ignored, 로컬/CI에서 생성):
```
storeFile=upload-keystore.jks
storePassword=<...>
keyAlias=upload
keyPassword=<...>
```

`android/app/build.gradle`에 아래가 있어야 한다(없으면 추가):
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file("app/${keystoreProperties['storeFile']}") : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```
> `storeFile` 경로는 프로젝트 구조에 맞게 조정. CI 워크플로는 `android/app/upload-keystore.jks`에 복원한다.

## 2. Play Console 서비스 계정 권한
- Play Console → 설정 → API 액세스 → 서비스 계정 연결
- 해당 서비스 계정에 최소 **"릴리스 관리(Release manager)"** 권한 부여
- 없으면 `upload_to_play_store`가 403으로 실패

## 3. 최초 1회 수동 업로드
서비스 계정 API는 **이미 스토어에 앱이 존재**해야 동작한다.
→ 첫 AAB는 Play Console에서 수동 업로드해 앱을 생성한 뒤, 이후 버전부터 자동화.

## 4. 로컬 배포 (CI 없이)
```bash
flutter build appbundle --release
cd android
bundle install
PLAY_STORE_JSON_KEY_PATH=play-store-key.json \
ANDROID_PACKAGE_NAME=com.example.app \
bundle exec fastlane internal   # 먼저 내부테스트로 확인
bundle exec fastlane production  # 확인 후 정식
```

## 5. 버전
`pubspec.yaml`의 `version: 1.2.3+45` — `+` 뒤 숫자가 versionCode. 배포마다 증가해야 한다(중복 시 거절).

## 6. targetSdk 데드라인 (2026 — 놓치면 업로드 거절) ⚠️
Play Console 정책상 타깃 API 레벨 요건이 매년 상향된다. 2026 기준:
- **신규 앱·업데이트: `targetSdk 36`(Android 16) 필수 — 2026-08-31 데드라인.**
- 기존 앱(업데이트 안 함): `targetSdk 35`(Android 15) 이상 유지.
- 연장 신청은 2026-11-01까지 가능하나, 신청 안 하면 그 날짜부로 업로드가 막힌다.

Flutter 프로젝트에서 확인·수정할 곳 (`android/app/build.gradle` 또는 `build.gradle.kts`):
```gradle
android {
    compileSdk 36            // 아래 "compileSdk ≥ targetSdk" 주의 참고 — 종속성이 요구하면 더 올린다
    defaultConfig {
        targetSdk 36         // ← 36 미만이면 2026-08-31 이후 신규/업데이트 업로드 거절
        // minSdk 는 앱 정책대로 유지
    }
}
```

### ⚠️ compileSdk 와 targetSdk 는 다르다 — 헷갈리면 빌드가 깨진다
- **targetSdk** = "어느 API에서 **실행**되도록 맞추나". **런타임 동작·Play 정책**을 결정한다.
  Play 데드라인이 요구하는 값(2026 신규/업데이트 = **36**)을 여기에 박는다. **이건 함부로 올리지 않는다**
  (올리면 새 런타임 동작 검증 필요).
- **compileSdk** = "어느 API로 **컴파일**하나". 런타임 동작을 바꾸지 않고 하위 호환이며,
  **targetSdk보다 높아도 된다**. 오히려 **종속성이 더 높은 compileSdk를 요구하면 올려야 한다.**

**실전 사례(반드시 인지):** 어떤 라이브러리의 AAR 메타데이터가 상위 API로 컴파일돼 있으면
`:app:checkDebugAarMetadata` 단계에서 빌드가 **거부**된다. 예) `flutter_secure_storage 11.0.0`은
`compileSdkVersion=37`로 배포돼 있어 `compileSdk 36`이면 빌드 실패 → **compileSdk 만 37로 올리고
targetSdk 는 36 그대로** 둔다. (AGP가 "권장 최대 compileSdk" 경고를 낼 수 있으나 빌드는 통과.)

> 정리: **compileSdk 는 종속성이 요구하는 만큼(≥ targetSdk) 올리되, targetSdk 는 Play 데드라인 값(36)에 고정.**
> Flutter 기본 템플릿은 `flutter.compileSdkVersion`/`flutter.targetSdkVersion`을 참조하기도 하므로,
> AAR 메타데이터 오류가 나면 위처럼 `compileSdk` 만 명시적으로 올린다.
> 빌드 후 `aapt dump badging <aab>`로 실제 targetSdk가 36인지 검증.
