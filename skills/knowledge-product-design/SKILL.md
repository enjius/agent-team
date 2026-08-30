---
name: knowledge-product-design
description: 제품기획·디자인 최신 지식 — PM, UX, 디자인시스템, UX라이팅. 기획·디자인 역할이 작업 전 참고 (갱신: 2026-08-30)
---

# product-design 도메인 지식 (2026-08-30)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 제품기획(PM)
- PM 역할이 기능 관리에서 'AI 오케스트레이션' 중심으로 재정의되는 중 — 리서치·문서화·리스크 플래깅을 전문 에이전트들이 나눠 수행하는 연결 워크플로가 표준화 (airtable.com, userpilot.com)
- 2026년 기대치는 '풀스택 PM' — 시장조사, 가격 실험, 크리에이티브 브리프, 활성화 퍼널까지 성과와 연결해 넘나드는 역할 (productschool.com)
- AI가 업계 뉴스·경쟁사 출시·고객 감성 등 수천 개 신호를 스캔해 경쟁분석·시장조사를 자동 합성하는 것이 선도 팀의 기본 (airtable.com)
- 지표가 사용량에서 임팩트로 이동 — "AI 어시스턴트 사용 고객의 지원 티켓 30% 감소" 같은 성과 기반 지표로 우선순위 결정 (institutepm.com)
- AI 산출물의 편향·공정성 점검(bias testing)이 PM 워크플로의 표준 단계로 정착 (chatprd.ai)
- AI 코딩 에이전트 확산으로 팀 구성비 역전 전망 — Andrew Ng는 "PM 1 : 엔지니어 4"에서 "PM 2 : 엔지니어 1"로의 전환을 예측 (news.aakashg.com)
- 승리하는 팀은 AI·디자인·실험을 기본 작업 방식으로 삼고, PM 육성도 GTM·포지셔닝·사업전략까지 확장 (productschool.com)

## UX·인터페이스 트렌드
- '차분한 인터페이스(calm UI)'가 주류 — 인지 부하 축소, 시각적 과시 제거, 과한 게이미피케이션 대신 절제된 마이크로인터랙션 (elements.envato.com)
- AI 개인화가 UX의 기본값이 되며 정적 화면에서 의도 인지형·적응형 여정으로 전환 (riseuplabs.com)
- AI를 '전지적 오토파일럿'이 아닌 '사려 깊은 코파일럿'(존재하되 선택적, 맥락 존중)으로 설계하는 방향 전환 (tubikstudio.com)
- 접근성이 컴플라이언스를 넘어 핵심 설계 기준으로 — 매출·조달·제품 신뢰도에 직접 영향 (uxdesigninstitute.com)
- 디지털 탄소발자국을 고려한 지속가능한 디자인이 공식적 기대치로 격상 (uxdesigninstitute.com)
- 글래스모피즘 2.0, 노스탤지어 UI, 공간(spatial) 사고 기반 차원적 디자인이 비주얼 트렌드 — Vision Pro·Quest 영향 (index.dev)
- 채팅·음성·화면·자동 워크플로를 넘나드는 멀티모달 인터랙션이 표준 기대치로 (tblocks.com)

## 에이전틱 AI UX 패턴
- 모든 엔터프라이즈 에이전트에 적용되는 5대 패턴: 계획 가시화, 도구 사용 공개, 메모리 표면화, 다단계 워크플로 추적, 복구 라우팅 (mantlr.com)
- '점진적 위임(progressive delegation)' — 사용자의 승인 이력이 자율성 확장 속도를 결정, 신뢰를 입증하며 권한을 얻는 구조 (smashingmagazine.com)
- '요청 시 설명(explainability on demand)' — 기술 설명 폭격 없이 필요할 때만 추론 근거를 여는 패턴이 핵심 (medium.com/@pro.namratapanchal)
- 신뢰는 투명성과 통제에서 나옴 — 매 단계 오버라이드 제공, 명확한 undo, 수행 기록으로 우아한 실패 설계 (fuselabcreative.com)
- 온보딩은 '목표 우선' — 튜토리얼 대신 첫 인터랙션에서 에이전트가 워크플로를 즉시 만들어 가치를 증명 (studiomaydit.com)

## 디자인 시스템·도구 (Figma)
- Config 2026 핵심: Code Layers(디자인-개발 갭 축소), 캔버스 내장 애니메이션 타임라인(키프레임·스프링), 프롬프트 기반 Shader Effects (qubika.com, help.figma.com)
- Figma AI Agent 대폭 강화 + Weave 통합 — 캔버스에서 배경 교체·로고 합성·프롬프트 이미지 생성 (chulbuldesign.com)
- Variables가 String·Boolean·Composite(그림자·보더 묶음) 타입까지 확장, 모드로 라이트/다크·브랜드·밀도를 단일 구조로 관리 (sashikiran.com)
- 변수 import/export로 Figma↔코드 저장소 토큰 동기화 — 토큰 변경 시 CD 파이프라인이 PR 생성·Storybook 갱신·Slack 알림까지 자동화 (supernova.io)
- 상호운용성을 위해 DTCG(Design Tokens Community Group) 표준 채택이 미래 대비 시스템의 기본 (atomize.tools)
- 토큰 export에 '왜 이 값인지' 컨텍스트 메타데이터가 포함돼 핸드오프가 양방향화 (sashikiran.com)

## AI 프로토타이핑
- 2026년은 AI 프로토타이핑 원년 — Figma Make, Lovable, v0, Bolt, Replit, Base44가 주력 도구군 (banani.co, flowstep.ai)
- 3대 패러다임: 디자인→코드(Figma Make), 프롬프트→프로토타입, AI 비주얼 빌더 — 디자인 파일 없이 자연어로 동작하는 앱 생성 (vibecoding.app)
- 도구 선택 기준: Lovable은 비개발자·디자이너 친화(클라우드·비주얼 편집·에이전트 모드), v0는 React 아는 개발자용, Bolt는 기술 유연성 (news.aakashg.com)
- 좋은 AI 프로토타이핑 도구의 조건은 '디자인·제품·엔지니어링 사이에 앉는 것' — 부서 간 공용 도구로 자리매김 (flowstep.ai)
- Config 2026 시연 플로우: AI Agent로 UI 생성 → Figma Design 다듬기 → Make로 코드화 → Buzz로 마케팅 에셋 → Slides로 발표까지 단일 파이프라인 (medium.com)

## UX 라이팅·콘텐츠 디자인
- UX 라이터·콘텐츠 디자이너 수요 지속 증가, 전용 UX 라이팅 도구 생태계 부상 (uxdesigninstitute.com)
- 콘텐츠도 '차분함' 지향 — 결정 개수 최소화, 여백·명확한 기본값·콘텐츠 위계 우선 설계 (wix.com)
- UX 번역·로컬라이제이션의 중요성 급상승 — 글로벌 제품에서 전문 역량으로 분화 (uxdesigninstitute.com)
- 규제 대응이 콘텐츠 설계의 전제 — 유럽 접근성법(EAA) 시행 중(2030년 전 제품 적용), 미국 ADA 디지털 개정 진행, 호주·캐나다·인도·브라질도 강화 (uxcontent.com)
- AI 기능의 카피는 '투명한 AI' 원칙 — AI 개입 여부·한계를 명시하는 라이팅이 신뢰 요소로 (elements.envato.com)

Sources: [Airtable](https://www.airtable.com/articles/product-management-trends) · [Userpilot](https://userpilot.com/blog/product-management-trends/) · [Product School](https://productschool.com/blog/product-fundamentals/product-management-trends) · [InstitutePM](https://www.institutepm.com/knowledge-hub/ai-product-management-2026) · [UX Design Institute](https://www.uxdesigninstitute.com/blog/the-top-ux-design-trends-in-2026/) · [Envato](https://elements.envato.com/learn/ux-ui-design-trends) · [Smashing Magazine](https://www.smashingmagazine.com/2026/02/designing-agentic-ai-practical-ux-patterns/) · [Mantlr](https://mantlr.com/blog/designing-for-ai-agents-ux-patterns-2026) · [Qubika](https://qubika.com/blog/figma-config-2026-announcements-for-designers/) · [Figma Help](https://help.figma.com/hc/en-us/articles/39582753756695-What-s-new-from-Config-2026) · [Supernova](https://www.supernova.io/blog/the-future-of-enterprise-design-systems-2026-trends-and-tools-for-success) · [Aakash G](https://www.news.aakashg.com/p/ai-prototyping-tutorial) · [Flowstep](https://flowstep.ai/blog/ai-prototype-generator/) · [UXCC](https://uxcontent.com/content-design-in-2026/)
