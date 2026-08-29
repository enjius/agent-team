---
name: knowledge-product-design
description: 제품기획·디자인 최신 지식 — PM, UX, 디자인시스템, UX라이팅. 기획·디자인 역할이 작업 전 참고 (갱신: 2026-08-08)
---

# product-design 도메인 지식 (2026-08-08)

> 역할별 에이전트 KNOWLEDGE 블록을 도메인 단위로 통합한 지식 베이스.
> `agent-team learn --domains` 가 이 파일을 통째로 갱신한다.

## analyst
- **스펙 주도 개발(SDD)이 사실상 표준화** — 버전 관리되는 스펙(요구사항→계획→태스크→코드)이 단일 진실 원천이 되고, GitHub Spec Kit 등 도구가 Claude Code·Copilot·Cursor 등 주요 AI 코딩 에이전트와 통합됨 (github.blog, dev.to)
- **EARS 구문이 AI 에이전트용 수용조건의 사실상 표준** — 5개 패턴이 트리거·범위·응답을 모호성 없이 명세해 테스트 케이스와 거의 1:1 매핑, 에이전트가 추측 없이 구현·검증 가능 (thebcms.com, augmentcode.com)
- **수용조건은 "체크 가능"하게: 형용사를 숫자로** — 'fast'가 아니라 'p95 200ms 미만'처럼 측정 가능한 임계값 필수; AI 에이전트는 사람과 달리 즉시 추측해 커밋하므로 모호한 AC가 곧바로 프로덕션 버그로 직결 (earezki.com, telos-ai.org)
- **AI 기반 요구사항 관리 도구가 실무 정착** — 작성 워크플로우 안에서 모호성·검증불가 요구사항 실시간 플래깅, 상류 변경 시 영향받는 테스트·설계·리스크 항목까지 추적 링크 자동 갱신 (jamasoftware.com, getxray.app)
- **AI 생성 요구사항의 QA 게이트 필수화** — LLM이 뽑은 요구사항은 그럴듯하지만 엣지케이스 누락·도메인 규칙 오류가 흔해, INVEST 린트·갭 분석·경계값/보안 시나리오 자동 보강 등 검증 단계가 베스트프랙티스로 부상 (henix-blog.medium.com, ones.com)
- **분석가 역할이 '요구사항 수집가'에서 전략 파트너로 이동** — AI 거버넌스·윤리 보드 참여, 측정 가능한 비즈니스 성과 정의가 핵심 역량으로 부상하고 BA 자격 커리큘럼에 거버넌스·규제 모듈이 표준 포함 (iiba.org)

Sources: [GitHub Blog — Spec Kit](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/) · [SDD 2026 Guide](https://www.thebcms.com/blog/spec-driven-development/) · [dev.to — SDD in 2026](https://dev.to/krlz/spec-driven-development-in-2026-what-it-is-the-tooling-and-how-teams-actually-use-it-2fk2) · [Augment Code — SDD/EARS](https://www.augmentcode.com/guides/what-is-spec-driven-development) · [Jama — AI Requirements Management](https://www.jamasoftware.com/blog/ai-requirements-management/) · [Xray — AI in RE](https://www.getxray.app/blog/ai-in-requirements-engineering) · [Checkable AC for AI Agents](https://earezki.com/ai-news/2026-06-03-i-changed-how-i-write-acceptance-criteria-and-my-ai-agent-stopped-building-the-wrong-thing/) · [Henix — AI-Generated Requirements QA](https://henix-blog.medium.com/ai-generated-requirements-are-dangerous-without-qa-8a8c6b9dbf91) · [IIBA — BA Trends 2026](https://www.iiba.org/business-analysis-blogs/top-6-business-analysis-trends-to-monitor-in-2026/)

## design-lead
- 프로덕션 실무는 AI가 압축되고, 디자인 리더의 핵심 역량은 방향 설정·거버넌스·크로스펑셔널 리더십으로 이동 — 문서화·반복작업 자동화에 AI 활용 기대가 가장 높음 (report.zeroheight.com)
- 디자인 토큰은 DTCG 표준 채택 + Style Dictionary 등 트랜스파일러 파이프라인이 베스트프랙티스로 정착, 단일 소스에서 멀티플랫폼 출력이 기본 (supernova.io, timgraf.com)
- 에이전틱 AI가 Figma·Jira·GitHub를 넘나들며 디자인 드리프트를 프로덕션 도달 전에 감지하고 브랜드·접근성 준수를 자동 검사하는 거버넌스 자동화가 확산 (supernova.io)
- Figma Config 2026에서 AI 에이전트·코드 네이티브 디자인·플러그인 생성 자동화 공개, 8월엔 동시 다중 AI 이미지 편집 지원 — 디자인 툴이 AI 제품 제작 생태계로 진화 (help.figma.com, releasebot.io)
- "바이브 디자이닝"(프롬프트-to-UI)으로 프로토타입이 기본 산출물화(응답자 43%), 매니저 46.6%가 직접 바이브 코딩 — 병목은 툴이 아니라 팀 학습 시간 (survey.uxtools.co)
- 디자이너-디자인 엔지니어 역할 경계가 흐려지며, 성능·접근성·전환·브랜드가 교차하는 지점의 판단이 인간 고유 업무로 부상 — AI 산출물은 Stark·axe 등으로 접근성 검수 필수 (peerlist.io, stateofaidesign.com)

Sources: [zeroheight Design Systems Report 2026](https://report.zeroheight.com/), [Supernova — Enterprise Design Systems 2026](https://www.supernova.io/blog/the-future-of-enterprise-design-systems-2026-trends-and-tools-for-success), [Tim Graf — Design Token Architecture 2026](https://timgraf.com/ui/design-token-architecture-2026-the-strategic-blueprint-for-scalable-design-systems/), [Figma — What's new from Config 2026](https://help.figma.com/hc/en-us/articles/39582753756695-What-s-new-from-Config-2026), [Releasebot — Figma August 2026](https://releasebot.io/updates/figma), [UX Tools — State of Prototyping Spring 2026](https://survey.uxtools.co/spring-2026), [Peerlist — Rise of the Design Engineer 2026](https://peerlist.io/shuvrojit/articles/the-rise-of-the-design-engineer-in-2026), [AI in Design Report 2026](https://stateofaidesign.com/chapters/craft)

## design-visual
I have enough to synthesize. Producing the bullets:

- **W3C Design Tokens 표준 정착**: `$value`/`$type` 구문이 사실상 표준이 되며 토큰 도입률이 56%→84%로 급증, 「Figma Variables → Style Dictionary → W3C DTCG 포맷」이 2026 표준 토큰 파이프라인으로 굳어짐 (figma.com, oneminutebranding.com)
- **AI는 양(volume), 사람은 판단(taste)**: AI로 다방향 시안·스타일 조합을 빠르게 생성하되 브랜드 보이스에 맞는 최종 결정은 디자이너가 하는 협업 워크플로우가 베스트프랙티스로 자리잡음 (renderforest.com, designmantic.com)
- **AI 코드젠엔 토큰이 필수**: 온-브랜드 유지를 위해 codegen·AI-assisted UI 개발이 토큰 파일에 의존 — 잘 설계된 semantic 토큰 체계가 모든 산출물의 브랜드 일관성을 지키는 핵심 인프라가 됨 (themasterly.com, digitalapplied.com)
- **정적 → 어댑티브·모듈러 브랜드 시스템**: 고정 로고·비주얼 대신 재조합 가능한 모듈형 컴포넌트와 상황에 맞게 변형되는 어댑티브 아이덴티티로 전환 (supercharged.studio, think.design)
- **모션·3D/공간감의 기본화**: 로고·타이포·그래픽을 처음부터 움직임 전제로 설계하고, 플랫 디자인을 3D·깊이·레이어드 시스템이 대체/보강 (designmonks.co, lettermine.com)
- **사운드 아이덴티티 + 지속가능성 내재화**: 오디오 큐·토널 일관성이 브랜드 표현의 필수 요소로, 경량 웹·최적화 이미지·효율 코드가 '친환경 배지'가 아닌 기본 제작 관행으로 편입 (erahaus.com, renderforest.com)

## planner-content
I have enough for the synthesis. No further searches needed.

- AI가 마이크로카피(버튼·에러·툴팁) 초안을 담당하고, 라이터는 보이스·전략·복잡한 저니 설계로 역할 이동 — 사람은 톤 일관성·A/B 변형 검수에 집중 (uxcontent.com, ericwongcontentstrategist.com)
- 콘텐츠 디자이너의 신영역: 프론티어 LLM 사후학습(post-training)·에이전트 오케스트레이션의 컨텍스트 설계에 UX라이팅 역량이 투입됨 (uxcontent.com)
- "Calm interface" 기조 — 게이미피케이션·과한 모션 대신 인지부하 절감, 문구·결정 수 최소화, 전략적 마이크로인터랙션으로 이동 (envato.com, vezadigital.com)
- 정보구조 원칙 강화: 능동태·구체적 액션 라벨·용어 일관성·접근성/포용 문구를 기본값으로, 6~12개월 주기 콘텐츠 감사(content audit)로 노후 문구 정리 (designstudiouiux.com, parallelhq.com)
- 툴 트렌드: Figma 내 텍스트 편집으로 UI 맥락 안에서 카피 작성, Punkt 같은 "Content First" 통합 콘텐츠 디자인 플랫폼으로 문구 자산 중앙화 (figma.com, uxcontent.com)
- 대화형·멀티모달·개인화 UX 확산으로 챗/음성 인터페이스용 카피와 적응형(다이내믹) 콘텐츠 설계 수요 증가 (vezadigital.com, figma.com)

Sources: [UXCC 2026 예측](https://uxcontent.com/content-designers-predict-2026), [Content design in 2026](https://uxcontent.com/content-design-in-2026/), [Eric Wong: UX Writing 2026](https://www.ericwongcontentstrategist.com/post/the-definitive-guide-to-ux-writing-2026-how-ai-is-changing-microcopy-forever), [Envato UX/UI trends 2026](https://elements.envato.com/learn/ux-ui-design-trends), [Veza Digital AI UX trends](https://www.vezadigital.com/post/ai-ux-ui-design-trends), [DesignStudio best practices](https://www.designstudiouiux.com/blog/ux-writing-best-practices/), [Figma AI tools for UX](https://www.figma.com/resource-library/ai-tools-for-ux-designers/)

## planner-service
- **PRD의 경쟁력이 "빠른 작성"에서 "선명한 사고"로 이동** — 날카로운 문제정의·타깃·성공기준을 AI에 주는 기획자가 이기며, AI 초안은 완성본이 아닌 "리뷰 대상 첫 초안"으로 다루는 게 표준 (chatprd.ai, ainna.ai)
- **AI 기능 명세는 결정론적 앱과 다르게 써야 함** — 확률적 동작을 전제로 실패 모드(failure modes)를 명시하고 측정 가능한 수용 임계치(acceptance threshold)를 정의하는 것이 필수 항목화 (ideaplan.io, neemz.medium.com)
- **"PRD → 프로토타입" 전환** — 바이브 코딩으로 상세 스펙 쓰는 노력과 비슷한 비용에 클릭 가능한 시제품을 만들어, 진척을 "문서"가 아닌 "피드백"으로 측정하고 UX 마찰을 조기 검증 (alloy.app, productschool.com)
- **적응형·의도 기반 UI 설계 부상** — 고정 화면이 아닌 사용자 의도(intent-first)로 흐름을 설계하되, 컴플라이언스 문구·접근성·핵심 CTA·기본 내비게이션은 개인화에서 제외되는 "불가침 티어"로 정책화 (knubisoft.medium.com)
- **AI 생성물의 "유령 플로우" 감사가 신규 예외 케이스 업무** — 결제 게이트웨이를 건너뛰는 체크아웃처럼 구조적으로 불가능한 흐름(hallucinated flow)이 프로덕션에 도달하지 않도록 기획자가 사전 감사·큐레이션 (medium.com/design-bootcamp)
- **다중 에이전트 오케스트레이션이 기획 워크플로우로 편입** — 하나의 큰 모델 대신 전문 에이전트에 작업을 라우팅·검증·개선하며, 기계적 산출물(유저스토리·릴리즈노트)은 AI가 맡고 기획자 역할은 "판단(judgment)" 중심으로 재편 (institutepm.com, productcompass.pm)

## pm-growth
- **AI 실험 오케스트레이션으로 이동**: 일회성 A/B 테스트에서 웹·모바일·이메일을 아우르는 "always-on, 지능형 최적화"로 전환 중 — 실험이 리포팅을 넘어 의사결정·리소스 배분의 축이 됨 (kameleoon.com, monetate.com, sprintsandsneakers.com)
- **Amplitude–Statsig 통합이 판을 재편**: OpenAI가 '25년 9월 Statsig 인수 후 Amplitude가 '26년 5월 파트너십으로 브랜드·고객군 흡수 — 분석·피처플래그·실험이 한 스택으로 수렴, PM은 벤더 리스크·마이그레이션 점검 필요 (vwo.com, amplitude.com)
- **전환율 단일 지표 탈피**: 성공 지표가 time-to-value·리텐션·효율로 재정의 — 실험마다 primary + secondary(engagement·retention) 균형 모니터링으로 국소 최적화가 리텐션을 해치지 않도록 방어 (aakashg.com, kameleoon.com)
- **피처 실험의 대중화**: 특수 워크플로우였던 feature experimentation이 이제 웹 실험과 거의 대등한 수준으로 보편화 — PM은 채널 단위가 아닌 다중 터치포인트·워크플로우 전체를 실험 단위로 설계 (kameleoon.com, sprintsandsneakers.com)
- **실험 낭비 자동 차단(가드레일)**: X명/Y일 이후 uplift가 ±2% 내면 자동 종료하는 규칙으로 analysis paralysis 방지 — AI로 개발 속도가 빨라진 만큼 실험 규율·자동화가 핵심 (maciejturek.com, aakashg.com)
- **AI 프로덕트용 'Validation Stack'**: 생성형 기능은 결정론적 지표로 검증이 어려워, 오프라인 평가 + 온라인 실험 + 프로덕트 애널리틱스를 결합한 검증 파이프라인이 그로스 PM의 신규 역량으로 부상 (amplitude.com)

Sources:
- [Kameleoon — 2026 A/B testing stats](https://www.kameleoon.com/blog/a-b-testing-experimentation-stats-you-need-to-know)
- [Sprints & Sneakers — Growth Experimentation 2026](https://www.sprintsandsneakers.com/insights/growth-experimentation-2026)
- [Monetate — Top A/B Testing Trends 2026](https://monetate.com/top-5-ab-testing-trends-for-2026/)
- [Aakash Gupta — A/B Testing Best Practices](https://www.aakashg.com/a-b-testing-best-practices/)
- [VWO — Amplitude-Statsig Partnership](https://vwo.com/blog/amplitude-statsig-partnership/)
- [Amplitude — Validation Stack for AI Product Development](https://amplitude.com/blog/building-the-validation-stack-for-ai-product-development)
- [Maciej Turek — Growth Experimentation Playbook](https://maciejturek.com/resources/growth-experimentation-playbook-2025.html)

## pm-lead
- **에이전틱 AI로의 이동**: '생성'에서 '실행'으로 — PRD·유저스토리 초안뿐 아니라 자율 다단계 실행(백로그 정리, 프로토타입)까지 에이전트가 수행, PM은 human-in-the-loop 검수자로 재정의 (institutepm.com, codebasics.io)
- **AI 네이티브 PM 스택 표준화**: Claude Code(에이전틱 작업)+ChatPRD(PRD/스토리)+NotebookLM·Perplexity(리서치)+Granola(회의)+Linear(실행)가 실무 기본 조합으로 부상 (chatprd.ai, replit.com)
- **근거 기반 우선순위화**: airfocus·Aha! 등이 고객가치·비즈임팩트·개발공수를 자동 스코어링, 과거 피처 성과·지원티켓·매출 데이터로 '이유가 붙은' 추천 제공 (sleekplan.com, monday.com)
- **제품보드 내장 에이전트 협업**: 로드맵 컨텍스트·라벨·우선순위 규칙·배포 상태를 아는 에이전트가 보드에 직접 임베드되어 딜리버리와 동기화 (storiesonboard.com)
- **AI 기반 상시 경쟁·시장 인텔리전스**: 뉴스·경쟁사 런치·가격변동·고객감성 등 수천 신호를 실시간 합성해 인사이트화, 수동 리서치를 대체 (chatprd.ai, airtable.com)
- **베스트프랙티스는 검증 습관화**: "모든 AI 초안 PRD는 공유 전 10분 정확성 패스" 같은 고정 규칙과 기존 스택(Jira·Slack) 연동으로 컨텍스트 전환 최소화 (chatprd.ai, onehorizon.ai)

Sources: [chatprd.ai](https://www.chatprd.ai/learn/ai-for-product-managers), [institutepm.com](https://www.institutepm.com/knowledge-hub/ai-product-management-2026), [storiesonboard.com](https://storiesonboard.com/blog/ai-agents-product-management-2026), [sleekplan.com](https://sleekplan.com/blog/best-10-ai-agents-for-the-product-manager-in-2026-tools-use-cases-and-roi-8615/), [monday.com](https://monday.com/blog/rnd/ai-for-product-managers/), [codebasics.io](https://codebasics.io/blog/how-ai-is-changing-the-product-manager-role-in-2026), [airtable.com](https://www.airtable.com/articles/product-management-trends), [replit.com](https://replit.com/blog/best-ai-tools-for-product-managers), [onehorizon.ai](https://onehorizon.ai/blog/best-ai-product-management-tools)

## pmo
- **에이전틱 AI(Agentic AI)의 실무 침투**: 목표 지향형 자율 에이전트가 정해진 파라미터 내에서 리소스 배분·일정 조정을 직접 결정 — Planview Anvi는 데이터 조회·문서해석·예측분석을 분리한 멀티에이전트 구조로 포트폴리오 헬스를 추적 (planview.com, epicflow.com)
- **예측형 리스크·의존성 관리로 전환**: 수천 개 과거 프로젝트 데이터와 현재 계획을 대조해 일정 현실성 판정, 지연·의존성 충돌·리소스 경합을 사전 탐지하는 방향으로 이동 (epicflow.com, thedigitalprojectmanager.com)
- **PMO 역할의 "통제→가치 실현" 재정의**: 규정 강제보다 롤링웨이브 플래닝·밸류스트림 기반 리포팅·승인 사이클 간소화로 지속 개선을 촉진하는 적응형(Adaptive) PMO가 표준화 (planisware.com, birdviewpsa.com)
- **전략-포트폴리오 연결(SPM) 도구 확산**: 전략→포트폴리오→이니셔티브→실무를 하나의 시스템에서 연결해 "의도에서 성과까지" 실시간 가시성을 확보하는 SPM 플랫폼이 부상 (workboard.com, itonics-innovation.com)
- **AI 도입은 "측정 가능한 딜리버리 페인포인트"에 연결**: 도구 사용법을 넘어 AI 작동 원리·인간 판단이 필요한 지점을 이해시키고, ROI·비즈니스 임팩트를 능동 측정하는 것이 성공 조건 (edison365.com, withum.com)
- **하이브리드 방법론·ESG·데이터 분석 상시화**: 하이브리드 PM, ESG 거버넌스, 데이터 분석이 2026 핵심 흐름으로 자리잡으며 PMO 리포팅·의사결정에 내재화 (theprojectgroup.com, epicflow.com)

Sources: [Planview](https://www.planview.com/products-solutions/solutions/project-portfolio-management/), [Epicflow](https://www.epicflow.com/blog/ai-agents-for-project-management/), [Planisware](https://planisware.com/resources/ai-ppm/project-portfolio-management-trends-2026), [Birdview](https://birdviewpsa.com/blog/project-management-office-guide/), [Workboard](https://www.workboard.com/resources/blog/top-strategic-portfolio-management-software), [ITONICS](https://www.itonics-innovation.com/blog/7-best-ai-tools-for-strategic-portfolio-management), [edison365](https://edison365.com/blog/ai-in-project-management-guide/), [Withum](https://www.withum.com/resources/ai-in-project-management-a-practical-implementation-roadmap-for-pmos/), [The Project Group](https://www.theprojectgroup.com/blog/en/project-management-trends/), [The Digital Project Manager](https://thedigitalprojectmanager.com/tools/best-ai-project-risk-management-software/)

## product-planner
- **"Eval이 곧 수용조건"** — AI 기능의 AC는 이제 큐레이션된 데이터셋+채점 기준+목표 점수로 정의하며, PM이 eval을 직접 소유하는 것이 2026년 표준 (rickpollick.com, productboard.com, lovelaice.com)
- **PRD 주 독자가 AI 에이전트로 이동** — Devin·Cursor Cloud Agents 등이 PRD에서 직접 구현하는 "PRD-driven development"가 확산, 유저스토리를 에이전트가 무감독 실행 가능한 수준의 end-to-end 명확성으로 작성해야 함 (chatprd.ai, blakecrosley.com)
- **디스커버리의 상시화·민주화** — 분기별 대형 리서치 대신 AI 모더레이션(리크루팅·후속질문·합성 자동화) 기반의 주간 경량 터치포인트가 로드맵에 인사이트를 상시 공급하는 모델로 전환 (getperspective.ai, productschool.com)
- **확률적 제품 사고** — 동일 입력이 다른 출력을 내는 AI 기능은 결정론적 스펙 대신 목표 분포·SLA·회귀 방지 기준으로 기획하고, 모델 교체·프롬프트 수정마다 재검증하는 프로세스를 요구사항에 포함 (ainna.ai, buttondown.com)
- **"제품 설명가능성(Product Explainability)"이 신규 요구사항 항목** — 제품이 인간보다 AI 에이전트에게 먼저 발견·평가되는 시대라 제품의 목적·가치·한계를 기계가 읽을 수 있게 명세하는 것이 우선순위화 대상 (airtable.com)
- **회의→티켓 자동화 파이프라인** — 미팅 녹취에서 유저스토리·개발 티켓까지 에이전틱 워크플로로 생성하고 PM은 판단·전략·우선순위 결정에 집중하는 역할 재편이 진행 중 (mistral.ai, figr.design)

Sources: [rickpollick.com](https://rickpollick.com/blog/evals-are-the-new-acceptance-criteria), [productboard.com](https://www.productboard.com/blog/ai-evals-for-product-managers/), [lovelaice.com](https://www.lovelaice.com/resources/ai-evals-for-product-managers-complete-guide-2026), [chatprd.ai](https://www.chatprd.ai/learn/prd-for-ai-codegen), [blakecrosley.com](https://blakecrosley.com/blog/prd-driven-development), [getperspective.ai](https://getperspective.ai/blog/2026-product-discovery-trends-what-300-teams-changed), [productschool.com](https://productschool.com/blog/product-fundamentals/product-management-trends), [ainna.ai](https://ainna.ai/resources/faq/ai-prd-guide-faq), [buttondown.com](https://buttondown.com/critical-path/archive/if-you-cant-write-the-eval-you-cant-ship-the-ai/), [airtable.com](https://www.airtable.com/articles/product-management-trends), [mistral.ai](https://mistral.ai/fr/news/agentic-workflows-from-meetings-to-dev-tickets), [figr.design](https://figr.design/blog/ai-in-product-management)

## rakwan-designer
- Figma Config 2026에서 Code Layers(디자인 레이어를 클릭 한 번에 인터랙티브 코드로 변환), Figma Motion(키프레임 타임라인·CSS/React/MP4 내보내기), 셰이더 필·생성형 플러그인 공개 — 디자인-코드 경계가 사실상 사라지는 중 (figma.com, cmswire.com)
- Figma 'Design System Intelligence'가 디자인시스템 불일치 감지·수정 제안·토큰 동기화·컴포넌트 사용 추적을 자동화 — 시스템 거버넌스가 문서에서 자동 감시 체계로 이동 (figma.com, dodefy.com)
- 2026 UI 트렌드는 '캄 인터페이스(calm interface)'와 투명한 AI — 시각적 과시 대신 인지 부하 최소화, AI 개입 지점을 명시적으로 드러내는 설계가 표준화 (elements.envato.com, uxpin.com)
- 핀테크 신뢰 시그널은 일관된 스페이싱 시스템, 목적 있는 컬러, 거래 플로우의 시각적 노이즈 제로로 구체화 — 사용자 82%가 데이터를 시각화로 보여줄 때 앱을 더 신뢰 (eleken.co, webstacks.com)
- 핀테크 UX는 '데이터 시각화 → 데이터 스토리텔링' 전환과 생체·행동 기반 인증(지문·얼굴·행동 패턴) UI가 핵심 흐름 (webstacks.com, yellowslice.in)
- 접근성이 디자인 토큰 정책으로 편입: 대비 관계를 토큰 쌍으로 인코딩해 WCAG 2.2 AA(본문 대비 4.5:1, 탭 타겟 44×44pt)를 기본값으로 보장하는 방식이 금융앱 베스트프랙티스 (testparty.ai, appricotsoft.com)

Sources: [figma.com/blog/config-2026-recap](https://www.figma.com/blog/config-2026-recap/), [cmswire.com](https://www.cmswire.com/digital-experience/figma-launches-code-layers-motion-at-config-2026/), [dodefy.com](https://www.dodefy.com/articles-posts/figma-2026-complete-breakdown-of-new-products-and-how-to-use-them-effectively), [elements.envato.com](https://elements.envato.com/learn/ux-ui-design-trends), [uxpin.com](https://www.uxpin.com/studio/blog/ui-ux-design-trends/), [eleken.co](https://www.eleken.co/blog-posts/modern-fintech-design-guide), [webstacks.com](https://www.webstacks.com/blog/fintech-ux-design), [yellowslice.in](https://www.yellowslice.in/blog/fintech-ux-design-trends-you-must-know), [testparty.ai](https://testparty.ai/blog/accessibility-as-design-system-policy), [appricotsoft.com](https://appricotsoft.com/blog/mobile-banking-app-accessibility-requirements-how-to-build-inclusive-banking-experiences/)

## ui-ux-designer
- **에이전트 UX가 핵심 설계 과제로 부상** — AI 에이전트가 사용자 대신 행동하는 시대에 진행상태 표시·행동 근거 설명·사용자 오버라이드·오류 복구 패턴이 필수이며, NN/g는 2026년 AI 경험의 최대 설계 문제로 '신뢰'를 지목 (nngroup.com, fuselabcreative.com)
- **Figma Config 2026: AI 에이전트 정식 출시 + Code Layers** — 재사용 가능한 스킬·Notion/Slack/GitHub 커넥터를 갖춘 AI 에이전트와, 디자인 레이어를 편집 가능한 인터랙티브 코드로 바꾸는 코드 네이티브 워크플로 공개 (figma.com, analyticsindiamag.com)
- **Figma Motion 통합** — 타임라인·키프레임·프리셋 기반 모션 툴이 캔버스 안에 들어와 별도 툴 없이 UI 애니메이션 설계 가능; 모션은 "장식보다 목적, 과감함보다 절제 + reduced-motion 옵션 제공"이 베스트프랙티스 (alternativeto.net, uxpin.com)
- **AI 생성이 '일반 목업'에서 '자사 디자인시스템 기반 프로덕션 UI'로 이동** — 잘 관리된 컴포넌트 라이브러리가 AI 생성 품질을 좌우하므로 디자인시스템 거버넌스가 2026년 최우선 투자처 (uxpin.com)
- **평균 사용자용 단일 화면 → 결과 중심(outcome-oriented) 적응형 인터페이스** — AI 개인화·예측형 UX가 확산되며 디자이너 역할은 '제작자'에서 화면 프레임워크와 규칙을 정의하는 '큐레이터'로 전환 (nngroup.com, vezadigital.com)
- **AI 에이전트 자체가 '사용자'가 되는 설계 고려 필요** — Gartner는 2026년 말까지 기업 앱 40%가 태스크 특화 에이전트를 통합할 것으로 전망, 사람과 에이전트 모두 쓸 수 있는 인터페이스 레이어 설계가 새 과제 (nngroup.com, rickyrichards.com)

Sources: [NN/g — AI Agents as Users](https://www.nngroup.com/articles/ai-agents-as-users/), [NN/g — The Era of AI Design](https://www.nngroup.com/videos/the-era-of-ai-design/), [Figma — Config 2026 Recap](https://www.figma.com/blog/config-2026-recap/), [Analytics India Magazine — Figma Config 2026](https://analyticsindiamag.com/ai-news/figma-unveils-ai-agents-and-code-native-design-tools-at-config-2026), [AlternativeTo — Figma Motion & Code Layers](https://alternativeto.net/news/2026/6/figma-launches-a-new-integrated-motion-design-tool-alongside-code-layers-and-new-ai-features/), [UXPin — 2026 UI/UX Trends](https://www.uxpin.com/studio/blog/ui-ux-design-trends/), [Veza Digital — AI UX/UI Trends 2026](https://www.vezadigital.com/post/ai-ux-ui-design-trends), [Fuselab — Agent UX](https://fuselabcreative.com/ui-design-for-ai-agents/), [Ricky Richards — Designing for AI Agents](https://www.rickyrichards.com/blog/designing-for-ai-agents)

## uiux
- **생성형 UI(Generative UI)**: AI가 사용자의 실시간 의도에 맞춰 화면을 동적으로 재구성하는 흐름이 핵심 트렌드로, 정적 화면 설계에서 "적응형 인터페이스 설계"로 UX 디자이너 역할이 확장됨 (codewave.com, uxpin.com)
- **Figma Make·First Draft**: 자연어 프롬프트로 편집 가능한 UI 시안·인터랙티브 프로토타입을 생성하고, Vectorize·Remove Background 등 이미지 편집까지 한 도구에서 처리해 툴 전환 없는 워크플로 압축이 표준화됨 (blog.logrocket.com, figma.com)
- **디자인 시스템 = 거버넌스 플랫폼**: 컴포넌트 라이브러리가 AI 생성 결과물까지 규칙을 강제하는 통제 계층으로 진화, Tokens Studio 기반 토큰으로 앱 전체 톤을 수초 내 일괄 변경 (uxpin.com, zumeirah.com)
- **캄 인터페이스(Calm/인지적 명료성)**: 화려한 장식·시각적 과잉을 걷어내고 정보 위계와 부드러운 흐름을 우선하는 미니멀·저부하 UI가 사용성 기준으로 자리잡음 (elements.envato.com)
- **공간(Spatial)·3D 디자인 실전화**: Vision Pro·Quest 등 MR 기기 영향으로 3D 요소·공간 레이아웃이 일반 웹/모바일 화면 설계로 편입 (agencypartner.com)
- **투명한 AI(Transparent AI)**: AI가 개입·추천하는 지점을 사용자에게 명시하고 통제권을 주는 설계가 신뢰성 베스트프랙티스로 부상, 개인화·변형안 생성은 UX 리서치 보조 수단으로 정착 (elements.envato.com, gitnexa.com)

## ux-writer
- AI가 버튼 라벨·에러 메시지·툴팁 등 루틴 마이크로카피의 초안을 담당하고, 라이터는 보이스 전략·복잡한 유저 여정 설계로 역할이 상향 이동 중 (ericwongcontentstrategist.com)
- UX 라이터 채용공고에서 'AI 리터러시'가 핵심 요건으로 부상 — ChatGPT·Claude·Gemini를 제품 카피용으로 프롬프팅하는 실무 능력 요구 (uxcontent.com, writewithdrkat.com)
- 마이크로카피 개인화가 표준화: UI뿐 아니라 언어도 유저 세그먼트·맥락별로 달리하고, 필요한 순간에만 노출하는 적응형 카피가 SaaS 베스트프랙티스 (userpilot.com)
- 폼·체크아웃 이탈의 최대 원인은 문법 오류가 아닌 '불확실성' — 유저 헤지테이션(왜 필요한지, 다음에 무슨 일이 생기는지)을 해소하는 카피 설계가 2026 핵심 과제 (userpilot.com)
- AI로 수백 개 카피 변형을 생성·A/B 테스트하는 워크플로가 확산됐지만, AI가 만든 페르소나·사용성 근거는 가설일 뿐이라 실사용자 검증·출처 추적이 필수라는 원칙 강조 (uxcontent.com)
- 간결하고 스캔 가능한 포맷은 사용성을 58%, 중립적 언어까지 결합하면 124% 개선한다는 연구가 여전히 마이크로카피 작성의 기준선 (nngroup.com, shopify.com)

Sources: [ericwongcontentstrategist.com](https://www.ericwongcontentstrategist.com/post/the-definitive-guide-to-ux-writing-2026-how-ai-is-changing-microcopy-forever), [uxcontent.com — Content design in 2026](https://uxcontent.com/content-design-in-2026/), [uxcontent.com — AI in UX writing](https://uxcontent.com/ai-in-content-design-ux-writing/), [userpilot.com](https://userpilot.com/blog/microcopy-ux/), [writewithdrkat.com](https://www.writewithdrkat.com/blog/ux-writing-in-2026-skills-to-win-the-race), [shopify.com](https://www.shopify.com/enterprise/blog/how-to-write-microcopy-that-influences-customers-even-if-they-don-t-read-it), [nngroup.com](https://www.nngroup.com/topic/ux-writing/)

## visual-designer
- **모션 퍼스트 아이덴티티**: 정적 로고 대신 키네틱 로고·반응형 비주얼 시스템이 표준이 되어, 브랜드 자산을 처음부터 화면·맥락별 가변형으로 설계하는 흐름 (thebrandingjournal.com, threerooms.com)
- **"휴먼 임퍼펙션" 반동**: 획일화된 AI 결과물 피로감으로 그레인·질감·콜라주·수작업 느낌 등 의도된 불완전함이 브랜드 차별화 요소로 부상 (topright.co.uk, digitalsynopsis.com)
- **유연한 컬러 시스템**: 고정 팔레트 대신 '컬러 무드'를 정의하고 테마가 가변적으로 전환되는 방식이 확산 — 디자인 토큰의 시맨틱 레이어와 결합해 운용 (thebrandingjournal.com)
- **디자인 토큰 표준화 성숙**: W3C Design Tokens 스펙 첫 안정판(2025.10) 이후 Primitive→Semantic→Component 3계층 토큰 + 코드 싱크 파이프라인 + 지정된 거버넌스 오너가 베스트프랙티스로 정착 (designsystemscollective.com, atomize.tools)
- **Figma Config 2026**: 타임라인 기반 모션 툴(CSS/JSON/React/MP4 내보내기), Code Layers(디자인 레이어→편집 가능한 코드), AI 에이전트 정식 출시 및 Weave 이미지 생성 통합 (figma.com, alternativeto.net)
- **지속가능성의 비주얼 내재화**: 지속가능성이 메시지가 아니라 폐기물 절감·자산 수명 연장을 고려한 디자인 의사결정 자체로 아이덴티티에 반영되는 추세 (threerooms.com)

Sources: [The Branding Journal](https://www.thebrandingjournal.com/2026/01/top-branding-design-trends-2026/), [topright design](https://topright.co.uk/visual-identity-trends-2026/), [Three Rooms](https://www.threerooms.com/blog/8-design-trends-shaping-brand-identity-in-2026), [Digital Synopsis](https://digitalsynopsis.com/design/graphic-design-trends-2026/), [Design Systems Collective](https://www.designsystemscollective.com/design-tokens-in-2026-beyond-colors-and-spacing-d2fd632029e1), [atomize.tools](https://atomize.tools/blog/figma-design-system-best-practices/), [Figma Config 2026 recap](https://www.figma.com/blog/config-2026-recap/), [AlternativeTo](https://alternativeto.net/news/2026/6/figma-launches-a-new-integrated-motion-design-tool-alongside-code-layers-and-new-ai-features/)
