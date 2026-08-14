---
name: store-deploy
description: Flutter 앱을 앱스토어(App Store)와 플레이스토어(Play Store)에 자동 배포하는 CI/CD를 설정한다. Fastlane(무료) + GitHub Actions(무료 티어) 기반, 정식 출시까지 자동 제출. 웹/서버 배포가 아닌 "스토어 자동배포"에만 특화. "스토어 자동배포", "앱 배포 CI/CD", "fastlane 설정", "TestFlight 자동", "플레이스토어 자동 업로드", store deploy 요청 시 사용.
---

# Store Deploy — Flutter 앱 스토어 자동배포 설정

Flutter 앱 하나를 대상으로 **App Store + Play Store 자동배포**를 구성한다.
웹/서버 배포는 다루지 않는다(이미 자동화됨). 스토어 업로드/제출만 자동화한다.

도구: **Fastlane**(오픈소스·무료) + **GitHub Actions**(무료 티어).
기본 정책: **정식 출시(production)까지 자동 제출**. 심사 통과 자체는 스토어(애플/구글)가 하므로 자동화 불가.

## 이 스킬을 쓰기 전 반드시 인지시킬 사실 (한 번 안내)

- 스토어 계정 비용은 도구와 무관하게 필수: **Apple Developer $99/년**, **Google Play $25(1회)**. CI 비용 아님.
- **첫 등록(앱 최초 생성 + 스크린샷/설명 입력)은 콘솔에서 수동으로 1회** 해야 한다. 이 스킬은 그 이후 **버전 업데이트 자동화**를 담당한다.
- 심사 시간(구글 수시간, 애플 1~3일)은 자동화 대상이 아니다.
- iOS를 GitHub Actions(macOS 러너)에서 돌리면 무료 티어의 macOS 분(10배 가중)을 소모한다. 절약하려면 iOS는 **로컬 Mac에서 `fastlane` 수동/반자동 실행**을 권장(무료·서명 간단). Android는 ubuntu 러너라 부담 없음.

## 실행 순서

대상 프로젝트 경로를 확인한 뒤 아래를 순서대로 진행한다. 각 단계는 사용자 승인 후 진행.

### 0단계 — 프로젝트 확인 & 사전 감사
1. `pubspec.yaml`, `android/`, `ios/` 존재 확인(Flutter 앱인지).
2. **보안 감사(중요).** 저장소에 서명키·인증정보가 평문으로 있는지 검사:
   ```bash
   git ls-files 2>/dev/null | grep -iE '\.(jks|keystore|p8|p12|mobileprovision)$|key\.properties|service.*account.*\.json|accessKeys|계정' || \
   find . -maxdepth 3 -iEregex '.*\.(jks|keystore|p8|p12|mobileprovision)' 2>/dev/null
   ```
   발견 시 **먼저 `.gitignore` 처리 + Secrets로 이전**을 요구한다. `references/secrets.md` 참조.
   이미 커밋된 적 있으면 `git rm --cached` 안내(히스토리 잔존은 별도 경고).
3. Android `applicationId`, iOS `PRODUCT_BUNDLE_IDENTIFIER` 값을 확인해 기록.
4. **스토어 데드라인 사전 점검(2026 — 놓치면 업로드 거절).** 아래를 확인하고 미달이면 먼저 조치:
   - **Android targetSdk/compileSdk**: 신규 앱·업데이트는 `targetSdk 36`(Android 16, ~2026-08-31),
     기존 앱은 35 이상. **compileSdk는 targetSdk보다 높아도 되고, 종속성(예: flutter_secure_storage 11.0
     →37)이 요구하면 올려야 한다** — targetSdk는 36 고정. `android/app/build.gradle` 확인. → `references/setup-android.md §6`
   - **iOS Xcode**: 2026-04-28부터 App Store 업로드는 **Xcode 26 + iOS 26 SDK 빌드만 허용**.
     CI 러너는 `macos-26`, 로컬은 `xcodebuild -version`으로 26+ 확인. → `references/setup-ios.md`
   - **fastlane**: Gemfile은 `>= 2.236.1`로 고정돼 있다(CVE-2026-35611 패치). 대상 프로젝트에
     이미 `Gemfile.lock`이 있으면 `bundle update fastlane`로 갱신.

### 1단계 — 사전 준비물 체크 (사용자에게 확인)
`references/secrets.md`의 체크리스트로 확보 여부를 묻는다. 없으면 발급 방법을 안내하고 대기.
- Android: 업로드 키스토어(`.jks`), **Play Console 서비스 계정 JSON**, 패키지명
- iOS: **App Store Connect API Key**(`.p8` + Key ID + Issuer ID), 번들 ID, 팀 ID

### 2단계 — Fastlane 파일 배치
`assets/`의 템플릿을 대상 프로젝트로 복사하고 값 치환:
- `assets/android/fastlane/*` → `<project>/android/fastlane/`
- `assets/android/Gemfile` → `<project>/android/Gemfile`
- `assets/ios/fastlane/*` → `<project>/ios/fastlane/`
- `assets/ios/Gemfile` → `<project>/ios/Gemfile`
- `assets/ios/ExportOptions.plist` → `<project>/ios/ExportOptions.plist` (팀 ID·번들 ID 치환)

Android 서명은 `android/app/build.gradle`에 release signingConfig가 `key.properties`를 읽도록 되어 있어야 한다. 없으면 `references/setup-android.md`의 스니펫을 추가.

### 3단계 — CI 워크플로 배치
`assets/github/store-deploy.yml` → `<project>/.github/workflows/store-deploy.yml`.
- 트리거: `v*` 태그 push, 또는 수동 실행(track 선택).
- `env.FLUTTER_VERSION`을 대상 프로젝트 `pubspec.yaml`/사용 버전에 맞춘다.
- iOS 잡을 CI에서 돌릴지, 로컬 전용으로 둘지 사용자에게 확인.
  - CI에서 돌리면: `references/setup-ios.md`의 서명(match 또는 p12 import) 설정 필요.
  - 로컬 전용이면: 워크플로에서 `ios` 잡을 제거하거나 `if: false`.

### 4단계 — Secrets 등록 안내
`references/secrets.md`의 표대로 GitHub repo Secrets를 등록하도록 **명령어와 함께** 안내(`gh secret set ...`). 값 자체는 사용자가 입력하게 하고, 절대 로그/커밋에 노출하지 않는다.

### 5단계 — 검증 (dry-run 우선)
1. 로컬 빌드 확인: `flutter build appbundle --release` (Android), Mac이면 `flutter build ipa --release`.
2. Fastlane 연결 확인(업로드 없이):
   - Android: `cd android && bundle exec fastlane run validate_play_store_json_key` (자격 검증)
   - iOS: `cd ios && bundle exec fastlane run app_store_connect_api_key ...` 로 키 로드 확인
3. 실제 배포는 **테스트 트랙(internal/beta) lane으로 1회 먼저** 돌려 확인한 뒤 production을 태그로 실행.

## 사용 방법 (설정 완료 후 사용자에게 안내)

- 릴리스: `pubspec.yaml`의 `version:` 올리고 → `git tag v1.2.3 && git push --tags` → CI가 빌드+업로드+제출.
- 로컬 즉시 배포: `cd android && bundle exec fastlane production` / `cd ios && bundle exec fastlane production`.
- 안전하게 테스트 먼저: lane을 `internal`(Android) / `beta`(iOS, TestFlight)로.

## lane 구조 (템플릿 제공)
- Android: `internal`(내부테스트) · `production`(정식, 심사제출)
- iOS: `beta`(TestFlight) · `production`(App Store 제출 + 자동출시)

## 여러 앱에 복제
이 스킬은 앱 1개 기준이다. medilog/rakwan/pet/joowon/tvApp 등 각 앱에서 개별 실행한다.
공통값(Flutter 버전 등)만 맞추면 템플릿은 그대로 재사용된다. 앱마다 Secrets는 별도 등록.

## 절대 하지 말 것
- 서명키/API Key/서비스계정 JSON을 커밋하거나 로그에 출력하지 않는다.
- 사용자 승인 없이 실제 production 제출 lane을 실행하지 않는다(첫 실행은 테스트 트랙).
- 스토어 첫 등록(리스팅 생성)을 자동화하려 하지 않는다 — 수동 1회임을 안내.

상세: `references/setup-android.md`, `references/setup-ios.md`, `references/secrets.md`.
