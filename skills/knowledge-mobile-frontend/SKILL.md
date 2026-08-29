---
name: knowledge-mobile-frontend
description: 모바일(Flutter)·프론트엔드 최신 지식 — UI 구현, 스토어 배포, 성능. 프론트·모바일 역할이 작업 전 참고 (갱신: 2026-08-08)
---

# mobile-frontend 도메인 지식 (2026-08-08)

> 역할별 에이전트 KNOWLEDGE 블록을 도메인 단위로 통합한 지식 베이스.
> `agent-team learn --domains` 가 이 파일을 통째로 갱신한다.

## dev-frontend
- **React Server Components + Server Actions가 기본 렌더링 모델로 정착** — 클라이언트 JS 최소화, `use server`로 API 없이 데이터 뮤테이션 처리 (netguru.com, medium.com)
- **INP < 200ms가 최대 난제** — 여전히 43%가 실패, 긴 태스크 분할·메인스레드 양보·DOM 단순화가 필수 최적화 (senorit.de, digitalapplied.com)
- **WCAG 2.2 AA 접근성이 미국·EU에서 법적 의무화** — 선택이 아닌 준수 요건 (tekrevol.com)
- **빌드 툴 Vite+Rolldown(Rust) 표준화** — 만족도 98%, 빌드 2.5분→40초 수준 단축 (medium.com, refontelearning.com)
- **Tailwind v4는 `tailwind.config.js` 폐기, CSS `@theme` 방식** — CSS containment 등으로 JS를 CSS로 대체해 페이로드 감축 (medium.com, codearrest.com)
- **TypeScript 필수 + 서버상태는 TanStack Query, 로컬상태 최소화** — AI 코드젠(v0 등) 일상화되나 상태관리 코드에서 결함률 상승 주의 (trantorinc.com, netguru.com)

## flutter-builder
- **Flutter 3.44 + Dart 3.12 안정판(Google I/O 2026) 출시** — 렌더링·메모리 최적화, 웹 WASM 렌더링 가속, 데스크톱 멀티윈도우 지원; 차기 4.0에서 Impeller 2.0 예고 (io.google, fluttersolution.com)
- **Flutter GenUI로 AI가 런타임에 UI를 생성하는 적응형 UX 패턴 부상** — AI 기능 탑재 앱의 새 표준으로 검토 가치 (deepcrazyworld.com, io.google)
- **Riverpod 3.0 안정화** — provider 자동 재시도 기본화, Notifier/AutoDisposeNotifier 통합, `Ref.mounted`·`ProviderContainer.test()` 추가, 오프라인·mutation은 실험 기능; 4.0 조기 출시 가능성 언급 (riverpod.dev)
- **go_router는 유지보수 모드 전환** — 신규 앱은 go_router_builder 기반 typed routes가 사실상 표준이며, 장기적으로 대체 라우팅 솔루션 동향 주시 필요 (pub.dev, medium.com)
- **supabase_flutter 2.15+** — Passkey(WebAuthn) 등록 지원, Google/Apple 네이티브 로그인, PKCE가 딥링크 인증 기본 플로우로 정착 (supabase.com, pub.dev)
- **Flutter 플랫폼 확장** — LG와 협력해 webOS 스마트TV용 공식 Flutter SDK를 2026 상반기 목표로 출시 진행 중 (cmarix.com, io.google)

Sources: [Google I/O 2026: What's new in Flutter](https://io.google/2026/explore/pa-keynote-12), [Flutter 3.44 & Dart 3.12](https://www.fluttersolution.com/2026/05/flutter-344-dart-312-everything-new-at.html), [What's new in Riverpod 3.0](https://riverpod.dev/docs/whats_new), [GoRouter Is in Maintenance Mode](https://medium.com/@himanshusharma_4140/gorouter-is-in-maintenance-mode-where-flutter-navigation-goes-from-here-5d5762c27a32), [go_router changelog](https://pub.dev/packages/go_router/changelog), [supabase_flutter](https://pub.dev/packages/supabase_flutter), [Latest Flutter Version 3.44](https://www.cmarix.com/blog/latest-flutter-version/)

## flutter-code-reviewer
- Flutter 3.44 + Dart 3.12가 최신 스테이블(Google I/O 2026 발표) — 데스크톱 멀티윈도우, WebAssembly 렌더링 개선 등 신규 API 사용 PR은 최소 SDK 버전 정합성 확인 필요 (fluttersolution.com, io.google)
- lints 2.0 출시: `no_raw_types`·`no_dynamic_casts` 린트가 기존 strict-raw-types/strict-casts 분석 옵션을 대체 — analysis_options 마이그레이션 여부를 리뷰 체크리스트에 반영 (dart.dev, pub.dev)
- Dart에 private named parameters 신규 문법·strict language mode 도입, `simplify_variable_pattern` 등 패턴 관련 린트 추가 — `dart fix` 자동 수정 가능 항목은 수동 지적 대신 도구 적용 권장 (dart.dev)
- Impeller가 iOS·Android(API 29+) 기본 렌더러로 정착 — 리뷰 시 const 위젯, RepaintBoundary, cacheWidth/cacheHeight 지정 등 UI 4ms/Raster 4ms 프레임 예산 기준으로 성능 점검 (medium.com, dev.to)
- 공급망 보안 강화: GitHub Advisory DB·Dependabot이 Dart 공식 지원, `dart pub get` 시 보안 권고 표시 — pubspec 변경 PR은 신규 의존성의 발행 시점·advisory 확인 필수 (dart.dev, github.com)
- OWASP 'Flutter Top 10'의 M2(공급망 보안 미흡)가 별도 항목화 — 버전 고정(pinning) 남용과 방치된 패키지 사용을 리뷰 단계에서 걸러내는 관행 확산 (docs.talsec.app)

Sources: [FlutterSolution — Flutter 3.44 & Dart 3.12](https://www.fluttersolution.com/2026/05/flutter-344-dart-312-everything-new-at.html), [Google I/O 2026 — What's new in Flutter](https://io.google/2026/explore/pa-keynote-12), [Dart — What's new](https://dart.dev/resources/whats-new), [Dart linter rules](https://dart.dev/tools/linter-rules), [Medium — Flutter + Impeller 120fps in 2026](https://shindekalpesharun.medium.com/flutter-impeller-how-to-achieve-native-120fps-performance-in-2026-68ec28cc71e5), [DEV — Impeller in 2026](https://dev.to/eira-wexford/how-impeller-is-transforming-flutter-ui-rendering-in-2026-3dpd), [Dart — Security advisories](https://dart.dev/tools/pub/security-advisories), [GitHub — pub cooldown feature request](https://github.com/dart-lang/pub/issues/4791), [Talsec — OWASP Flutter M2](https://docs.talsec.app/appsec-articles/articles/owasp-top-10-for-flutter-m2-inadequate-supply-chain-security-in-flutter)

## flutter-tester
- **Patrol 4.x가 Flutter E2E 사실상 표준으로 자리매김** — 네이티브 권한 다이얼로그·시스템 UI까지 Dart로 제어하고, 4.7.0에서 iOS/macOS Swift Package Manager 지원 추가 (leancode.co, pub.dev)
- **골든 테스트 성능 개선** — 최신 Flutter에서 스냅샷 캡처 최적화·메모리 사용 감소가 이뤄졌고, `flutter_test_goldens` 같은 차세대 골든 툴킷이 golden_toolkit(유지보수 중단)의 대안으로 부상 (fluttergoldens.com, asoasis.tech)
- **Widget Previews 안정화** — 3.35에서 실험 도입된 위젯 프리뷰가 3.38+ IDE 지원으로 확장, 다양한 화면 크기·테마·텍스트 스케일에서 위젯을 샌드박스 검증하는 보조 테스트 수단으로 활용 가능 (docs.flutter.dev, blog.flutter.dev)
- **E2E 도구 선택 구도: Patrol vs Maestro vs AI 비전 기반** — Flutter 전용이면 Patrol, 크로스 프레임워크·저코드면 Maestro, 픽셀 기반 AI 비전 테스트가 신흥 옵션으로 비교되는 추세 (drizz.dev, devicelab.dev)
- **테스트 조직 베스트프랙티스 변화** — 타입별(test/unit, test/widget)이 아니라 기능별(test/login/에 유닛·위젯·통합 함께) 그룹핑이 권장 패턴으로 정착 (testguild.com, dasroot.net)
- **위젯 테스트로 전체 유저 플로우 검증** — 개별 위젯 단위를 넘어 로그인→쿠폰→주문 같은 핵심 플로우를 위젯 테스트로 커버해 통합테스트 비용을 줄이는 실전 사례 확산 (rebelappstudio.com)

Sources: [testguild.com](https://testguild.com/testing-flutter-apps/), [fluttergoldens.com](https://fluttergoldens.com/), [asoasis.tech](https://asoasis.tech/articles/2026-04-03-2053-flutter-widget-testing-golden-files/), [leancode.co](https://leancode.co/blog/everything-you-need-to-know-about-patrol), [pub.dev/packages/patrol](https://pub.dev/packages/patrol), [drizz.dev](https://www.drizz.dev/post/flutter-app-testing-in-2026-complete-guide-patrol-vs-appium-vs-vision-ai), [devicelab.dev](https://devicelab.dev/blog/flutter-testing-maestro-patrol-appium), [docs.flutter.dev](https://docs.flutter.dev/release/release-notes/release-notes-3.38.0), [blog.flutter.dev](https://blog.flutter.dev/whats-new-in-flutter-3-35-c58ef72e3766), [rebelappstudio.com](https://rebelappstudio.com/flutter-test-automation-with-widget-and-golden-tests/), [dasroot.net](https://dasroot.net/posts/2026/04/flutter-testing-widget-integration-golden-tests/)

## frontend-dev
- React Compiler가 Rust로 포팅되어 메인 저장소에 통합, 컴파일 최대 50% 고속화 — 수동 memo화는 사실상 퇴역, 자동 메모이제이션이 기본값 (infoq.com, react.dev)
- Next.js 16.3의 "Instant Navigations"로 SPA 수준 즉시 내비게이션 + 메모리 사용 최대 90% 절감, 커스텀 에러 바운더리·AI 에이전트용 버전별 문서 추가 (nextjs.org)
- Next.js 16 캐싱은 `"use cache"` 지시어 기반 Cache Components로 전환(완전 opt-in), Turbopack이 stable로 `next dev` 기본 번들러화 (nextjs.org)
- Vite 8 정식 출시(3월): Rolldown 단일 Rust 번들러 + Oxc 트랜스포머 + Lightning CSS로 빌드 10~30배 고속화, Rolldown 1.0도 5월 stable로 API 고정 (vite.dev, byteiota.com)
- Cloudflare가 VoidZero(Vite·Vitest·Rolldown·Oxc 개발사) 인수, 오픈소스 유지 약속 및 생태계 펀드 조성 — Rust 기반 JS 툴체인 표준화 가속 (vite.dev)
- React 20은 아직 미출시(최신은 19.2.7), 중첩 Suspense·에러 복구 개선 등 RFC 단계 — 현시점 베스트프랙티스는 React 19.2 + Compiler 1.0 조합 (react.dev, blog.authon.dev)

Sources: [InfoQ — React Compiler Rust port](https://www.infoq.com/news/2026/07/meta-react-compiler-rust/), [Next.js 16.3](https://nextjs.org/blog/next-16-3-instant-navigations), [Next.js 16](https://nextjs.org/blog/next-16), [Vite 8.0 발표](https://vite.dev/blog/announcing-vite8), [Rolldown 1.0](https://byteiota.com/rolldown-1-0-stable-vite-developers/), [React Compiler 1.0](https://react.dev/blog/2025/10/07/react-compiler-1)

## l10n-specialist
- AI 번역은 단일 엔진이 아닌 "시스템 운영"으로 전환 — 콘텐츠 유형·언어·리스크별 멀티엔진(LLM+MT) 라우팅과 거버넌스가 2026년 핵심 경쟁력 (localizejs.com, lingohub.com)
- 하이브리드 표준 정착: 볼륨의 80~90%는 AI, 브랜드를 좌우하는 10~20%(크리에이티브·문화 적합성)는 전문 링귀스트가 담당하는 분업이 베스트프랙티스 (phrase.com, taia.io)
- 번역 전 단계에서 브랜드 보이스·용어집·보호 용어를 중앙화하고, AI 기반 LQA를 파이프라인 초입에 배치해 사람 리뷰 전에 오류를 사전 차단하는 흐름 확산 (poeditor.com, lingohub.com)
- 지속적 현지화(continuous localization)가 기본값: 커밋 시 TMS 웹훅 트리거 → 번역 병행 → CI/CD로 자동 반영, 오픈소스로는 Tolgee·Weblate가 대표 (transifex.com, getpolyglot.ai)
- 멀티모달 현지화 부상 — 자막 타이밍 동기화, 보이스클로닝 더빙, 이미지 내 텍스트까지 한 파이프라인에서 처리하는 시스템이 트렌드 (localizejs.com)
- CLDR 48.2/ICU 78.3 릴리스(2026.3): Unicode 17 반영, Likely Subtags 확장, 상대 날짜+시간 조합 포맷 추가 — 지역 포맷(통화·날짜·숫자) 데이터 최신화 필요, CLDR 49는 10월 예정 (blog.unicode.org)

Sources: [lingohub.com](https://lingohub.com/blog/localization-trends-2026-how-ai-is-rewriting-global-content-operations), [localizejs.com](https://localizejs.com/articles/ai-translation-trends-in-2026-what-you-need-to-know), [phrase.com](https://phrase.com/blog/posts/localization-trends-2026/), [poeditor.com](https://poeditor.com/blog/ai-translation-trends-2026/), [transifex.com](https://www.transifex.com/blog/best-tools-for-software-localization-a-developers-guide-2026), [getpolyglot.ai](https://getpolyglot.ai/blog/open-source-localization-tools), [blog.unicode.org](http://blog.unicode.org/2026/03/unicode-icu-783-and-cldr-482-released.html)

## mobile-engineer
- **Flutter/Dart 2026 로드맵**: Android에서 Impeller 렌더러 마이그레이션 완료, 웹은 WASM 기본화, Primary Constructors·Augmentations 언어 기능 도입, GenUI·에이전트형 앱 아키텍처 탐색 (flutter.dev)
- **Kotlin Multiplatform(KMP) 프로덕션 성숙**: Netflix·CashApp 등 채택 확대 — 네트워킹·검증 등 공통 로직은 한 번 작성, UI는 네이티브로 유지하는 하이브리드가 크로스플랫폼 주류로 (innowise.com, volpis.com)
- **RN 신아키텍처 완전 전환**: Expo SDK 55+/RN 0.82+는 New Architecture(Fabric·TurboModules·Bridgeless) 단독 실행이 기본, EAS Build 프로젝트의 83%가 이미 적용 (docs.expo.dev, expo.dev)
- **연령 인증 의무화(2026.1.1~)**: 텍사스·유타·루이지애나 등 미국 주법으로 Apple Declared Age Range API·Google Play Age Signals API 연동 필수, 연령 데이터의 광고·프로파일링 사용 금지 (technologylaw.fkks.com, qawerk.com)
- **Google 개발자 신원 검증 확대**: 2026.9월부터 브라질·인니·싱가포르·태국에서 사이드로드 앱도 검증된 개발자(D-U-N-S 등록) 필수화, 익명 앱 배포 종료 수순 (medianama.com)
- **Apple EU DMA 대응**: 건당 CTF 폐지 → 디지털재화 매출 5% Core Technology Commission으로 전환, 2026.4.28부터 모든 신규 제출은 iOS 26 SDK 빌드 강제(구버전 업로드 차단) (blog.funnelfox.com)

## mobile-release
- **(긴급) Play 타겟 API 레벨 데드라인이 이번 달**: 8/31/2026까지 신규 앱·업데이트는 Android 16(API 36) 타겟 필수, 기존 앱은 API 35 이상 — 연장 신청 시 11/1까지 유예 (support.google.com)
- **Xcode 26 / iOS 26 SDK 빌드 의무화 이미 시행 중**: 4/28/2026부터 App Store Connect 업로드는 Xcode 26 + iOS/watchOS/tvOS/visionOS 26 SDK 빌드만 허용 — CI 러너의 Xcode 버전 점검 필수 (developer.apple.com)
- **Android 개발자 검증(Developer Verification) 8월 글로벌 확대**: 사이드로딩 포함 모든 배포 채널에 검증 요구, 8월에 고급 설치 플로우·무료 제한배포 계정 출시, 9월부터 브라질·인도네시아·싱가포르·태국 우선 시행 (developer.android.com)
- **App Store 연령등급 개편 대응 완료 확인**: 새 등급 체계(4+/9+/13+/16+/18+) 설문을 1/31/2026까지 미완료한 앱은 업데이트 제출이 차단되므로 App Store Connect에서 응답 상태 재확인 필요 (developer.apple.com)
- **App Store Connect 3.2 릴리스(4월)**: TestFlight 피드백 필터링 개선, 앱 프로모션 11개 언어 추가, 접근성(VoiceOver) 개선 — 릴리스 노트 기준 메타데이터 워크플로 업데이트 권장 (developer.apple.com)
- **CI 인증은 App Store Connect API 키(JWT) 방식이 표준**: fastlane에서도 Apple ID+2FA 대신 API 키 인증을 권장 — 세션 타임아웃 없이 파이프라인 안정성 확보 (docs.fastlane.tools)

Sources: [Apple Developer — Upcoming Requirements](https://www.developer.apple.com/news/upcoming-requirements/), [Play Console Help — Target API level](https://support.google.com/googleplay/android-developer/answer/11926878?hl=en), [Android Developer Verification](https://developer.android.com/developer-verification), [Apple Developer — Age Ratings](https://developer.apple.com/news/upcoming-requirements/?id=07242025a), [App Store Connect Release Notes](https://developer.apple.com/app-store-connect/release-notes), [fastlane docs — App Store Connect API](https://docs.fastlane.tools/app-store-connect-api/)

## store-deploy-engineer
- **Apple: 2026-04-28부터 App Store 업로드는 Xcode 26 + iOS 26 SDK 빌드 필수** — CI 러너(macOS 이미지)의 Xcode 버전을 26 이상으로 고정해야 업로드 거절을 피함 (developer.apple.com)
- **Google Play: 2026-08-31까지 기존 앱 targetSdk 35(Android 15) 이상, 신규 앱·업데이트는 API 36(Android 16) 필수** — 연장 신청은 2026-11-01까지 가능, Flutter의 `targetSdkVersion` 상향 점검 필요 (developer.android.com, support.google.com)
- **fastlane은 여전히 활발히 유지보수 중** — 최근 릴리스에서 Transporter 구식 플래그 제거와 CVE-2026-35611 보안 패치가 반영됐으니 CI에서 fastlane 버전을 최신으로 갱신 권장 (github.com/fastlane)
- **인증은 API 키 기반이 표준** — iOS는 App Store Connect API Key(p8), Android는 Google Cloud 서비스 계정 JSON을 GitHub Secrets에 저장하는 방식이 2단계 인증 강제 환경에서 유일하게 안정적 (docs.fastlane.tools)
- **Play Console 정책 강화: AAB 제출 표준화 + 전체 계정 2단계 인증 의무화, 조직 계정은 D-U-N-S 검증 필요** — 배포 자동화 셋업 시 계정 검증 상태를 사전 확인해야 함 (saastostore.com, primetestlab.com)
- **2026 파이프라인 베스트프랙티스: 4단계 구조(Prepare→Verify→Build→Distribute) + 환경 분리** — staging은 Firebase App Distribution/TestFlight, production은 스토어 제출로 나누고, 의존성 캐시·테스트 잡 분할로 피드백 속도 확보 (freecodecamp.org, gitnexa.com)

Sources: [Apple Developer News](https://developer.apple.com/news/?id=6lxhtioi), [Google Play target API requirements](https://support.google.com/googleplay/android-developer/answer/11926878?hl=en), [Android Developers](https://developer.android.com/google/play/requirements/target-sdk), [fastlane releases](https://github.com/fastlane/fastlane/releases), [fastlane App Store Connect API docs](https://docs.fastlane.tools/app-store-connect-api/), [freeCodeCamp Flutter CI/CD 가이드](https://www.freecodecamp.org/news/how-to-build-a-production-ready-flutter-ci-cd-pipeline-with-github-actions-quality-gates-environments-and-store-deployment/), [GitNexa 2026 모바일 CI/CD 가이드](https://www.gitnexa.com/blogs/mobile-app-cicd-pipeline-guide), [Google Play 정책 변경 2026](https://saastostore.com/blog/google-play-policy-changes-2026)
