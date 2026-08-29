---
name: knowledge-quality-security
description: QA·코드리뷰·보안 최신 지식 — 테스트 자동화, 취약점, 개인정보. 검증 게이트 역할이 작업 전 참고 (갱신: 2026-08-29)
---

# quality-security 도메인 지식 (2026-08-29)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 테스트 자동화·QA

- 2026년은 '에이전틱 테스팅' 실전 도입 원년으로, 자율 에이전트가 앱을 탐색·리스크 추론·테스트 작성·실행·학습까지 수행하는 흐름이 주류화 (tricentis.com, parasoft.com)
- Playwright v1.56+가 planner(탐색)·generator(코드 작성)·healer(로케이터 복구) 3-에이전트 아키텍처를 공식 내장 — 플래키 로케이터 수리 시간이 시간 단위에서 분 단위로 단축 (qaskills.sh, testdino.com)
- Playwright MCP + 접근성 트리 우선 실행으로 AI가 구조화된 방식으로 앱을 탐색·테스트 생성·자가치유하는 패턴이 표준화 (anhtu.dev, testleaf.com)
- 올해 5대 테스팅 트렌드: 자율 에이전트, 컴플라이언스 테스팅, AI 생성 코드 검증, 신뢰수준(confidence-level) 테스팅, 자가치유 테스트 (parasoft.com)
- QA 역할이 '스크립트 작성자'에서 품질 목표 정의·AI 산출물 감독·자동 판단의 비즈니스 정합성 검증자로 이동 (tricentis.com, testomat.io)
- 에코시스템 도구: TestDino(플래키 감지·AI 리포팅), Octomind(자율 테스트 플로우), ZeroStep(자연어 실행), TestSprite(MCP 기반) 등이 부상 (testdino.com)
- 핵심 운영 모델은 '폐쇄 루프 AI + 인간 거버넌스' — 에이전트가 작성·실행·분석하되 인간이 게이트를 유지하는 구조 (getxray.app)

## AI 코드리뷰

- 상위 도구 지형: Claude Code 리뷰(9개 병렬 서브에이전트 다차원 리뷰), CodeRabbit, Greptile, Qodo(2026년 멀티에이전트 아키텍처 도입), SonarQube (techsy.io, awesomecodereviews.com)
- Sonar가 2026년 5월 Gitar 인수 — '알고리즘 정적분석 + 에이전틱 추론' 결합이 업계 방향으로 굳어짐 (awesomecodereviews.com)
- AI 리뷰의 승부처는 검출량이 아니라 '고신호 코멘트' — 코드베이스 이해·팀 컨벤션 존중·거짓양성 최소화가 도입 성패를 가름 (collinwilkins.com)
- AI 생성 코드는 '유능하지만 주니어인 개발자의 코드'로 취급: 동작은 하나 엣지케이스·보안·아키텍처 정합성 리뷰 필수 (collinwilkins.com)
- 자율성이 높은 코딩 도구일수록 리뷰 규율도 비례해 강화해야 한다는 '고자율=고리뷰' 원칙이 베스트프랙티스로 정착 (internative.net)
- 권장 리뷰 프로토콜: 보안 → 로직 오류 → 성능 → 스타일 순으로 스캔하고 심각도별로 findings 정리 (agensi.io)

## 애플리케이션 보안·취약점 동향

- OWASP Top 10 2025 기준 Broken Access Control 1위(평가 대상 앱 100% 발견), Security Misconfiguration 2위 — 접근제어 결함이 고심각도 발견의 32%로 40% 급증 (patrowl.io, cycode.com)
- CVE 발행량 지속 폭증: 2025년 상반기에만 23,667건으로 전년 대비 16% 증가 — 우선순위화(KEV·EPSS 기반)가 필수 역량 (cycode.com)
- 공급망 CVE가 OWASP Top 10 전체에서 평균 익스플로잇·임팩트 점수 최고 — 취약점 스캐너 Trivy 자체가 하이재킹돼 CI/CD 수천 개에 자격증명 탈취를 배포한 사건(CVE-2026-33634)이 상징적 (cycode.com)
- 조직 92%+가 AI 코딩 어시스턴트 사용 중이나, AI 생성 코드가 AppSec 팀의 1순위 사각지대로 지목 (cycode.com)
- 프롬프트 인젝션이 이론적 잭브레이크를 넘어 기업 데이터 유출의 실전 공격 벡터로 진화 (cycode.com)
- OWASP GenAI 프로젝트가 분기별 'GenAI Exploit Round-up'을 발행하며 AI 관련 실제 익스플로잇을 정례 추적 시작 (genai.owasp.org)

## 소프트웨어 공급망 보안

- 2025년 한 해 신규 악성 오픈소스 패키지 45.4만 개(전년 대비 75% 증가), 누적 123만 개 돌파 — npm이 레지스트리 악성코드의 99% 이상 차지 (sonatype 인용, shattered.io / reversinglabs 인용, redfoxsec.com)
- 'Shai-Hulud' 웜이 npm 생태계에서 자기복제형 공급망 공격으로 대규모 패키지 감염 — 웜형 공격이 새 위협 등급으로 부상 (unit42.paloaltonetworks.com)
- '슬롭스쿼팅(slopsquatting)' 실전화: LLM이 환각한 패키지명을 공격자가 선점 등록 — `unused-imports` 사례는 보안 조치 후에도 주간 233회 다운로드 지속 (cloudsecurityalliance.org)
- EU 사이버복원력법(CRA): 2026년 9월부터 취약점 보고 의무, 2027년 12월 SBOM 의무화 — 위반 시 최대 1,500만 유로 벌금 (armorcode.com)
- 방어 기본기: 의존성 설치 전 검증(레지스트리 나이·다운로드 수·저장소 존재), lockfile 고정, 설치 스크립트 차단, 프라이빗 프록시 레지스트리 (splunk.com)
- AI가 추천한 의존성은 존재 여부·정확한 패키지명을 반드시 교차 확인하는 게이트를 CI에 넣는 것이 신규 베스트프랙티스 (cloudsecurityalliance.org)

## AI 에이전트·LLM 보안

- OWASP 'Top 10 for Agentic Applications'(2025년 12월 발표)이 새 표준 프레임워크로 — 에이전트 목표 탈취(ASI01), 도구 오용(ASI02), 권한 남용(ASI03), 메모리 포이즈닝(ASI06), 에이전트 간 통신(ASI07) 등 (practical-devsecops.com, giskard.ai)
- 에이전틱 시스템에서 프롬프트 인젝션은 '잭브레이크'가 아니라 실 자격증명으로 동작하는 에이전트의 의사결정을 탈취하는 수단으로 재정의 (lakera.ai)
- OWASP MCP Top 10 베타 진행 중 — 악성 MCP 서버가 정상 서비스로 위장해 이메일을 몰래 BCC로 유출하는 류의 공격이 대표 시나리오 (imperva.com)
- 실 인시던트를 지배하는 항목: 프롬프트 인젝션, 민감정보 노출, 시스템 프롬프트 유출, 부적절한 출력 처리, 무제한 리소스 소비 (imperva.com)
- 에이전트에 최소권한·단기 자격증명·도구 실행 샌드박스·인간 승인 게이트를 두는 다층 방어가 권고 표준 (giskard.ai)
- 간접 프롬프트 인젝션(IPI) 대상 레드티밍 도구·프록시 연구가 활발 — 웹 브라우징 에이전트 도입 전 IPI 테스트가 체크리스트화 (arxiv.org)

## AI 생성 코드 품질·보안

- Veracode 2026 GenAI 코드 보안 리포트: AI 코드 생성 태스크의 약 44%가 보안 취약점을 유발 — AI 코드량은 급증했으나 보안 성능은 수년째 제자리 (veracode.com)
- Georgia Tech SSLab 'Vibe Security Radar': 2026년 3월 한 달에만 AI 생성 코드가 직접 원인인 CVE 35건 이상 공개 (infosecurity-magazine.com)
- Fortune 50 실증 연구: AI 보조 개발자는 커밋을 3~4배 빠르게 생산하지만 보안 결함은 10배 유입 — '보안 부채'가 수습 속도를 추월 (cloudsecurityalliance.org)
- AI 어시스턴트 사용 개발자는 덜 안전한 코드를 쓰면서도 스스로 안전하다고 평가하는 '거짓 안심' 효과가 반복 확인됨 (arxiv.org)
- 반복 프롬프트로 코드를 개선시킬수록 보안이 오히려 저하되는 '반복 생성 보안 열화' 현상도 보고 — 세대별 재스캔 필요 (arxiv.org)
- 대응: AI 코드 전용 게이트(SAST+시크릿+의존성 검증)를 머지 전 필수화하고, AI 산출 코드에 리뷰 면제를 주지 않는 정책 명문화 (veracode.com, cycode.com)

## 시크릿·CI/CD·비인간 계정(NHI)

- GitGuardian 2026: 공개 GitHub에서 시크릿 2,900만 건 탐지, AI 서비스 키 유출은 전년 대비 81% 급증 (gitguardian.com)
- 내부 저장소가 공개 저장소보다 하드코딩 시크릿 포함 확률 6배 — '내부라 안전' 가정이 최대 함정 (gitguardian.com)
- 비인간 계정(NHI)이 인간 사용자 대비 80:1로 폭증 — CI/CD·K8s·클라우드에 흩어진 서비스 계정 관리가 2026년 최우선 리스크 (nhimg.org, gitguardian.com)
- 조직 79%가 시크릿 유출 경험, 그중 77%는 실제 피해로 이어짐 (deepstrike.io)
- 장수명 API 키 대신 OIDC 기반 단기·최소권한 토큰으로 전환하는 것이 CI/CD 시크릿 스프롤의 표준 해법 (kineticskunk.io, gitguardian.com)
- DevSecOps 보호 범위가 코드에서 의존성·빌드 시스템·아티팩트·레지스트리·배포 경로 전체로 확장 (helpnetsecurity.com)

## 개인정보·규제

- EU AI Act가 2026년 8월 2일부로 전면 적용(일부 고위험 제품은 2027년까지 유예) — 7월 27일 발효된 AI 옴니버스가 고위험 AI 준수 기한을 일부 연장 (kasowitz.com, insideprivacy.com)
- EDPB 2026년 공동 집행 액션은 GDPR 12~14조 투명성·정보제공 의무에 집중 — 투명성 위반이 올해 최우선 단속 대상 (tjc-group.com, onetrust.com)
- 미국 20개 주 신규 프라이버시법 + 자동화 의사결정·동의 메커니즘·벤더 감독을 겨냥한 규제 수렴이 진행 (secureprivacy.ai, onetrust.com)
- 한국 개인정보보호위원회는 2026년 4월 개인정보 처리방침 작성지침 개정 — 생성형 AI 서비스 부록 신설, 온디바이스 처리 기준 명확화 (lawtimes.co.kr, kimchang.com)
- 개보위는 공익 목적 AI 개발 시 맞춤 안전조치를 전제로 원본데이터 활용을 허용하는 'AI 원본활용 특례' 도입 추진 중 (kimchang.com)
- 생성형 AI 개발·활용을 위한 개인정보 처리 안내서가 공개·배포됨 — 국내 AI 서비스는 이 기준 정합성 점검이 필수 (privacy.go.kr, shinkim.com)
- 헬스케어·고용·법집행 등 민감 영역 AI는 정기 감사·투명성·데이터 처리 문서화가 의무화 흐름 (cookie-script.com)

Sources: [Tricentis](https://www.tricentis.com/blog/qa-trends-ai-agentic-testing) · [Parasoft](https://www.parasoft.com/blog/annual-software-testing-trends/) · [QASkills](https://qaskills.sh/blog/playwright-test-agents-planner-generator-healer) · [TestDino](https://testdino.com/blog/playwright-ai-ecosystem) · [Awesome Code Reviews](https://www.awesomecodereviews.com/tools/ai-code-review-tools/) · [collinwilkins.com](https://collinwilkins.com/articles/ai-code-review-best-practices-approaches-tools) · [Patrowl](https://patrowl.io/en/blog/owasp-top-10-2025-what-s-changed-and-the-2026-data) · [Cycode](https://cycode.com/blog/application-security-vulnerabilities/) · [OWASP GenAI](https://genai.owasp.org/2026/04/14/owasp-genai-exploit-round-up-report-q1-2026/) · [Unit42](https://unit42.paloaltonetworks.com/npm-supply-chain-attack/) · [CSA — Slopsquatting](https://labs.cloudsecurityalliance.org/research/csa-research-note-slopsquatting-ai-supply-chain-20260419-csa/) · [Splunk](https://www.splunk.com/en_us/blog/security/npm-supply-chain-attack-detection-analysis.html) · [Practical DevSecOps](https://www.practical-devsecops.com/owasp-top-10-agentic-applications/) · [Imperva](https://www.imperva.com/blog/owasp-llm-top-10-what-comes-next-agentic-mcp/) · [Lakera](https://www.lakera.ai/blog/the-progressive-breach-model-behind-the-owasp-top-10-for-agentic-applications) · [Veracode](https://www.veracode.com/blog/2026-genai-code-security-report-ai-risk/) · [Infosecurity Magazine](https://www.infosecurity-magazine.com/news/ai-generated-code-vulnerabilities/) · [CSA — AI CVE Surge](https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-generated-code-vulnerability-surge-2026/) · [GitGuardian](https://blog.gitguardian.com/the-state-of-secrets-sprawl-2026/) · [Help Net Security](https://www.helpnetsecurity.com/2026/05/20/hard-truths-from-2026-devops-threats-report/) · [Inside Privacy](https://www.insideprivacy.com/european-union-2/what-to-watch-in-2026-key-eu-privacy-cybersecurity-developments/) · [Kasowitz](https://www.kasowitz.com/media/viewpoints/data-privacy-ai-regulatory-and-compliance-update-july-2026/) · [김앤장](https://www.kimchang.com/ko/insights/detail.kc?sch_section=4&idx=33715) · [법률신문](https://www.lawtimes.co.kr/news/articleView.html?idxno=220711) · [개인정보보호위원회](https://www.privacy.go.kr/front/bbs/bbsView.do?bbsNo=BBSMSTR_000000000049&bbscttNo=20836)
