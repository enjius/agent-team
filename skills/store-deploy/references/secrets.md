# Secrets 준비 & 등록

절대 저장소에 커밋하지 않는다. GitHub repo Secrets(또는 로컬 `.env`, git-ignored)로만 관리.

## 사전 감사 (필수 1회)
저장소에 이미 키가 있는지 확인하고 제거:
```bash
# 커밋된 민감파일 탐지
git ls-files | grep -iE '\.(jks|keystore|p8|p12|mobileprovision)$|key\.properties|accessKeys|계정'
# 발견 시: .gitignore 추가 후 추적 해제(파일은 로컬 보존)
git rm --cached <파일>
```
`.gitignore`에 추가:
```
*.jks
*.keystore
*.p8
*.p12
*.mobileprovision
**/key.properties
**/play-store-key.json
**/private_keys/
*accessKeys*.csv
계정*.txt
```
> 이미 원격에 push된 적 있으면 히스토리에 남는다 → 해당 키는 **폐기 후 재발급** 권장.

## Android 준비물
| 항목 | 발급/위치 | 용도 |
|------|-----------|------|
| 업로드 키스토어 `.jks` | `keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload` | 앱 서명 |
| 키스토어 비밀번호 / 키 alias / 키 비밀번호 | 위 생성 시 지정 | 서명 |
| Play Console 서비스 계정 JSON | Play Console → 설정 → API 액세스 → 서비스 계정 생성 → GCP에서 JSON 키 → Play Console에서 "릴리스 관리" 권한 부여 | 업로드 자격 |
| 패키지명 | `android/app/build.gradle`의 `applicationId` | 대상 지정 |

## iOS 준비물
| 항목 | 발급/위치 | 용도 |
|------|-----------|------|
| App Store Connect API Key `.p8` | App Store Connect → 사용자와 액세스 → 통합 → App Store Connect API → 키 생성(Admin/App Manager) | 업로드/제출 자격 |
| Key ID | 위 키 목록에 표시 | API 키 식별 |
| Issuer ID | 같은 화면 상단 | API 키 발급자 |
| 번들 ID | Xcode `PRODUCT_BUNDLE_IDENTIFIER` | 대상 앱 |
| 팀 ID | developer.apple.com → Membership | 서명/Export |
| (CI 서명용) 배포 인증서 `.p12` + 비번 | Keychain에서 Apple Distribution 인증서 export | CI 코드사이닝 |
| (CI 서명용) 프로비저닝 프로파일 `.mobileprovision` | developer.apple.com → Profiles(App Store) | CI 코드사이닝 |

> iOS를 로컬 Mac에서만 배포하면 `.p12`/프로파일 시크릿은 불필요(로컬 Xcode 서명 사용). API Key(.p8)만 있으면 된다.

## GitHub Secrets 등록 (gh CLI)
값은 사용자가 직접 입력. 파일은 base64로 인코딩해 등록.
```bash
# Android
gh secret set ANDROID_KEYSTORE_BASE64 < <(base64 -i upload-keystore.jks)
gh secret set ANDROID_KEYSTORE_PASSWORD
gh secret set ANDROID_KEY_ALIAS
gh secret set ANDROID_KEY_PASSWORD
gh secret set ANDROID_PACKAGE_NAME
gh secret set PLAY_STORE_JSON_KEY < play-store-key.json

# iOS (공통)
gh secret set IOS_BUNDLE_ID
gh secret set ASC_KEY_ID
gh secret set ASC_ISSUER_ID
gh secret set ASC_KEY_P8 < <(base64 -i AuthKey_XXXX.p8)
gh secret set APPLE_DEV_TEAM_ID

# iOS (CI 서명 시에만)
gh secret set IOS_DIST_CERT_P12 < <(base64 -i dist_cert.p12)
gh secret set IOS_DIST_CERT_PASSWORD
gh secret set IOS_PROVISION_PROFILE < <(base64 -i profile.mobileprovision)
```
`base64` 플래그: macOS는 `base64 -i <파일>`, Linux는 `base64 -w0 <파일>`.
