---
name: knowledge-mobile-frontend
description: 모바일(Flutter)·프론트엔드 최신 지식 — UI 구현, 스토어 배포, 성능. 프론트·모바일 역할이 작업 전 참고 (갱신: 2026-09-10)
---

# mobile-frontend 도메인 지식 (2026-09-10)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## Flutter SDK·Dart 언어
- Flutter 3.47(2026-08-12, Dart 3.13) 안정판: material_ui·cupertino_ui 1.0 독립 패키지화로 코어 SDK와 별도 갱신 가능 (flutter.dev, codewithandrea.com)
- Impeller가 macOS·Windows·Linux 데스크톱까지 기본 렌더러로 확대, 옵트아웃은 임시이며 향후 제거 예정 (docs.flutter.dev)
- Widget Previews 안정화: 로컬 빌드 캐시·실시간 검색/필터로 위젯 단위 미리보기 워크플로 정착 (flutter.dev)
- Dart 3.13에서 primary constructors 안정화, private named parameters·pub workspace·JS interop·네이티브 트리셰이킹 개선 (dart.dev)
- Dart 매크로는 공식 중단, 대안으로 augmentations를 독립 기능으로 출시 예정이므로 코드젠(build_runner) 의존은 당분간 유지 (dart.dev)
- Windows·Linux에 flavors 도입, 데스크톱 멀티윈도우 API 실험 확장(Canonical 주도), Xcode 27·차기 Apple OS 대비 완료 (docs.flutter.dev)
- 스타일러스 입력·트랙패드 상호작용 개선으로 태블릿 UX 구현 범위 확대 (blog.flutter.dev)

## Flutter 성능·아키텍처
- Impeller 기본화(iOS·Android API 29+·데스크톱)로 셰이더 컴파일 jank 해소, 빌드 파이프라인의 `--cache-sksl` 등 SkSL 워밍업 제거 권장 (dev.to, medium.com)
- 120Hz 대응 프레임 예산: UI 스레드 ~4ms + Raster 스레드 ~4ms, Profile 모드 DevTools Performance 탭으로 측정 (flutterstudio.dev)
- const 위젯 적극 사용, 리빌드 범위 최소화, 커스텀 셰이더는 Impeller에서 사전 컴파일되어 부담 적음 (dev.to)
- 상태관리는 Riverpod 3.x(@riverpod 코드젠)가 신규 프로젝트 기본 권장, 규제 산업·대규모 팀은 BLoC, 성능 민감 UI는 Signals 부상 (foresightmobile.com, sharpskill.dev)
- 앱 크기·시작시간: deferred components로 비핵심 화면 지연 로드, WebP 전환(30~70% 절감), 미사용 패키지·에셋 제거 (technaureus.com, medium.com)
- 사용자 기대치 기준: 콜드 스타트 2초 이내, 60fps 스크롤, 100ms 이내 응답 (dev.to)

## Flutter 웹·AI 개발도구
- 웹 stateful hot reload 기본 활성(3.35+), 내비게이션·폼 입력·스크롤 위치 유지 (docs.flutter.dev)
- Wasm 빌드: JS 빌드 + Wasm dry run 2단계로 준비도 경고 출력, Wasm 기본화는 2026 로드맵 진행 중이며 대시보드·어드민·내부툴에 실용 단계 (instaflutter.com, docs.flutter.dev)
- 공식 Dart/Flutter MCP 서버: 프로젝트 분석·analyzer 결과·CLI·실행 중 앱 스크린샷/위젯 인스펙션/hot reload를 AI 에이전트에 노출, `.agents/mcp_config.json`으로 설정 (dart.dev)
- Gemini CLI Flutter 확장·Antigravity·Cursor·Copilot에서 MCP 연동 지원, Agentic Hot Reload가 I/O 2026에서 공개 (docs.flutter.dev/ai)
- Genkit Dart 지원으로 Dart 백엔드/앱 내 LLM 워크플로 구성 가능 (dart.dev)

## Flutter 테스트·CI/CD
- E2E: Patrol(Dart 네이티브, 네이티브 위젯 탭 가능하나 CI 안정성 이슈 보고) vs Maestro(YAML, 안정성·낮은 학습곡선, 빌드된 APK/IPA 대상) 병행 검토 (devicelab.dev, drizz.dev)
- Codemagic이 Patrol·Maestro·Shorebird 공식 통합 제공, 실기기 Android·iOS 시뮬레이터 테스트 자동화 (codemagic.io)
- Shorebird 코드 푸시로 Dart 변경분을 스토어 심사 없이 배포, CI 워크플로에 패치 단계 추가 권장 (blog.codemagic.io)
- 테스트 피라미드: 단위·위젯 테스트 중심, integration_test는 핵심 플로우로 한정해 CI 시간 관리 (medium.com)

## iOS 배포·플랫폼 요구사항
- 2026-04-28부터 Xcode 26·iOS 26 SDK 빌드 필수, 구버전 SDK 빌드는 App Store Connect 거부 (developer.apple.com)
- iOS 26 SDK 빌드 시 네이티브 컨트롤에 Liquid Glass 자동 적용, 이전 룩 유지하려면 명시적 옵트아웃·UI 회귀 테스트 필요 (dev.to)
- Flutter Cupertino 위젯은 Liquid Glass 미대응, 공식 재구축은 2026 하반기 예상이며 당장은 cupertino_native·adaptive_platform_ui·liquid_glass_widgets 활용 (github.com/flutter, pub.dev)
- 연령 등급 세분화(4+/9+/13+/16+/18+) 응답 2026-01-31 기한 완료 상태 확인, 소셜미디어 기능 선언은 2026-09부터 신규·업데이트 앱 필수 (developer.apple.com, ecorpit.com)
- Privacy Manifest·Required Reason API 선언은 앱과 서드파티 SDK 모두 필수, 미기재 시 심사 거부 (developer.apple.com)
- Declared Age Range API로 연령대 데이터 요청 가능, 심사 초점은 데이터 투명성·AI 기능 공개·명확한 가격 표기 (lexogrine.com)

## Android 배포·플랫폼 요구사항
- 2026-08-31부터 신규·업데이트 앱은 Android 16(API 36) 타깃 필수, 기존 앱은 API 35 이상이어야 노출 유지, 연장 신청 시 2026-11-01까지 (support.google.com)
- 16KB 페이지 크기 지원은 API 35+ 앱에 이미 필수(2025-11-01~), 네이티브 라이브러리(.so) 재빌드·플러그인 의존성 점검 (support.google.com)
- Android 개발자 검증: Play Console 앱 등록 2026-09-30까지 완료 필요, 브라질·인도네시아·싱가포르·태국 우선 적용 후 2027 이후 글로벌 확대 (android-developers.googleblog.com)
- 미검증 개발자 앱은 8월부터 '고급 플로우'로만 사이드로드 가능, 내부 배포 앱도 등록 정책 영향 여부 확인 (support.google.com)
- 익명·랜덤 채팅 앱은 Families 정책에서 아동 대상 금지 등 2026-07-15 정책 개정 반영 (support.google.com)
- Expo SDK 54 이후 Android 16 edge-to-edge 기본 렌더링이므로 시스템 바 인셋 처리 점검 (expo.dev)

## React Native·Expo
- Expo SDK 55(2026-02): RN 0.83·React 19.2, Legacy Architecture 지원 삭제로 New Architecture만 지원, `newArchEnabled` 플래그 제거 (expo.dev)
- Hermes v1 도입으로 성능·모던 JS 기능 지원 개선, OTA 업데이트는 Hermes 바이트코드 diff로 다운로드 75% 감소 (x.com/expo)
- Expo Router v7, expo-brownfield 패키지로 기존 네이티브 앱에 격리형 통합, MCP·에이전트 스킬 등 AI 툴링 내장 (expo.dev)
- SDK 54의 iOS 사전 컴파일 빌드로 최대 10배 빠른 빌드, iOS 26 Liquid Glass 지원 포함, SDK 56 베타 진행 중 (expo.dev)
- Expo UI 라이브러리 1.0 안정판 2026 중반 목표, 네이티브 컴포넌트 기반 UI 채택 검토 (medium.com)

## 웹 프론트엔드 프레임워크·툴링
- Next.js 16: Turbopack 기본 번들러, `use cache` 기반 Cache Components, 네이티브 View Transitions, 클라이언트 라우팅 전면 개편, MCP 기반 DevTools (nextjs.org)
- React 19.2: `<Activity>`, useEffectEvent, cacheSignal, Partial Pre-rendering, Performance Tracks, Suspense 일괄 공개 (nextjs.org, dev.to)
- Vite 8: Rust 기반 Rolldown이 esbuild·Rollup을 단일 대체, 프로덕션 빌드 1.6~7.7배 고속화 (vite.dev)
- TypeScript 7 Go 네이티브 컴파일러로 10배 이상 속도 향상, Oxlint(ESLint 대비 50~100배)·Oxfmt(Prettier 대비 30배) 채택 확산 (theregister.com, cpojer.net)
- Tailwind v4: CSS-first `@theme` 설정, Lightning CSS 엔진으로 빌드 5배 고속화, `bg-linear-to-*`·`shrink-0` 등 클래스명 변경 마이그레이션 필요 (blog.logrocket.com)
- 모던 CSS 실전 도입 단계: 컨테이너 쿼리·`:has()`·`@scope`·`@starting-style`·스크롤 기반 애니메이션은 안전, anchor positioning·`if()`·Grid Lanes는 브라우저 지원 확인 후 사용 (nerdy.dev, polgubau.com)

## 웹 성능·접근성
- Core Web Vitals 기준 유지: LCP 2.5s·INP 200ms·CLS 0.1 이하(CrUX 28일 p75), INP가 가장 많이 실패(43%)하는 지표 (corewebvitals.io, dev.to)
- LCP 개선 4대 축: 히어로 이미지 preload, critical CSS 인라인, 폰트 preload + display swap, SSR (dev.to)
- INP 개선: 불필요 스크립트 제거, 긴 태스크 분할, 서드파티 스크립트 지연 로드 (senorit.de)
- CLS 예방: 이미지·비디오·iframe·광고 슬롯 명시적 크기 지정, 동적 콘텐츠 영역 예약 (innovisionbiz.com)
- EAA(유럽 접근성법) 2025-06-28 시행, 민간 서비스도 EN 301 549(WCAG 2.1 AA 포함) 준수 대상 (levelaccess.com)
- WCAG 3.0은 2026-03 워킹드래프트로 아직 미확정, 현행 의무는 WCAG 2.2 AA 기준으로 대응 (w3.org, levelaccess.com)
- 자동 검사 도구만으로 부족, 키보드 내비게이션·스크린리더 수동 검증 필수이며 접근성 오버레이는 법적 방어력 낮음 (internet-pros.com)
