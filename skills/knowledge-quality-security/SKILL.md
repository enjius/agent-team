---
name: knowledge-quality-security
description: QA·코드리뷰·보안 최신 지식 — 테스트 자동화, 취약점, 개인정보. 검증 게이트 역할이 작업 전 참고 (갱신: 2026-09-10)
---

# quality-security 도메인 지식 (2026-09-10)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 테스트 자동화·QA
- Playwright Agents(planner/generator/healer) + Playwright MCP가 사실상 표준. 접근성 트리 기반 role 로케이터가 class/DOM 기반보다 10배 안정적 (testdino.com, testquality.com)
- Healer 에이전트는 셀렉터 실패의 75%+를 자동 복구, 성숙한 self-healing은 셀렉터 유지보수를 85~95% 절감. 단 컴플라이언스 핵심 검증은 여전히 스크립트 고정 (bug0.com, wopee.io)
- "Production-informed testing": 실제 유저 텔레메트리를 테스트 계획에 투입해 우선순위 결정하는 흐름이 2026년 주류 (blog.buildbetter.ai)
- State of Testing 2026: AI 보조 도구로 자동화 커버리지 +12.1%, 프로덕션 결함 -10.8%, self-healing 스위트 유지비 40~45% 절감 (dev.to)
- 플레이키 원인의 45%는 비동기 대기, 20%는 동시성/레이스. 고정 sleep 대신 상태 기반 대기(expect.poll, auto-wait) 강제 (functionize.com, arxiv.org)
- AI 생성 테스트는 커버리지는 높지만 뮤턴트 사살률이 낮음(non-null 체크 같은 약한 단언). 커버리지 수치를 뮤테이션 테스트(Stryker/PIT/cargo-mutants)와 반드시 짝지어 검증 (augmentcode.com, testdino.com)
- QA 역할은 "테스트 아키텍트"로 이동: 파이프라인 설계와 AI 산출물 리뷰가 핵심 업무. 에이전트는 탐색적·회귀 유지보수, 사람은 게이트 판단 (devot.team, applitools.com)

## AI 코드리뷰
- 2026 주요 도구: CodeRabbit(PR 자동화), Copilot Code Review(레포 컨텍스트), Claude Code(아키텍처 피드백), Qodo(테스트 생성), Greptile, Snyk Code, DeepSource (devtoollab.com)
- AI 생성 코드의 45%가 OWASP Top 10 검사 중 최소 1개 실패, 개발자 53%가 AI 코드에서 취약점 발견 경험. AI 코드는 "리뷰 면제"가 아니라 "리뷰 강화" 대상 (mintmcp.com)
- 실무 패턴: 실시간 작성은 Copilot, 심층 리뷰·보안 분석은 Claude Code로 분리 운용. 긴 컨텍스트로 멀티파일 PR 한 번에 리뷰 (guptadeepak.com, dev.to)
- 2026년 4월 JHU 연구진이 GitHub PR 제목에 악성 지시를 넣어 Claude Code·Gemini CLI·Copilot을 하이재킹. PR 제목/본문/커밋 메시지도 신뢰 불가 입력으로 취급 (sysdig.com)
- Claude Code·Cursor·Copilot 모두 2025~26년 CVE 누적(MCP 우회 CVSS 8.6, 무음 유출 CVSS 9.6). 코딩 에이전트 자체를 공격면으로 관리·패치 (mintmcp.com)
- 리뷰 게이트 필수 체크: 약한 단언 테스트, 해피패스 전용 로직, 하드코딩 시크릿, 과도한 권한 요청. AI 리뷰어 결과는 사람이 최종 승인 (foraithings.com)

## 취약점·OWASP·AI 에이전트 보안
- OWASP LLM Top 10 2026 발표: 프롬프트 인젝션·민감정보 노출이 1·2위 유지, Excessive Agency가 6위→3위로 급상승 (genai.owasp.org, reversinglabs.com)
- OWASP Agentic Top 10 2026(ASI01~10) 신설: 목표 하이재킹, 도구 오용, 에이전트 신원·권한 남용, 에이전트 공급망, 예기치 않은 코드 실행, 메모리/컨텍스트 오염, 에이전트 간 통신, 연쇄 실패, 인간-에이전트 신뢰 악용, 로그 에이전트 (genai.owasp.org, cycode.com)
- MCP 툴 결과 자체가 인젝션 벡터("tool poisoning"). Sentry 이벤트 수집을 통한 "agentjacking" 사례(2026.6, Tenet/CSA) — 외부 데이터가 에이전트 컨텍스트로 들어가는 모든 경로를 신뢰 경계로 간주 (aptible.com, cloudsecurityalliance.org)
- 에이전트 스킬 생태계 오염: ClawHub에서 악성 스킬 1,184개 확인, Snyk ToxicSkills 감사에서 3,984개 중 13.4%가 치명 이슈 보유. 외부 스킬 도입 전 코드 검토 필수 (practical-devsecops.com, arxiv.org PhantomSkill)
- 2026.5 Five Eyes(CISA·NSA 등) 에이전틱 AI 공동 지침 발행: 프롬프트 인젝션을 핵심 위협으로 명시, 최소권한·휴먼 승인 게이트 권고 (sysdig.com)
- 2026.9 패치 튜즈데이 973건 CVE(전월 대비 +28~30%), 실제 악용 제로데이 2건(CVE-2026-81963, -85880)이 CISA KEV 등재. Windows DNS RCE CVE-2026-69730(CVSS 9.8) 주간 내 패치 (tech-insider.org, cisa.gov)
- CISA KEV 9월 추가분에 SonicWall, JFrog Artifactory, Starlette(Python ASGI) 포함 — Python 웹 스택 사용 팀은 Starlette/FastAPI 버전 즉시 확인 (thehackernews.com, senserva.com)

## 소프트웨어 공급망
- 2026.8 "Shai-Hulud" 웜이 Keyv 계열 등 1,300+ 패키지 버전 감염(월 20억 다운로드 규모), 개발자 자격증명 탈취 후 자기 전파. TanStack 등 160+ npm/PyPI 패키지도 "ChainDrop" 웜 피해 (csa.gov.sg, orca.security, securitylabs.datadoghq.com)
- 2026.5 Microsoft 보고: 타이포스쿼팅 npm 패키지 14개가 4시간 내 게시되어 AWS 키·Vault 토큰·CI/CD 시크릿 수집. 내부 스코프명을 흉내낸 dependency confusion 33건도 확인 (microsoft.com)
- Red Hat @redhat-cloud-services npm 패키지 침해(RHSB-2026-006) — 벤더 공식 스코프도 안전 보장 없음 (access.redhat.com)
- Sonatype 2026: 2025년 한 해 신규 악성 OSS 패키지 45만 4,600개, 누적 차단 123만 개 (shattered.io, phoenix.security)
- 방어 기본선: 락파일 커밋 + pnpm minimumReleaseAge ≥ 7일(기본 1일) + trustPolicy: no-downgrade로 게시 인증 약화 감지 (pnpm.io, mondoo.com)
- pnpm 11.3 stage(스테이지드 게시)·trustLockfile, 11.9 sbom --exclude-peers 추가. SBOM 도구가 pnpm-lock.yaml 2문서 구조를 제대로 읽는지 확인(첫 문서만 읽으면 "의존성 0"으로 거짓 통과) (pnpm.io)
- GitHub Actions는 태그 대신 커밋 SHA 고정, npm은 Trusted Publishing(OIDC)으로 장기 토큰 제거, CI 시크릿은 job 단위 최소 스코프 (dev.to, supabase.com)

## 개인정보·컴플라이언스
- 한국: 개정 개인정보보호법·시행령 2026.9.11 시행 — 반복·대규모(1천만 명 이상) 유출 시 과징금 상한 매출 3%→10%. 미신고 적발 시 30% 가중, 증거 은폐·인멸 별도 제재, 유출 신고포상금 도입 (ajunews.com, etnews.com, heraldcorp.com)
- 2026년 8월 기준 개인정보위 과징금 누계 7,589억 원(2025년 1,678억). 쿠팡 3,755만 명 유출 건 6,247억 원이 82% 차지 (mt.co.kr)
- AI 학습 특례 개정안 2026.9.8 공포(법률 제21910호), 2027.3.9 시행. 학습·검증·운영 단계별 데이터 사용 내역·접근권한·로그·파기 절차·내부 점검 증빙 체계 지금부터 준비 (lawtimes.co.kr, privacy.go.kr)
- 2026년 내 전송요구권이 의료·통신·유통으로 확대, 자동화 결정 거부권 조항 시행, 하반기 국외 이전 체계 개정 적용 (svwvs.com, policygo.nantestudio.com)
- EU AI Act 2026.8.2 고위험 시스템 의무 발효: 채용·교육·필수 서비스 접근·생체인식 등. Article 50 투명성 의무로 AI 상호작용 시 사용자 고지 필수 (datamatters.sidley.com, mondaq.com)
- AI Act는 GDPR 위에 겹쳐 적용 — 개인정보 처리 AI는 Article 6 적법 근거를 별도 충족해야. 금지 관행 위반 시 최대 3,500만 유로 또는 전세계 매출 7% (aiactblog.nl, gdpradvisor.co.uk)
- GDPR 누적 과징금 58.8억 유로(2024년 한 해 12억). 로그·에러 리포트·LLM 프롬프트에 PII 유입되는 경로를 코드리뷰 체크리스트에 포함 (secureprivacy.ai)
