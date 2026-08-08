# iOS 설정 상세

## Xcode 26 데드라인 (이미 시행 중) ⚠️
**2026-04-28부터 App Store Connect 업로드는 Xcode 26 + iOS 26 SDK 빌드만 허용**된다.
그 이전 Xcode로 만든 빌드는 업로드가 거절된다.
- **CI**: 워크플로 러너를 `macos-26`으로 둔다(Xcode 26 프리인스톨). 워크플로에 Xcode
  버전을 확인해 26 미만이면 실패시키는 가드 스텝이 들어 있다.
- **로컬 Mac**: `xcodebuild -version`으로 확인하고, 26 미만이면 App Store/설정에서
  Xcode를 26 이상으로 업데이트한 뒤 빌드한다.
- 참고: App Store 연령등급 개편 설문(4+/9+/13+/16+/18+)을 미완료한 앱은 업데이트
  제출이 차단되므로, App Store Connect에서 응답 상태도 함께 확인한다.

## 권장: 비용 절약을 위해 iOS는 로컬 Mac에서 배포
GitHub Actions의 macOS 러너는 무료 티어에서 분(minute)이 10배로 계산된다.
사용자가 Mac을 쓰므로, iOS는 로컬에서 Fastlane 실행이 가장 저렴하고 서명도 간단하다.

```bash
flutter build ipa --release --export-options-plist=ios/ExportOptions.plist
cd ios
bundle install
export IOS_BUNDLE_ID=com.example.app
export ASC_KEY_ID=XXXX ASC_ISSUER_ID=xxxx-xxxx ASC_KEY_PATH=~/keys/AuthKey_XXXX.p8
export APPLE_DEV_TEAM_ID=XXXXXXXXXX
bundle exec fastlane beta        # TestFlight로 먼저 확인
bundle exec fastlane production  # App Store 제출
```
로컬은 Xcode 로그인 계정으로 자동 서명되므로 `.p12`/프로파일이 필요 없다.
`ExportOptions.plist`의 `{{TEAM_ID}}`만 실제 팀 ID로 치환.

## CI(macOS 러너)에서 돌리려면 — 코드사이닝 준비
CI에는 로그인된 Xcode가 없으므로 서명 자산을 주입해야 한다. 두 방법:

### 방법 A) 수동 인증서/프로파일 (워크플로 기본값)
1. Keychain Access에서 **Apple Distribution** 인증서를 `.p12`로 export(비번 설정).
2. developer.apple.com → Profiles에서 **App Store** 프로비저닝 프로파일 다운로드(`.mobileprovision`).
3. `references/secrets.md`의 `IOS_DIST_CERT_P12 / IOS_DIST_CERT_PASSWORD / IOS_PROVISION_PROFILE` 등록.
4. `ExportOptions.plist`의 `signingStyle`을 `manual`로 바꾸고 `provisioningProfiles` 매핑 추가:
   ```xml
   <key>signingStyle</key><string>manual</string>
   <key>provisioningProfiles</key>
   <dict>
     <key>com.example.app</key>
     <string>프로파일 이름</string>
   </dict>
   ```

### 방법 B) fastlane match (팀·다앱 운영 시 권장)
인증서/프로파일을 별도 **private git repo**에 암호화 저장해 공유.
```bash
cd ios && fastlane match init
fastlane match appstore   # 최초 1회 생성/등록
```
CI에서는 `MATCH_PASSWORD`, `MATCH_GIT_URL` 시크릿과 배포키만 있으면 자동 서명.
Fastfile beta/production lane 앞에 `match(type: "appstore", readonly: true)` 추가.

## 최초 1회 수동
App Store Connect에서 **앱 레코드 생성 + 스크린샷/설명/개인정보 항목**을 먼저 채워야
`upload_to_app_store`가 심사 제출까지 진행된다(첫 리스팅은 자동화 불가).

## 버전
`pubspec.yaml`의 `version: 1.2.3+45` — `+` 뒤가 build number. 배포마다 증가 필요.
`upload_to_app_store`는 심사 제출까지 하지만, 심사 승인은 애플이 수행(1~3일).
