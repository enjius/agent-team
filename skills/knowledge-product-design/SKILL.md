---
name: knowledge-product-design
description: 제품기획·디자인 최신 지식 — PM, UX, 디자인시스템, UX라이팅. 기획·디자인 역할이 작업 전 참고 (갱신: 2026-09-10)
---

# product-design 도메인 지식 (2026-09-10)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 제품기획(PM)·디스커버리
- PM 70% 이상이 AI 도구를 매일 사용, "AI는 선택이 아닌 필수"로 전환. PRD 초안 작성이 가장 흔한 AI 활용 사례 (userpilot.com, cleverx.com)
- PM 역할이 분화·재정의: 피처 관리자에서 "AI 오케스트레이션·성과 연결형 풀스택 PM"으로 이동 (userpilot.com, productschool.com)
- 디스커버리는 에피소드가 아닌 연속(continuous) 루프. AI 모더레이션 인터뷰로 UXR 없이도 20~50명 인사이트를 며칠 내 확보 (productcompass.pm, getperspective.ai)
- PRD의 실질은 디스커버리에서 나와야 함: 실제 인터뷰 트랜스크립트·VoC 데이터를 초안에 주입하는 워크플로가 베스트프랙티스 (prodmgmt.world)
- AI 기능 품질 관리를 위한 "AI Evals(평가셋·인간 주석 기반 오프라인 평가)"가 PM 핵심 스킬로 부상 (lovelaice.com)
- 바이브 코딩으로 PM이 엔지니어 없이 프로토타입을 직접 제작하는 흐름 정착, MCP가 AI-도구 연결 표준으로 안착 (institutepm.com)
- 도구 전략: 워크플로 단계별로 "가장 좋은 도구 1개"를 사되 올인원 함정을 피하고 디스커버리 단계부터 시작 (getperspective.ai)

## UX·인터랙션 디자인
- Agentic UX: 사용자가 요청하기 전 AI가 과업을 수행. 브리핑→작업 관찰→승인/수정/중단 패턴이 핵심 설계 대상 (fuselabcreative.com, mockflow.com)
- Gartner: 2026년 말 기업 앱 40%가 과업 특화 AI 에이전트 통합(2025년 5% 미만), 2030년 80%가 멀티모달 (riseuplabs.com)
- 에이전트 UI 필수 패턴: 투명성, 상태 커뮤니케이션, 오버라이드 컨트롤, 오류 복구 (fuselabcreative.com)
- AI 생성 콘텐츠·추천의 명시적 디스클로저가 윤리 요건이자 차별화 요소로 부상 (wandr.studio)
- Generative UI 표준 경쟁: Google A2UI(선언형 카탈로그 렌더), MCP Apps(코드형 앱 임베드), AG-UI(런타임 계층). Vercel json-render 오픈소스 공개 (developers.googleblog.com, thenewstack.io, infoq.com)
- NN/g State of UX 2026: UX 안정화 국면, "적응형 제너럴리스트·전략적 문제 해결"이 생존 조건. UI는 점차 차별화 요소에서 후퇴 (nngroup.com, uxlift.org)
- AI는 기존 리서치 정리에는 유용하나 실제 사용자의 "지저분한 경험"에 대한 증거를 만들 수는 없음. 인간의 방향 설정·검증 필수 (nngroup.com)
- 트렌드: 모션은 가볍고 절제된 방향, 접근성은 기본 토대, 실시간 개인화·Glassmorphism 2.0 (uxpin.com, designlab.com)

## 디자인 시스템·도구
- Figma Config 2026: Code Layers(레포를 캔버스에 클론해 디자인·코드 공존), Figma Motion(키프레임·스프링 타임라인 내장), WebGPU 셰이더 에이전트 생성, Weave 이미지 편집, 3D 트랜스폼 (figma.com, qubika.com)
- Figma MCP 서버가 양방향으로 확장: Claude Code에서 "Send this to Figma"로 렌더 결과를 편집 가능한 레이어로 변환, 에이전트가 컴포넌트 생성·토큰 동기화 (figma.com, sanjaytarani.com)
- W3C DTCG 디자인 토큰 스펙 첫 안정판(2025.10) 이후 Figma·Penpot·Sketch·Tokens Studio가 동일 포맷 내보내기, Style Dictionary v4·Terrazzo가 직접 읽음 (designtokens.org, codercops.com)
- MCP 시대 파일 구조화 지침: 컴포넌트·토큰·네이밍 규약이 정돈된 파일일수록 AI 코드 생성 품질이 올라감 (blog.logrocket.com)
- "MCP + Code Connect + AI 에디터 + 시니어 리뷰"가 디자인→코드 자동 흐름의 현실적 최선 조합 (sanjaytarani.com)
- AI 프로토타이핑 도구 역할 분담: Figma Make(기존 Figma 파일 기반 기능 프로토타입), Lovable(풀스택 MVP), v0(React 프론트엔드·대시보드) (fivecube.agency, banani.co)
- AI UI 생성이 범용 목업에서 "팀의 실제 컴포넌트 라이브러리 기반 프로덕션 품질 UI"로 진화 (uxpin.com)

## 접근성·규제
- EAA(유럽 접근성법) 2025-06-28 시행 중, 기준은 EN 301 549 = WCAG 2.1 AA. 기술 감사만이 아닌 조직 전반의 접근성 내재화 요구 (abilitynet.org.uk, getwcag.com)
- WCAG 3.0은 2026년 드래프트, 최종은 2028년 이후 예상. Bronze/Silver/Gold 등급제, VR/XR·모바일·인지장애 범위 확대. 아직 어떤 법도 3.0을 참조하지 않음 (abilitynet.org.uk, ratedwithai.com)
- 접근성 오버레이 솔루션은 법정에서 계속 패소, AI는 진단·수정 보조에 한정해 활용 (internet-pros.com)
- 홈페이지 95%에서 반복되는 기본 실패 항목(대체텍스트·명도대비·폼 라벨 등) 우선 점검 권고 (internet-pros.com)

## UX 라이팅·콘텐츠 디자인
- 정적 화면 카피에서 동적·적응형 AI 생성 콘텐츠 설계로 역할 이동. UX 라이터는 "AI 협업자"로 진화, 축소가 아닌 재정의 (frontitude.com, uxcontent.com)
- 대화형·음성 인터페이스 확대로 컨버세이션 디자인이 UX 라이팅 핵심 역량으로 부상 (uxwritinghub.com, uxcontent.com)
- AI 에이전트용 라이팅: 상태 메시지·확인 요청·오류 복구 문구 등 에이전트 UX 패턴에 맞춘 카피 체계 필요 (linkedin.com/pulse, fuselabcreative.com)
- AI 생성 카피의 편향·투명성·진정성 검수, 브랜드 보이스 정합성 확보가 라이터의 핵심 책임 (ericwongcontentstrategist.com)
- AI 디스클로저 문구(생성물 표시·추천 근거 설명)가 UX 라이팅의 새 필수 항목 (wandr.studio)
