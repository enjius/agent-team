---
name: knowledge-quality-security
description: QA·코드리뷰·보안 최신 지식 — 테스트 자동화, 취약점, 개인정보. 검증 게이트 역할이 작업 전 참고 (갱신: 2026-08-30)
---

# quality-security 도메인 지식 (2026-08-30)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 테스트 자동화·QA
- Playwright가 QA 채택률 45.1%로 압도적 1위, Cypress 14.4%·Selenium 22.1%(하락세)로 사실상 표준 지위 확보 (elionavarrete.com)
- 2026년 테스트 생성의 핵심 도약은 MCP 브라우저 에이전트 — AI가 navigate/click/snapshot 툴로 실제 브라우저를 직접 구동하며 테스트를 만들어냄 (testquality.com)
- QA 엔지니어 역할이 "테스트 작성자"에서 파이프라인 설계·AI 산출물 리뷰를 맡는 "테스트 아키텍트"로 이동 중 (elionavarrete.com)
- AI 테스트 생성은 로케이터 정확도 80~90% 수준으로, 3~4시간짜리 테스트 작성이 15~20분으로 압축되지만 리뷰 공수는 필수 (qaskills.sh)
- 자연어 플로우 기술 → 테스트 생성 → CI에서 플래키 테스트 셀프힐링까지 전 계층에 AI가 내장되는 추세 (blog.buildbetter.ai)
- 비용 감각: 녹화→코드 변환 $0.02~0.08/테스트, 프롬프트 기반 생성 $0.10~0.30, 자율 에이전트 탐색은 $0.50~2.00/플로우로 가장 비쌈 (qaskills.sh)

## AI 코드리뷰
- 2026년 주요 도구: CodeRabbit(PR 요약 최속), Greptile(멀티서비스 아키텍처 심층), SonarQube(규제산업 컴플라이언스), CodeAnt(리뷰+보안스캔+펜테스트 통합), Bugbot, Claude Code Review (sourcegraph.com, codeant.ai)
- 상위 AI 리뷰 에이전트는 정밀도 98% 수준까지 도달 — 초기 세대의 과도한 오탐(노이즈 코멘트) 문제가 크게 개선됨 (deepsource.com)
- 도구 비교 시 벤더 주장 대신 OpenSSF CVE Benchmark(유일한 독립 공개 벤치마크) 기준 정확도를 확인하는 것이 베스트프랙티스 (codeant.ai)
- 실무 표준은 하이브리드: 정적분석은 고신뢰 머지 게이트로, AI 리뷰는 머지 전 맥락적 조기 피드백으로 병행 (sourcegraph.com)
- AI 리뷰의 강점은 diff 요약·시맨틱 이슈 감지·레포 전체 맥락 추론으로, 룰 기반 정적분석과 역할이 분화됨 (aikido.dev)

## 공급망 보안 (핫이슈)
- 2026-08-04 'ChainDrop' 공격: 주간 1.27억 다운로드 keyv 메인테이너의 GitHub 계정이 탈취돼 444개 패키지·1,381개 버전(월 20억+ 설치)에 크리덴셜 탈취 웜(Mini Shai-Hulud) 주입 (securityweek.com, datadoghq.com)
- 웜은 훔친 npm/GitHub 크리덴셜로 다른 메인테이너 패키지에 변조 릴리스를 발행하며 자가 전파 — 레지스트리 전반의 연쇄 감염 구조 (cybersecuritynews.com)
- 공격 벡터는 install-time 스크립트(setup.mjs) — npm install만 해도 코드 실행 전 감염되므로, npm v12는 설치 스크립트를 기본 비활성화하는 파괴적 변경을 도입 중 (github.blog)
- npm 대응책: staged publishing(발행 전 추가 승인·2FA 강제), 신뢰 발행(trusted publishing) 확산 — 팀 CI에서 lockfile 고정·설치 스크립트 차단(--ignore-scripts) 점검 필요 (github.blog, mondoo.com)
- SBOM·아티팩트 서명(Sigstore)·의존성 스캔(Trivy)이 이론에서 법적 의무 수준으로 격상, SLSA 프레임워크가 표준 참조 (ainformat.com, practical-devsecops.com)

## LLM·에이전틱 AI 보안
- OWASP LLM Top 10 2026 발표: 프롬프트 인젝션이 3년 연속 1위 — "SQL 인젝션과 달리 근본적 엔지니어링 해법이 없다"는 것이 공식 입장 (sdtimes.com)
- 가장 큰 순위 변동은 Excessive Agency(과잉 에이전시)의 3위 급상승 — 웹 탐색·툴 호출·자율 행동하는 에이전트에 과도한 권한을 주는 리스크 (reversinglabs.com)
- 2026 개정판의 설계 철학 전환: "모든 모델은 결국 속는다"를 전제로, 속아도 피해가 제한되는 시스템(권한 최소화·격리·확인 게이트)을 설계하라는 접근 (checkpoint.com)
- OWASP가 약 1만 건의 실제 AI 보안 인시던트 DB를 구축 — 이론적 위협이 아닌 실제 발생 리스크 기반으로 순위 재편 (checkpoint.com)
- AI 코딩 도구 자체도 간접 프롬프트 인젝션에 취약하다는 연구 발표 — 레포 내 악성 파일/이슈 텍스트가 에이전트를 조종하는 시나리오 검증 필요 (arxiv.org)
- 브라우징 에이전트 대상 간접 인젝션 레드팀 도구(IPI-proxy)·SaaS 연동 에이전트 레드팀 벤치마크(AgentRedBench) 등 공격·방어 연구 활발 (arxiv.org)

## AI 생성 코드 보안
- AI 코드 생성 태스크의 55%만 보안 안전 — 2년간의 모델 세대교체에도 보안 통과율은 제자리(문법 정확도는 95%+와 대조) (veracode.com)
- AI 생성 코드의 62%가 설계 결함 또는 알려진 취약점 포함 — "생성됐다=검증됐다"가 아님을 리뷰 게이트에서 전제해야 함 (cloudsecurityalliance.org)
- 빈발 취약점 패턴: 문자열 연결 SQL 인젝션, 미소독 출력 XSS, 구식 암호화 알고리즘 재생산, OS 커맨드 인젝션, 하드코딩 크리덴셜, 약한 난수 (veracode.com, securityjourney.com)
- 반복 수정(iterative generation)을 거칠수록 보안이 오히려 저하되는 역설이 체계적으로 확인됨 — 리라이트 루프 후 재스캔 필수 (arxiv.org)
- '바이브 코딩'으로 비개발자 앱 제작이 확산되며 보안 검증 없는 코드의 프로덕션 유입이 새 리스크 축으로 부상 (sqmagazine.co.uk)
- LLM/에이전트가 만든 자동 패치(APR)도 보안 리스크를 새로 유입할 수 있다는 대규모 연구 — 자동 수정도 리뷰 대상 (arxiv.org)

## 취약점 관리
- 2025년 CVE 48,244건(전년 대비 +20%), 2026년은 사상 최대 59,000건 전망 — 9분당 1건꼴이라 수동 트리아지는 불가능 (hackerstorm.com)
- CVSS 단독 우선순위화 탈피가 대세: CVSS 7+ 중 실제 악용 관측은 2.3%뿐 — CISA KEV(악용 확인) → EPSS(악용 확률) → CVSS 순의 계층적 트리아지가 표준 (nhimg.org, ismalicious.com)
- KEV+EPSS 조합 시 패치 워크로드 95% 감소하면서 악용 가능성 높은 취약점의 63% 커버 가능 (stingrai.io)
- 공격자들은 엣지 장비를 넘어 "시스템을 관리하는 시스템"(관리 콘솔·통신 플랫폼·인프라 어플라이언스)을 집중 공략하는 추세 (mondoo.com)
- 단발성 스캔에서 CTEM(지속 위협 노출 관리) 사이클로 전환 — 자산 가시성·악용 증거 기반 자동화가 핵심 (deepstrike.io)

## DevSecOps·CI/CD 보안
- 비인간 신원(NHI: 서비스 계정·AI 에이전트·CI/CD 시크릿)이 1위 공격 벡터로 부상 — 머신 신원에 제로트러스트·권한 관리(Entitlement Management for AI) 적용이 2026 화두 (deepstrike.io)
- 'Shift-left'에서 'Shift-smart'로: 저영향 알림 홍수 대신 개발자 워크스페이스 안에서 맥락적·실행 가능한 보안 피드백만 전달 (ox.security)
- CI/CD 파이프라인 하드닝이 생존 요건화 — 가변 참조(mutable ref)와 암묵적 신뢰 지점 하나하나가 공격면 (yoursky.blue)
- 표준 도구 스택 수렴: OPA(policy-as-code), Sigstore(서명), Trivy(스캔), Vault(시크릿) (requirementguide.com, practical-devsecops.com)
- 코파일럿 보조를 넘어 자율 보안 에이전트 + 강제 가능한 신뢰(enforceable trust) 체계로 DevSecOps가 재편되는 중 (yoursky.blue)

## 개인정보·규제
- 한국 개정 PIPA 2026-09-11 시행 임박(D-12): 과징금 상한이 '관련 매출 기준'에서 전체 매출의 10%로 상향 — 국내 서비스는 즉시 점검 필요 (kiteworks.com, chambers.com)
- 2026-02-12 국회 통과·03-10 공포된 PIPA 추가 개정은 AI 학습 데이터 활용 규칙을 재정립 — 접근권·보안 요구·해외 사업자 국내대리인 의무 구체화 (blog.pebblous.ai, dataguidance.com)
- 한국 AI기본법(AI Framework Act)이 2026년 1월 발효 — AI 서비스는 PIPA와 이중 컴플라이언스 체계 (kasowitz.com)
- EU AI Act 고위험 시스템 규정이 2026년 8월 전면 시행 — 최대 €3,500만 또는 매출 7% 과징금이 GDPR 위에 중첩 (secureprivacy.ai)
- 전 세계 144개국에 개인정보보호법 발효, 50개 이상 관할권이 집행 체계 보유 — "고지 중심"에서 기술적 설계·검증된 사용자 통제 중심의 "인프라로서의 프라이버시"로 패러다임 이동 (onetrust.com, kiteworks.com)

Sources: [elionavarrete.com](https://elionavarrete.com/blog/state-test-automation-2026), [testquality.com](https://testquality.com/playwright-test-agents-mcp-architecture-2026/), [qaskills.sh](https://qaskills.sh/blog/ai-test-automation-tools-2026), [sourcegraph.com](https://sourcegraph.com/blog/automated-code-review-tools), [codeant.ai](https://codeant.ai/blogs/best-ai-code-review-tools), [deepsource.com](https://deepsource.com/resources/ai-code-review-tools), [securityweek.com](https://www.securityweek.com/over-400-npm-packages-infected-in-chaindrop-supply-chain-attack/), [datadoghq.com](https://securitylabs.datadoghq.com/articles/npm-worm-compromises-popular-npm-packages/), [github.blog](https://github.blog/security/supply-chain-security/disrupting-supply-chain-attacks-on-npm-and-github-actions/), [sdtimes.com](https://sdtimes.com/security/prompt-injection-tops-2026-owasp-genai-llm-top-ten-vulnerabilities/), [reversinglabs.com](https://www.reversinglabs.com/blog/owasp-top-10-for-llm-apps-excessive-agency), [checkpoint.com](https://blog.checkpoint.com/ai-security/reading-the-signals-in-the-owasp-llm-top-10-2026/amp/), [veracode.com](https://www.veracode.com/blog/spring-2026-genai-code-security/), [stingrai.io](https://www.stingrai.io/blog/vulnerability-statistics-2026), [hackerstorm.com](https://www.hackerstorm.com/articles/our-blog/vulnerabililty-intelligence/50k-cves-2026-vulnerability-management-strategy), [ox.security](https://www.ox.security/blog/application-security-trends-in-2026/), [chambers.com](https://practiceguides.chambers.com/practice-guides/data-protection-privacy-2026/south-korea/trends-and-developments), [blog.pebblous.ai](https://blog.pebblous.ai/report/korea-pipa-amendment-2026-ai-data/en/), [onetrust.com](https://www.onetrust.com/blog/the-5-trends-shaping-global-privacy-and-enforcement-in-2026/), [secureprivacy.ai](https://secureprivacy.ai/blog/privacy-laws-2026)
