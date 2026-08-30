---
name: knowledge-mobile-frontend
description: 모바일(Flutter)·프론트엔드 최신 지식 — UI 구현, 스토어 배포, 성능. 프론트·모바일 역할이 작업 전 참고 (갱신: 2026-08-30)
---

# mobile-frontend 도메인 지식 (2026-08-30)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## Flutter·Dart 코어

- Flutter 3.44 + Dart 3.12가 Google I/O 2026에서 공개 — 현재 안정 버전 기준선 (fluttersolution.com, cmarix.com)
- Impeller가 Android에서도 기본 렌더러가 되고 Skia는 제거 수순 — 셰이더 jank 문제가 사실상 종결 (medium.com/yawarothman)
- Material·Cupertino가 프레임워크 코어에서 분리되어 독립 패키지로 이동 중 — 업그레이드 시 의존성 정리 필요 (fluttersolution.com)
- GenUI SDK(A2UI 프로토콜 기반) 등장 — AI 에이전트가 실제 Flutter 위젯으로 화면을 동적 생성, Agentic Hot Reload도 도입 (cmarix.com)
- Dart 3.12는 private named parameter와 실험적 primary constructor 지원 추가 (dart.dev)
- Flutter가 2026 토요타 RAV4 인포테인먼트, LG webOS SDK 등 임베디드·TV로 플랫폼 확장 (devnewsletter.com)

## Flutter 상태관리·아키텍처

- 2026년 구도는 Riverpod 3 vs BLoC vs Signals 3강 체제로 정리 — 신규 프로젝트 커뮤니티 기본값은 Riverpod 3 (theflutterk.it.com)
- Riverpod 3: 컴파일 타임 안전성, BuildContext 불필요, auto-dispose, 오프라인 퍼시스턴스 내장 — 대부분 프로젝트의 1순위 권장 (foresightmobile.com)
- Riverpod 3에서 StateNotifier는 Notifier/AsyncNotifier로 대체, riverpod_annotation·riverpod_lint 사용이 표준 (medium.com)
- BLoC은 엄격한 감사 추적이 필요한 대규모·규제 산업 팀에서 여전히 표준 (softaims.com)
- Signals는 최소 리빌드·세밀한 반응성이 필요한 성능 크리티컬 앱에서 부상 (ishaqhassan.dev)
- Dart의 sealed class + 패턴 매칭을 상태 모델링에 적극 활용하는 것이 베스트 프랙티스로 정착 (medium.com)

## Flutter 성능·OTA 배포

- Impeller + AOT 컴파일로 콜드 스타트 평균 ~250ms, 120fps 고주사율 대응이 기본 기대치 (startup-house.com)
- Impeller 시대의 프로파일링 병목은 래스터화가 아니라 위젯 빌드·레이아웃 연산 — 최적화 초점 이동 (medium.com/codetodeploy)
- 릴리스 전 `--split-debug-info`로 APK/IPA 크기 축소는 필수 체크리스트 (dev.to)
- Shorebird가 사실상 유일한 프로덕션급 Flutter code push — Dart 코드 diff 기반 OTA 패치를 스토어 심사 없이 배포 (docs.shorebird.dev)
- Shorebird는 Android·iOS·macOS·Linux·Windows 지원, 단계적 롤아웃·패치 서명 등 통제된 배포 패턴이 정착 (medium.com)

## 스토어 배포·정책

- 2026-04-28부터 App Store 제출은 Xcode 26 빌드 + iOS 26 계열 SDK 타겟 필수 (appbot.co)
- UIWebView 완전 퇴출(WKWebView 필수), 레거시 APNs API 종료 — APNs HTTP/2 서버 필수 (toslawyer.com)
- Google Play 수수료 인하: 신규 인앱결제 20%, 구독 10% + 제3자 결제·외부 결제 링크 허용 확대 (appbot.co)
- Play Store 타겟 API 레벨 최소 35(Android 15)로 상향 — 미충족 시 게시·업데이트 불가 (theandroidnews.com)
- 2026-03-01부터 과도한 partial wake lock 등 배터리 남용 앱은 노출 저하 + 경고 라벨 부착 (saastostore.com)
- Data Safety 섹션 단속 강화 — 민감 데이터 접근은 강한 정당화 필요, 미국 주별 App Store Accountability 법 대응도 요구됨 (appsonair.com)

## React·웹 프레임워크

- Next.js 16.3: App Router Instant Navigations 도입, dev 서버 RAM 최대 90% 절감 (nextjs.org)
- 2026-08-25 Next.js 보안 릴리스(16.3.3 / 15.5.24)로 크리티컬 취약점 2건 패치 — 즉시 업그레이드 대상 (nextjs.org)
- React Compiler 네이티브 롤아웃 진행 중, React 19.3 임박 (thisweekinreact.com)
- React Native 0.87 출시, v1.0 준비 단계 — 0.83부터 레거시 아키텍처(브리지)는 deprecated가 아니라 완전 삭제 (thisweekinreact.com, medium.com)
- RN 신아키텍처(JSI+Fabric+TurboModules) 벤치마크: 리스트 렌더 43% 개선, 스크롤 프레임 드랍 95% 감소, 메모리 33% 절감 (bolderapps.com)
- Hermes v1이 RN 기본 엔진으로 전환 중, Reanimated·Nitro 모듈 등 생태계가 신아키텍처 전제로 재편 (callstack.com)
- TypeScript 7.0 GA(2026-07-08): Go 네이티브 컴파일러로 풀 빌드 8~12배 가속, VS Code 프로젝트 로드 1분→10초 (devblogs.microsoft.com, infoq.com)

## CSS·웹 플랫폼

- Container style query(부모 커스텀 프로퍼티 기반 스타일 분기)가 2026-05 Firefox 151로 Baseline Newly Available 달성 (web.dev)
- `:has()` 셀렉터가 2026-06 Baseline Widely Available 도달 — 폴리필 없이 프로덕션 사용 가능 (buildmvpfast.com)
- 컨테이너 크기 쿼리·CSS 네스팅은 이미 Widely Available — 미디어쿼리 대신 컴포넌트 단위 반응형이 기본기로 정착 (blog.logrocket.com)
- `:open` 의사클래스, `contrast-color()`, Custom Highlight API 등이 2026년 Baseline 합류 (web.dev)
- Interop 2026 기준 주요 신기능이 Chrome·Firefox·Safari·Edge 전부에서 동작 — "Safari 때문에 못 쓴다"는 전제 재점검 필요 (dualmedia.com)

## 웹 성능 (Core Web Vitals)

- 2026년 기준 지표는 LCP ≤2.5s, INP ≤200ms, CLS ≤0.1 — 실사용자 75퍼센타일 측정, 3개 동일 가중 (nitropack.io)
- INP가 가장 많이 실패하는 지표 — 사이트 43%가 200ms 기준 미달, 50ms 초과 long task 분해가 핵심 (digitalapplied.com)
- LCP 개선 4대 수단: 이미지 preload, 크리티컬 CSS 인라인, 폰트 preload+swap, SSR (codeminer.co)
- CLS는 이미지·비디오·iframe·광고 슬롯에 명시적 width/height 지정이 기본 (technovapartners.com)
- 3개 지표 모두 통과한 사이트는 이탈률 24% 낮음 — 성능이 곧 전환율이라는 근거 데이터 축적 (solidappmaker.com)

## AI 개발 워크플로

- 2026년 표준 흐름: v0/Lovable/Figma Make로 프로토타입 → Cursor/Windsurf에서 정제 → Claude Code/Codex에 반복 작업 위임 후 출시 (eesel.ai)
- v0는 React+Next.js+Tailwind+shadcn/ui 스택 특화 프롬프트-투-컴포넌트 생성기 — 누적 사용자 400만+ (banani.co)
- Anima·Locofy.ai·Builder.io Visual Copilot 등 design-to-code 도구로 Figma 프레임을 1차 컴포넌트로 변환하는 패턴 보편화 (ssojet.com)
- AI 생성 코드는 소유권 유지·리뷰 후 기존 도구로 이어 개발하는 것이 권장 워크플로 — 통짜 생성 의존은 지양 (dev.to)
- Flutter 쪽도 GenUI·Agentic Hot Reload로 AI 네이티브 개발 루프가 프레임워크 차원에 편입되는 추세 (cmarix.com)
