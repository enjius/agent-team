---
name: knowledge-mobile-frontend
description: 모바일(Flutter)·프론트엔드 최신 지식 — UI 구현, 스토어 배포, 성능. 프론트·모바일 역할이 작업 전 참고 (갱신: 2026-08-29)
---

# mobile-frontend 도메인 지식 (2026-08-29)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## Flutter·Dart 코어
- Flutter 3.44 + Dart 3.12(Google I/O 2026)는 GenUI·에이전틱 워크플로우 중심의 아키텍처 전환 릴리스로 평가됨 (fluttersolution.com, cmarix.com)
- Android에서 Skia가 제거되고 Impeller가 유일 렌더러로 확정 — 렌더링 성능·메모리 개선 (yawarothman.medium.com)
- Material/Cupertino가 flutter/flutter 저장소에서 분리되어 독립 패키지(material_ui, cupertino_ui)로 이동 중 (flutter.dev)
- Dart 3.12에 Primary Constructor와 Augmentation 도입 — 클래스 선언·코드 생성 보일러플레이트 감소 (fluttersolution.com)
- Flutter MCP Server, Agent Skills, Agentic Hot Reload, Genkit for Dart(프리뷰) 등 AI 네이티브 툴링 공식화 (flutter.dev)
- Flutter GenUI SDK는 오픈 A2UI(Agent-to-UI) 프로토콜 기반 — AI가 위젯 레이아웃을 동적 생성 (flutter.dev)
- 웹 타깃은 WebAssembly 렌더링·접근성 개선이 계속 진행 중 (flutter.dev)
- 상태관리는 신규 프로젝트 기본값이 Riverpod 3.x(컴파일타임 안전·낮은 보일러플레이트·오프라인 퍼시스턴스), 엄격한 감사추적·대형팀은 BLoC 유지가 컨센서스 (foresightmobile.com, flutterstudio.dev)

## 크로스플랫폼 지형
- 시장 점유: Flutter ~46%, React Native 35~42%, Kotlin Multiplatform은 18개월 만에 7%→23%로 급성장 (javacodegeeks.com)
- KMP는 비즈니스 로직 공유 + 네이티브 UI(Compose/SwiftUI) 조합으로 엔터프라이즈 Kotlin 팀에서 채택 확대 (medium.com)
- React Native는 New Architecture + Hermes 개선으로 시작·런타임 성능이 크게 향상, JS/웹 인력 활용에 강점 (syedali.dev)
- 선택 기준: 픽셀퍼펙트 UI·애니메이션 중심 컨슈머 앱 = Flutter, 웹 인력·생태계 = RN, 로직 공유 + 네이티브 UX = KMP (nibblesoftware.com)
- Flutter는 차량 인포테인먼트(2026 도요타 RAV4) 등 임베디드 영역으로 확장 중 (flutter.dev)

## React·Next.js·웹 프레임워크
- Next.js 16.3(2026-08-03): Instant Navigations(SPA급 반응성), 개발서버 RAM 최대 90% 절감, 빌드 캐시 재사용, SSR 처리량 +22% (nextjs.org)
- 8월 보안 릴리스가 앞당겨져(8/25) Next.js 16.3.3·15.5.24에서 크리티컬 취약점 2건 패치 — 즉시 업그레이드 권장 (nextjs.org)
- 5월에도 React·Next.js 공동 보안 릴리스가 있었음 — 프레임워크 보안 패치 주기를 CI에 반영할 것 (netlify.com)
- React는 19.2.x 안정 라인 유지(19.2.8, 2026-07), 디코딩 성능 개선 중심 (github.com/react/react)
- Next.js가 AI 에이전트용 툴링(에이전트 친화적 빌드·개발 환경)을 1급 기능으로 내세우기 시작 (nextjs.org)
- Vercel v0 등 AI 생성 컴포넌트가 '프로덕션 인접' 품질로 올라와 Tailwind 기반 React 코드 생성이 실무 워크플로우에 편입 (netguru.com)

## 프론트엔드 툴체인·CSS
- Vite 생태계는 Rolldown(개발·프로덕션 번들 통합)과 Rust 기반 Oxc 툴체인으로 수렴 중 — 도구 수 축소·제로컨피그가 기본값 (devtoolbox.blog)
- TypeScript는 '도입'이 아니라 '엄격화' 단계: noUncheckedIndexedAccess, 배럴파일 제거, ESLint 경로 별칭 강제가 대세 (netguru.com)
- Tailwind v4가 유틸리티 퍼스트 표준으로 정착, AI 코드젠 도구와의 궁합이 채택을 가속 (medium.com)
- Container Query는 전 브라우저 Baseline — 폴리필 없이 프로덕션 사용 가능, 스타일 쿼리도 Interop 2026으로 Firefox 합류 (blog.logrocket.com)
- `:has()` 전 브라우저 100% 지원, 네이티브 중첩·cascade layers·scroll-driven animations도 2025~26년에 모두 안착 (dev.to, cssawwwards.com)
- 미디어쿼리 대신 컨테이너 쿼리 + subgrid + clamp() 조합이 반응형 컴포넌트 설계의 새 기본기 (css-zone.com)

## 스토어 배포·정책
- Apple: 2026-04-28부터 App Store 제출 시 Xcode 26 + iOS 26 SDK 빌드 필수, UIWebView 완전 제거·APNs는 HTTP/2 전용 (seasiainfotech.com)
- CI에서 Xcode 버전을 반드시 명시적으로 고정(xcodes 액션 또는 DEVELOPER_DIR) — 러너 자동 업데이트로 인한 CI 전용 빌드 실패가 빈발 (runway.team)
- macos-26 러너 + Xcode 26 조합에서 fastlane의 TestFlight 업로드 무음 실패·환경변수 오적용 이슈가 보고됨 — 파이프라인 검증 필요 (github.com/fastlane)
- Google Play: 수수료 30%→20%(구독 10%)로 개편, 제3자 결제·외부 결제 링크 허용, 품질 프로그램 참여 시 15% (appbot.co)
- 2026-07-22부터 Google Play가 미국 제3자 안드로이드 스토어에 앱 리스팅 제공 시작 — 배포 채널 다변화 (support.google.com)
- Play 타깃 API는 Android 15 이상 필수, 과도한 부분 wake lock 앱은 2026-03-01부터 랭킹 하락·경고 라벨 (theandroidnews.com)
- 2026-01-01부로 양대 스토어 모두 데이터 프라이버시 라벨·공개 요건 강화, 저품질·기만 앱 제재 확대 (appsonair.com)

## 웹 성능·Core Web Vitals
- 기준치 유지: LCP ≤2.5s, CLS ≤0.1, INP ≤200ms — INP는 여전히 가장 많이 실패하는 지표(사이트 43%가 미달) (digitalapplied.com)
- INP 악화 주범은 긴 JS 태스크·무거운 이벤트 핸들러·서드파티 스크립트·레이아웃 스래싱 — 메인스레드 분할이 핵심 처방 (koanthic.com)
- 세 지표 통과 사이트는 이탈률 24% 감소 등 비즈니스 지표와 직접 상관 (technovapartners.com)
- Next.js Instant Navigations 등 프레임워크 레벨 내비게이션 최적화가 INP 대응의 실질 수단으로 부상 (nextjs.org)
- Xcode 26 Instruments의 Run Comparison(프로파일링 세션 간 콜트리 비교)이 모바일 성능 회귀 추적에 유용 (medium.com)

## 온디바이스 AI·AI 네이티브 UI
- WWDC 2026: Apple Foundation Models가 단일 Swift API로 온디바이스 모델 + 클라우드 모델(Claude·Gemini) 접근 제공 (mindstudio.ai)
- 온디바이스 추론은 요청당 무료, 첫 다운로드 200만 미만 앱은 Private Cloud Compute도 무료 — 소규모 앱의 AI 기능 원가가 급락 (origami.sa)
- Android는 Gemini Nano가 ML Kit(AICore 시스템 서비스)에 통합 — 모델 번들 없이 요약·분류·스마트리플라이 API 호출 가능 (touchzen.ai)
- 실무 분업: 요약·리라이트 등 좁은 작업은 온디바이스 소형 모델, 개방형 추론은 클라우드로 라우팅하는 하이브리드가 표준 패턴 (newly.app)
- Flutter GenUI/A2UI, Next.js 에이전트 툴링 등 'AI가 UI를 생성·구동'하는 패턴이 양 진영에서 동시에 1급 기능화 (flutter.dev, nextjs.org)
- EU AI Act 준수가 AI 네이티브 앱 개발의 체크리스트 항목으로 등장 (foresightmobile.com)

Sources: [flutter.dev 2026 roadmap](https://flutter.dev/blog/flutter-darts-2026-roadmap), [Flutter 3.44 & Dart 3.12](https://www.fluttersolution.com/2026/05/flutter-344-dart-312-everything-new-at.html), [Next.js 16.3](https://nextjs.org/blog/next-16-3), [Next.js August security release](https://nextjs.org/blog/nextjs-security-release-august-2026-update), [Play/App Store 정책 변화](https://appbot.co/blog/google-play-app-store-changes/), [Google Play US 정책](https://support.google.com/googleplay/android-developer/answer/15582165?hl=en), [Xcode 26 의무화](https://www.seasiainfotech.com/blog/apple-mandates-xcode-26-for-app-store-submissions), [fastlane Xcode 26 이슈](https://github.com/fastlane/fastlane/issues/29743), [Core Web Vitals 2026](https://www.digitalapplied.com/blog/core-web-vitals-2026-inp-lcp-cls-optimization-guide), [컨테이너 쿼리 2026](https://blog.logrocket.com/container-queries-2026/), [상태관리 비교](https://flutterstudio.dev/blog/bloc-vs-riverpod.html), [크로스플랫폼 2026](https://www.javacodegeeks.com/2026/02/kotlin-multiplatform-vs-flutter-vs-react-native-the-2026-cross-platform-reality.html), [온디바이스 AI 가이드](https://www.touchzen.ai/blog/on-device-ai-mobile-app-development), [Apple Intelligence WWDC 2026](https://www.mindstudio.ai/blog/apple-intelligence-wwdc-2026-ai-builders-guide), [프론트엔드 트렌드 2026](https://www.netguru.com/blog/front-end-trends)
