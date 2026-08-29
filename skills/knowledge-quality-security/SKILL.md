---
name: knowledge-quality-security
description: QA·코드리뷰·보안 최신 지식 — 테스트 자동화, 취약점, 개인정보. 검증 게이트 역할이 작업 전 참고 (갱신: 2026-08-08)
---

# quality-security 도메인 지식 (2026-08-08)

> 역할별 에이전트 KNOWLEDGE 블록을 도메인 단위로 통합한 지식 베이스.
> `agent-team learn --domains` 가 이 파일을 통째로 갱신한다.

## code-reviewer
- AI 코드리뷰가 "코멘트 게시 도구"에서 "행동하는 에이전트"로 전환 — 누락 테스트를 직접 작성하고 후속 PR을 열어 CI까지 돌리는 에이전틱 아키텍처가 2026년 핵심 흐름 (critique.sh)
- 전체 커밋의 41%가 AI 보조 생성이며, AI 고도입 팀은 PR 병합이 98% 늘지만 리뷰 시간도 91% 증가 — 리뷰가 새 병목이 되어 자동화 리뷰가 필수 인프라화 (dev.to, greptile.com)
- 조직 81%가 AI 생성 코드발 프로덕션 이슈 증가를 보고, AI 코드는 라인당 취약점이 15~18% 더 많음 — AI 생성 코드에는 생성 모델과 독립된 리뷰어를 두는 것이 베스트프랙티스 (codeant.ai, sourcegraph.com)
- 정적 분석 + AI 리뷰를 한 패스로 결합한 하이브리드가 정확도·노이즈 면에서 우세하며, 기본 설정보다 팀 코딩 표준·아키텍처 규칙 기반 커스텀 리뷰 룰이 훨씬 유용한 피드백 생성 (deepsource.com, greptile.com)
- 이슈 발견에서 그치지 않고 패치를 생성해 원클릭으로 PR에 적용하는 "능동적 수정(active remediation)"이 주류화 — 발견→수정→검증 루프가 리뷰 도구 안으로 통합 (critique.sh, sourcegraph.com)
- 주요 도구는 Greptile, CodeRabbit, Cursor BugBot, Qodo, Graphite, SonarQube, Semgrep 등이며, 저장소 전체 컨텍스트 인지와 사용량 기반 과금이 선택 기준으로 부상 (greptile.com, kodus.io)

Sources: [Greptile](https://www.greptile.com/content-library/best-ai-code-review-tools) · [DeepSource](https://deepsource.com/resources/ai-code-review-tools) · [Critique](https://www.critique.sh/ai-code-review-trends-2026) · [Sourcegraph](https://sourcegraph.com/blog/ai-code-review) · [CodeAnt](https://codeant.ai/blogs/how-to-review-ai-generated-code) · [DEV Community](https://dev.to/rahulxsingh/the-state-of-ai-code-review-in-2026-trends-tools-and-whats-next-2gfh) · [Kodus](https://kodus.io/en/ai-code-review-tools/)

## critic
- Microsoft가 1년간의 실전 레드팀 결과를 반영해 에이전틱 AI 실패 모드 분류(taxonomy) v2.0을 공개 — goal hijacking, 에이전트 간 신뢰 상승, 세션 컨텍스트 오염 등 7개 신규 카테고리를 계획 검증 체크리스트에 반영할 것 (microsoft.com)
- OWASP ASI 2026 프레임워크가 에이전트 시스템 전용 위협 순위를 정립 — 계획 검토 시 ASI01(목표 탈취)·ASI02(도구 오용)을 최우선 공격 시나리오로 가정하고 에이전트의 모든 도구·파라미터를 열거해 스트레스 테스트 (baeseokjae.github.io, generalanalysis.com)
- 레드팀 자동화 도구 성숙: PyRIT, garak, Inspect, DeepTeam(50+ 취약점·멀티턴 공격 지원)이 2026년 표준 비교군 — 수동 적대 검토를 도구 기반 반복 검증으로 보완 가능 (confident-ai.com)
- 고객 환경 배포 검증의 핵심은 에어갭 가정: 공용 레지스트리·패키지 매니저 의존이 최대 실패 지점이므로 프라이빗 레지스트리, `docker save/load` 이관, 내부 미러 강제 구성을 계획 단계에서 게이트로 검증 (semaphore.io, pulumi.com)
- 단일 호스트 `docker run`/Compose는 HA·클러스터링 부재로 고객 프로덕션 규모에서 깨지는 지점 — 상태 저장 서비스는 외부 관리형 DB/스토리지 분리 여부를 반드시 심문할 것 (docs.mattermost.com, docs.anchore.com)
- 아키텍처 거버넌스가 "결정 문서 → 자동 검증"으로 이동: ADR에 Compliance 섹션을 붙여 fitness function으로 기계 검증하고, LLM이 비결정적 기준(설계 일관성 등) 평가와 드리프트 감지에 참여하는 흐름 확산 (catio.tech, lukasniessen.com)

Sources: [Microsoft Security Blog](https://www.microsoft.com/en-us/security/blog/2026/06/04/updating-taxonomy-failure-modes-agentic-ai-systems-year-red-teaming-taught-us/), [LLM Red Teaming Guide 2026](https://baeseokjae.github.io/posts/llm-red-teaming-guide-2026/), [General Analysis](https://generalanalysis.com/guides/best-ai-red-teaming-tools), [Confident AI](https://www.confident-ai.com/knowledge-base/compare/best-ai-red-teaming-tools-2026), [Semaphore](https://semaphore.io/blog/air-gapped-deployments-how-to-deploy-to-servers-without-internet-access-complete-guide), [Pulumi](https://www.pulumi.com/docs/administration/self-hosting/airgapped/), [Mattermost](https://docs.mattermost.com/deployment-guide/reference-architecture/deployment-scenarios/air-gapped-deployment.html), [Anchore](https://docs.anchore.com/current/docs/deployment/air_gapped/), [Catio](https://www.catio.tech/blog/architecture-as-code), [Lukas Niessen](https://lukasniessen.com/blog/155-fitness-functions-guide/)

## qa-automation
테스트 자동화 전략·유닛/통합/E2E·플래키 안정화 관점의 2026년 최신 동향입니다.

- **에이전틱(Agentic) 테스팅 부상**: LLM이 목표(intent)만 받아 브라우저를 탐색·테스트 생성·자가치유하는 "테스트 에이전트"가 실전 도입, 단 완전 자율은 여전히 경계 대상 (testquality.com, devot.team)
- **Playwright + MCP가 사실상 표준**: Model Context Protocol과 접근성 트리(accessibility-tree) 우선 실행으로 AI가 앱 구조를 구조적으로 탐색·테스트 자동생성하는 아키텍처가 2026년 주류화 (testdino.com, testquality.com)
- **셀프힐링의 확장**: 로케이터 패치를 넘어 셀렉터·타이밍·런타임 오류·테스트 데이터·비주얼 어설션·인터랙션 등 6개 유형으로 자가치유가 세분화 (medium.com/qawolf, keysight.com)
- **플래키 근본원인 분류가 핵심**: 레이스 컨디션·DOM 결합 브리틀 로케이터·오염된 인증 컨텍스트·환경별 렌더링 편차·비결정적 AI 에이전트 동작이 주요 원인으로 진단 플레이북화 (testquality.com)
- **AI 치유는 반드시 인간 검토 게이트**: 자동 로케이터 수정은 승인 후 반영, 치유 빈도 분석으로 불안정 UI 영역을 역추적하는 것이 베스트프랙티스 (testomat.io, tenjinonline.com)
- **의도 기반 로케이터 + 결정적 폴백**: 접근성 기반 intent 로케이터를 쓰되 직접 통제하는 deterministic fallback 래퍼를 붙여 AI 치유와 견고한 테스트 아키텍처를 결합 (qaskills.sh, shiplight.ai)

## qa-engineer
- AI 기반 테스트 자동화가 2026년 QA 핵심 트렌드로 자리잡음 — 요구사항에서 테스트 케이스 자동 생성, 코드 변경 분석 후 실행 우선순위 결정, 셀프힐링 테스트가 표준화 (tricentis.com, testomat.io)
- Playwright 1.59~1.60이 '에이전틱 테스팅' 중심으로 전환 — 공식 테스트 에이전트, MCP 서버, Screencast API, `browser.bind()` 세션 공유, CLI 트레이스 분석 등 AI 에이전트가 브라우저를 직접 구동하는 워크플로우 지원 (bug0.com, currents.dev)
- 구식 셀렉터 패턴·런치 옵션이 Playwright 최신 릴리스에서 제거됨 — 기존 테스트 스위트 마이그레이션 시 breaking change 점검 필요 (getdecipher.com)
- 시프트레프트+시프트라이트 병행이 기본값 — 설계 단계에서 유저스토리·요구사항 갭 검증과 프로덕션 기반 테스트(관측·실사용 데이터)까지 QA 범위 확장 (talent500.com, testfort.com)
- AI가 생성한 코드에 대한 검증이 QA의 신규 핵심 업무로 부상 — 조직 89%가 AI 기반 리스크 분석을 QA 의사결정의 핵심 요소로 기대 (quashbugs.com, qualityze.com)
- 클라우드 디바이스 팜·브라우저 그리드(BrowserStack, Sauce Labs, AWS Device Farm)가 병렬 실기기 테스트의 표준 인프라로 정착 (testomat.io)

Sources: [tricentis.com](https://www.tricentis.com/blog/qa-trends-ai-agentic-testing) · [testomat.io](https://testomat.io/blog/software-testing-trends/) · [bug0.com](https://bug0.com/blog/whats-new-playwright-1-59) · [currents.dev](https://currents.dev/posts/pw-1.60.0) · [getdecipher.com](https://getdecipher.com/blog/whats-new-with-playwright-in-2026) · [talent500.com](https://talent500.com/blog/smarter-qa-2026-ai-automation-future-of-software-testing/) · [quashbugs.com](https://quashbugs.com/blog/state-of-qa-automation-2026-report)

## qa-functional
I have enough for a focused briefing.

- **에이전틱 QA(자율 테스트)가 주류화**: 플래너·생성·실행·분석 멀티에이전트가 목표 기반으로 테스트를 스스로 설계·실행·수정 — 기능 QA는 스크립트 작성보다 "에이전트 감독·검수" 역할로 이동 (katalon.com, tricentis.com)
- **AC/유저스토리 → 테스트케이스 자동 생성**: GenAI가 요구사항·API 스펙에서 정상·부정·경계·회귀 케이스 초안을 개발 이전에 생성, 테스터는 검토·편집·선별하는 human-in-the-loop 워크플로우 정착 (testquality.com, testcollab.com)
- **자기치유(self-healing) 테스트로 유지보수 급감**: UI 변경 시 로케이터를 자동 복구, Functionize·Mabl 등은 유지보수 공수를 최대 95%까지 절감 (autify.com, devassure.io)
- **AI 보조 탐색적 테스트**: 에이전트가 사람이 놓치는 엣지케이스(중복 예약, 만료된 할인코드 순서, 동시성 충돌 등)를 제안 — 반복 작업은 AI, 판단·이해관계자 대응은 사람으로 역할 분리 (medium.com, 12thwonder.com)
- **Jira·GitHub·CI/CD 통합 + 시프트레프트**: 요구사항 변경이 테스트케이스에 자동 반영되는 통합형 플랫폼 선호, 테스트를 SDLC 초기로 당겨 리스크·출시시간 단축 (getxray.app, testomat.io)
- **AI 생성 테스트 아티팩트 거버넌스 부상**: 자율 테스트의 신뢰성·감사·규제 대응을 위한 검증·통제 프레임워크가 새 과제로 논의됨 (arxiv.org, thinksys.com)

Sources: [katalon](https://katalon.com/resources-center/blog/what-is-agentic-qa-the-complete-guide-for-2026), [Tricentis](https://www.tricentis.com/blog/qa-trends-ai-agentic-testing), [TestQuality](https://testquality.com/how-ai-is-transforming-test-case-generation-in-2026/), [TestCollab](https://testcollab.com/blog/ai-test-case-generation-tools), [Autify](https://autify.com/blog/ai-agent-testing), [DevAssure](https://www.devassure.io/blog/autonomous-qa-agentic-ai/), [Xray](https://www.getxray.app/blog/top-5-software-testing-trends-2026), [arXiv](https://arxiv.org/pdf/2606.08806)

## qa-lead
- 에이전틱 AI 테스트가 스크립트 자동화를 대체하는 중 — 코드 변경·사용 패턴·리스크 분석 기반으로 무엇을 테스트할지 스스로 결정하는 자율 테스트 에이전트가 2026년 표준으로 자리잡음 (cloudqa.io, tricentis.com)
- World Quality Report 2025-26: 조직 89%가 GenAI 기반 QE를 도입 중이나 전사 운영화는 ~15%뿐 — 격차의 원인은 도구가 아니라 거버넌스·전략·비즈니스 정렬로, QA 리더의 핵심 과제로 지목 (qaskills.sh)
- 커버리지 극대화에서 "리스크 커버리지" 극대화로 전환 — 지능형 테스트 오케스트레이션으로 고위험 영역에 집중해 테스트 시간을 최대 40% 줄이면서 품질 성과는 개선하는 접근이 확산 (testomat.io)
- 품질게이트는 커밋→통합→스테이징→카나리→프로덕션 모니터링 단계별 자동화가 베스트프랙티스 — 성숙한 CI/CD 게이트 보유 팀이 배포 빈도·리드타임·변경 실패율·복구 시간(DORA 지표) 전반에서 우위 (testomat.io)
- 품질 엔지니어링이 딜리버리 단계 활동이 아닌 리더십 레벨 의제로 격상 — QE가 제품 스쿼드에 임베드되어 아키텍처·파이프라인·옵저버빌리티·릴리즈 계획 결정에 참여하는 조직 모델이 주류화 (getxray.app)
- AI 생성 코드의 검증이 새 품질게이트 항목으로 부상 — 릴리즈 준비도(release readiness)를 테스트가 정의하는 "테스트 선행" 체제와 함께, AI 산출 코드 전용 밸리데이션 확대가 2026년 주요 트렌드 (accelq.com, inflectra.com)

Sources: [testomat.io](https://testomat.io/blog/software-testing-trends/), [tricentis.com](https://www.tricentis.com/blog/qa-trends-ai-agentic-testing), [qaskills.sh](https://qaskills.sh/blog/world-quality-report-2026-qa), [getxray.app](https://www.getxray.app/blog/top-5-software-testing-trends-2026), [cloudqa.io](https://cloudqa.io/2026-software-testing-trends-the-shift-from-scripted-to-agentic-ai/), [accelq.com](https://www.accelq.com/blog/software-testing-trends/), [inflectra.com](https://www.inflectra.com/Ideas/Whitepaper/Software-Testing-Trends.aspx)

## security-privacy
- **EU AI Act 2026-08-02 전면 적용 개시** — 고위험 AI 시스템에 리스크 관리·사이버보안·사고보고 의무가 발효되어, 생체·금융 데이터를 다루는 AI 기능은 즉시 컴플라이언스 점검 필요 (whitecase.com, mofo.com)
- **OWASP GenAI LLM Top 10 2026 발표** — 7,700여 건 실제 사고 분석 기반으로 개편, 프롬프트 인젝션이 여전히 1위이고 '오정보(Misinformation)'가 급상승; 모델 출력도 신뢰하지 말고 권한 검증은 LLM이 아닌 다운스트림 시스템에서 수행하라는 원칙 강조 (genai.owasp.org, invicti.com)
- **미국 주법, 민감정보 범위 확대** — 코네티컷이 신경 데이터·금융정보·정부 ID를 민감 카테고리에 추가, 콜로라도·오리건도 생체·위치정보 보호 강화; CPRA 벌금은 건당 $7,988로 인상되고 30일 자동 시정기간 폐지 (gunster.com, secureprivacy.ai)
- **한국 개인정보위 2026 조사방향: 위험 기반 접근** — 생체·영상정보 등 고위험 개인정보, 다크패턴 과잉수집, AI 채용·블록체인 신기술을 6대 중점 조사 분야로 지정 — 생체정보 처리 서비스는 우선 타깃 (kimchang.com, epnc.co.kr)
- **한국, AI 합성콘텐츠 삭제요구권 신설 및 영상정보처리기기법 제정 추진** — 정보주체의 딥페이크 삭제 요구권과 사업자 조치 의무가 법제화될 예정이므로 생성형 AI 기능이 있는 서비스는 삭제 파이프라인 설계 필요 (kimchang.com)
- **프라이버시 강화 기술(PET) 표준화 흐름** — 컴플라이언스 담당자 79%가 2028년까지 프라이버시 보존 연산이 규제 표준이 될 것으로 전망; 건강·금융·생체 데이터 처리 조직은 지금부터 PET(동형암호·차분 프라이버시 등) 도입 평가 권고 (secureprivacy.ai)

Sources: [White & Case](https://www.whitecase.com/insight-alert/privacy-and-cybersecurity-2025-2026-insights-challenges-and-trends-ahead), [Morrison Foerster](https://www.mofo.com/resources/insights/251218-data-cyber-privacy-predictions-for-2026), [OWASP GenAI](https://genai.owasp.org/resource/owasp-genai-llm-top-10-2026/), [Invicti](https://www.invicti.com/blog/web-security/owasp-llm-top-10-2026-whats-new), [Gunster](https://www.gunster.com/newsroom/publications/2026-data-privacy-laws-state-changes-universal-opt-out-compliance), [Secure Privacy](https://secureprivacy.ai/blog/data-privacy-trends-2026), [김앤장](https://www.kimchang.com/ko/insights/detail.kc?sch_section=4&idx=33978), [테크월드](https://www.epnc.co.kr/news/articleView.html?idxno=326050)

## security-reviewer
- OWASP Top 10 2025 최종판 발표(2026-01): '소프트웨어 공급망 실패'·'예외 상황 처리 미흡' 2개 신규 항목 추가, SSRF는 Broken Access Control에 흡수, Security Misconfiguration이 2위로 상승 — 리뷰 체크리스트를 2021판에서 갱신 필요 (owasp.org, gitlab.com)
- Broken Access Control이 여전히 1위(테스트된 앱의 평균 3.73%에서 발견) — 인증/인가 리뷰가 계속 최우선 점검 영역 (owasp.org)
- 프롬프트 인젝션이 에이전틱 AI 시대 1순위 위협으로 부상(전년 대비 공격 340% 급증 보고), 완전 차단 불가 전제 하에 입력 필터링·샌드박싱·검색 콘텐츠 시맨틱 필터 등 심층방어가 표준 — LLM/MCP 연동 코드 리뷰 시 필수 점검 (securityjourney.com, eccu.edu)
- 비인간 계정(NHI)이 사람 대비 10:1로 급증하며 시크릿 스캐닝이 NHI 수명주기 관리(소유자 매핑·자동 로테이션·ISPM)로 확장 — GitGuardian·Oasis·Entro·Akeyless 등이 대표 도구 (gitguardian.com, akeyless.io)
- EU AI Act 고위험 시스템 규정이 2026-08-02부로 전면 시행, 미국 20개 주 신규 프라이버시법과 겹치는 '컴플라이언스 컨버전스' — 동의 메커니즘·벤더 감독·자동화된 의사결정이 집중 단속 대상 (onetrust.com, insideprivacy.com)
- 규제·OWASP 모두 프라이버시를 문서 작업이 아닌 설계·인프라 문제로 취급하는 방향(EU Data Act, 호주 ADM 투명성 규칙 등) — 리뷰 시 데이터 최소수집·자동 의사결정 투명성을 코드 레벨에서 확인 (secureprivacy.ai)

Sources: [OWASP Top 10:2025](https://owasp.org/Top10/2025/), [GitLab — 2025 OWASP Top 10 변경점](https://about.gitlab.com/blog/2025-owasp-top-10-whats-changed-and-why-it-matters/), [Security Journey — Prompt Injection 2026](https://www.securityjourney.com/post/prompt-injection-attacks-in-llms-what-developers-need-to-know-in-2026), [ECCU — Prompt Injection Threat](https://www.eccu.edu/blog/prompt-injection-ai-cybersecurity-threat/), [GitGuardian — NHI Security Tools 2026](https://blog.gitguardian.com/nhi-security-tools/), [Akeyless — NHI Management Tools 2026](https://www.akeyless.io/blog/top-5-non-human-identity-management-tools-for-2026/), [OneTrust — 2026 프라이버시 트렌드](https://www.onetrust.com/blog/the-5-trends-shaping-global-privacy-and-enforcement-in-2026/), [Inside Privacy — 2026 EU 전망](https://www.insideprivacy.com/european-union-2/what-to-watch-in-2026-key-eu-privacy-cybersecurity-developments/), [Secure Privacy — Privacy Laws 2026](https://secureprivacy.ai/blog/privacy-laws-2026)
