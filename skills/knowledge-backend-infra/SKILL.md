---
name: knowledge-backend-infra
description: 백엔드·아키텍처·인프라 최신 지식 — 서버, DB, DevOps, 기술전략. 개발 총괄·백엔드 역할이 작업 전 참고 (갱신: 2026-08-08)
---

# backend-infra 도메인 지식 (2026-08-08)

> 역할별 에이전트 KNOWLEDGE 블록을 도메인 단위로 통합한 지식 베이스.
> `agent-team learn --domains` 가 이 파일을 통째로 갱신한다.

## architect
- AI 코딩 에이전트가 코드 변경 비용 구조를 바꾸면서 모듈러 모놀리스 회귀가 본격화 — 조직 42%가 마이크로서비스를 더 큰 단위로 재통합, 에이전트가 단일 컨텍스트로 추론 가능한 도메인 정렬 모듈 경계가 새 설계 기준 (medium.com, ancient.global, rational.partners)
- MCP 2026-07-28 스펙이 스테이트리스 아키텍처로 전환 — 엔터프라이즈 에이전틱 워크플로우를 수평 확장 가능하게 만들었으므로 AI 연동 계층 설계 시 세션 상태 가정 제거 필요 (blog.modelcontextprotocol.io)
- 엔터프라이즈 에이전트 아키텍처는 "MCP(수직 도구 통합) + A2A(수평 에이전트 조율)" 2계층 스택이 사실상 기본값으로 정착, 양쪽 모두 Linux Foundation 거버넌스 (zylos.ai, arxiv.org)
- 이벤트 드리븐 아키텍처가 니치에서 주류로 — 실시간성이 기본 요구가 되면서 분산 시스템의 표준 통신 패턴으로 채택 확대, 설계 초기부터 옵저버빌리티 우선 원칙과 결합 권장 (upcloud.com, codewave.com)
- 플랫폼 엔지니어링이 사실상 필수화 — 대형 조직 80%가 플랫폼팀 운영, 프로비저닝 시점에 FinOps 가드레일·보안을 내장하고 모놀리식 IDP 대신 컴포저블 플랫폼으로 이동 (platformengineering.org, leanopstech.com)
- "AI-네이티브 시스템 설계" 프레임 부상 — LLM 지능을 부가 기능이 아닌 핵심 구조 제약으로 두고 스택·모듈 경계를 설계하는 접근이 시스템 디자인 가이드의 표준 챕터로 편입 (dev.to, grokkingthesystemdesign.com)

Sources: [rational.partners](https://rational.partners/insights/microservices-vs-monoliths-in-the-agentic-age), [ancient.global](https://www.ancient.global/en/blogs-ancient/microservices-vs-modular-monolith-2026), [blog.modelcontextprotocol.io](https://blog.modelcontextprotocol.io/posts/2026-07-28/), [zylos.ai](https://zylos.ai/research/2026-03-26-agent-interoperability-protocols-mcp-a2a-acp-convergence/), [upcloud.com](https://upcloud.com/blog/modern-software-architecture-patterns-2026-scales-production/), [platformengineering.org](https://platformengineering.org/blog/10-platform-engineering-predictions-for-2026), [leanopstech.com](https://leanopstech.com/blog/platform-engineering-trends-2026/), [dev.to](https://dev.to/devin-rosario/the-complete-guide-to-system-design-in-2026-ai-native-and-serverless-1kpb)

## backend-dev
- **PostgreSQL 18**: 비동기 I/O(AIO)로 스토리지 읽기 최대 3배 개선, `uuidv7()` 기본 제공, B-tree skip scan, OAuth 인증, 임시(temporal) 제약 지원 — PK를 UUIDv7로 전환 검토 가치 있음 ([postgresql.org](https://www.postgresql.org/about/news/postgresql-18-released-3142/))
- **Spring Boot 4.1**(2026-06): gRPC 1급 지원, lazy JDBC 커넥션, `InetAddressFilter` 기반 SSRF 방어, `@RedisListener`, 타입세이프 프로퍼티 경로 — 4.0의 Jakarta EE 11·Jackson 3·JSpecify null-safety 위에 추가 ([danvega.dev](https://www.danvega.dev/blog/spring-boot-4-is-here), [herodevs.com](https://www.herodevs.com/blog-posts/spring-boot-versions-eol-dates-and-latest-releases-april-2026))
- **API-first + AI-ready 설계**가 프레임워크 선정 기준으로 정착: 처리량·확장성과 함께 관측성(observability)과 LLM/ML 파이프라인 연동 용이성을 초기 설계 단계에서 평가 ([digitalapi.ai](https://www.digitalapi.ai/blogs/top-backend-frameworks-your-guide-to-choosing-the-best), [blog.logrocket.com](https://blog.logrocket.com/8-trends-web-dev-2026/))
- **Hono** 등 런타임 불문(Node/Bun/Deno/엣지) 초경량 프레임워크가 API 서버 표준 후보로 부상 — 스키마 검증 내장, 엣지/서버리스 배포에 유리 ([quartzdevs.com](https://quartzdevs.com/resources/best-backend-frameworks-2026-top-server-side-tools))
- **Node.js 24 LTS**(현재 24.19, 2026-08-03): V8 13.6 탑재로 대형 엔진 업그레이드 — LTS 마이그레이션 시점 도래 ([blog.logrocket.com](https://blog.logrocket.com/node-js-24-new/), [versionlog.com](https://versionlog.com/nodejs/24/))
- **보안 기본값 강화 흐름**: 프레임워크 차원에서 안전하지 않은 패턴 차단(safer API, 정적 분석 경고)과 SSRF·인젝션류 방어 내장이 표준화 — 앱 코드가 아닌 프레임워크 설정으로 방어층 확보 권장 ([blog.logrocket.com](https://blog.logrocket.com/8-trends-web-dev-2026/))

## blockchain-dev
- 이더리움 Fusaka 업그레이드(2025-12 활성화)가 PeerDAS 기반 블롭 확장, 가스 한도 60M 표준화(EIP-7935), secp256r1 네이티브 검증(EIP-7951)을 도입해 패스키 지갑 검증 비용이 크게 낮아짐 — 컨트랙트에서 P-256 프리컴파일 활용 검토 필요 (ethereum.org, alchemy.com)
- Solidity 0.8.35~0.8.36이 ERC-7201 네임스페이스 스토리지 슬롯 계산용 `erc7201` 빌트인과 IR 파이프라인 보안 픽스를 포함 — 프록시/업그레이더블 패턴 작성 시 최신 컴파일러(0.8.36+)로 업그레이드 권장 (soliditylang.org, docs.soliditylang.org)
- 2026년 상반기 예정인 Glamsterdam 하드포크가 검열 저항성·MEV 투명성·UX 개선을 목표로 준비 중이라 컨트랙트/인프라의 포크 호환성 사전 점검이 필요 (coingecko.com, ethereum.org)
- Foundry가 사실상 표준 툴체인으로 굳어졌고 나이틀리 릴리스가 활발히 유지되는 중 — Hardhat 대비 테스트 속도 우위로 신규 프로젝트는 Foundry 우선 채택이 베스트프랙티스 (github.com/foundry-rs, dev.to)
- 컨트랙트 감사에서 AI 스크리닝(Slither·MythX 등)+수동 리뷰 하이브리드가 표준화되는 추세이며, CI/CD 파이프라인에 정적분석을 커밋 단계부터 통합하는 것이 권장됨 (smartcontractshacking.com, nadcab.com)
- L2는 블롭 도입 이후 트랜잭션 비용이 0.1센트 미만으로 하락했고 ZK 롤업이 고volume 프리미티브의 주류로 부상, OP Stack 계열은 표준화된 인터롭 레이어로 통합 중 — L2 선택 시 인터롭·시퀀서 구조 고려 필요 (dextools.io, cryptopolitan.com)

Sources: [ethereum.org Fusaka](https://ethereum.org/roadmap/fusaka/), [Alchemy Fusaka dev guide](https://www.alchemy.com/blog/ethereum-fusaka-upgrade-dev-guide-to-12-eips), [Solidity releases](https://www.soliditylang.org/blog/category/releases/), [Foundry releases](https://github.com/foundry-rs/foundry/releases), [CoinGecko Fusaka](https://www.coingecko.com/learn/what-is-ethereum-fusaka-upgrade), [AI-assisted auditing](https://smartcontractshacking.com/learn/security/ai-assisted-smart-contract-auditing), [Ethereum ecosystem 2026](https://www.dextools.io/tutorials/the-ethereum-ecosystem-in-2026-a-comprehensive-guide), [L2 adoption 2026](https://www.cryptopolitan.com/layer-2-adoption-2026-predictions/)

## cto
오늘 기준 CTO가 새로 챙겨야 할 핵심 동향입니다.

- **에이전틱 AI가 "마이크로서비스 혁명" 단계로 진입** — 만능 단일 에이전트에서 오케스트레이터가 전문 에이전트(researcher·coder·validator)를 조율하는 다중 에이전트 구조로 이동, 각 에이전트를 독립 배포·교체 가능한 유닛으로 설계하는 것이 프로덕션 표준. (cio.com, firecrawl.dev)
- **개방형 상호운용 표준을 아키텍처 기본값으로** — MCP(도구·컨텍스트 교환)와 A2A(에이전트 간 통신) 프로토콜을 채택해 벤더 종속을 피하고, 오케스트레이션 계층과 모델 API 호출을 분리하는 추상화 계층 확보가 성숙도의 지표. (kai-waehner.de)
- **SLM(소형·과업특화 모델)로 비용 최적화** — 추론 연산 10배 절감·90%+ 비용 절감 효과, Gartner는 2027년까지 과업특화 소형 모델 사용량이 범용 LLM의 3배를 넘을 것으로 전망. (machinelearningmastery.com)
- **추론(inference)이 학습을 제치고 지배적 워크로드로** — 데이터센터 비용 축이 이동하면서 지연시간·토큰당 비용·처리량이 최상위 제약조건이 됨, 인프라 설계 우선순위 재조정 필요. (jagadishwrites.com)
- **관측성·거버넌스가 필수 레이어로 승격** — MLflow 등 프로덕션 에이전트 구축 가이드가 평가·추적·모니터링·드리프트 감지를 사전 요건으로 규정, "프로토타입은 쉽고 프로덕션은 취약"이 핵심 리스크. (mlflow.org)
- **병목은 기술이 아니라 운영모델·인재** — CTO 63%가 AI/ML·클라우드·데이터 엔지니어링 인재난을 호소, 인간 워크플로 기준의 낡은 운영모델을 에이전트 자율성에 맞게 재설계하는 것이 최대 과제. (cio.com, correctcontext.com)

Sources: [cio.com](https://www.cio.com/article/4134741/how-agentic-ai-will-reshape-engineering-workflows-in-2026.html), [firecrawl.dev](https://www.firecrawl.dev/blog/agentic-ai-trends), [kai-waehner.de](https://www.kai-waehner.de/blog/2026/04/06/enterprise-agentic-ai-landscape-2026-trust-flexibility-and-vendor-lock-in/), [machinelearningmastery.com](https://machinelearningmastery.com/7-agentic-ai-trends-to-watch-in-2026/), [jagadishwrites.com](https://www.jagadishwrites.com/blog/ai-infrastructure-trends-every-developer-should-know-in-2026), [mlflow.org](https://mlflow.org/articles/building-production-ready-ai-agents-in-2026/), [correctcontext.com](https://correctcontext.com/tech-leadership-and-cto-challenges-the-complete-2026-guide-for-engineering-leaders/)

## dev-backend
- **인증은 OAuth 2.0 + PKCE가 신규 표준**, 토큰은 DPoP/mTLS로 발신자 바인딩·단명(short-lived)화하고 패스키+OIDC+TOTP 조합이 이상적 (skycloak.io, workos.com)
- **API-First 워크플로**: OpenAPI 3.2 스키마를 먼저 정의하고 게이트웨이 레벨에서 요청 검증·WAF·SSRF 방어를 강제 (alphonsolabs.com, raidiam.com)
- **Zero-Trust 보안 기본화**: 최소권한 스코프, 감사 가능한 인가 결정, 기본 암호화를 모든 레이어에 내장 (cerbos.dev, refontelearning.com)
- **서버리스가 신규 API의 기본값**: 콜드스타트 50ms 미만·월 1천만 요청 이하 구간에서 컨테이너보다 저렴, FaaS엔 Go/Rust 선호 확대 (asappstudio.com, tech-insider.org)
- **경량·고성능 런타임 이동**: Node 22+의 HTTP/3·QUIC 네이티브 지원, 폴리글랏 전략(성능=Go/Rust, AI·ML=Python FastAPI) 확산 (coderio.com, medium.com)
- **인가에 정책 엔진 분리**: Cerbos·OPA 등으로 권한 로직을 코드에서 분리해 일관·감사·재사용 가능하게 externalized authorization 도입 (cerbos.dev)

## devops
- **AI 통합 CI/CD가 표준화** — DevOps 팀의 76%가 CI/CD에 AI를 도입, 파이프라인이 자가 복구·정책 기반·적응형(autonomous pipelines)으로 진화 중 (talent500.com, requirementguide.com)
- **Kubernetes v1.37, 8/26 릴리스 예정** — kubectl KYAML 출력·pod-level resources GA, DRA 디바이스 taint/toleration GA, StatefulSet `EnforcedRollingUpdate` 알파 등 86개 변경 (kubernetes.io, cloudsmith.com)
- **OpenTelemetry CNCF 졸업(2026.5)** — 사실상 관측성 표준으로 확정, 신규 클라우드 네이티브 계측의 ~95% 점유 전망, AI 워크로드 관측 레이어로도 확장 (cncf.io, elastic.co)
- **OpenTofu-Terraform 본격 분기** — OpenTofu가 state 암호화·ephemeral values·OCI 레지스트리로 앞서고, EU CRA(2027.12 발효) 규제 부담도 가벼워 Fidelity·GitLab 등 대규모 전환 사례 확산 (jorijn.com, dev.to)
- **플랫폼 엔지니어링/IDP가 핵심 조직 트렌드** — 셀프서비스 내부 개발자 플랫폼으로 거버넌스와 개발 속도를 동시 확보하는 플랫폼 팀 모델이 대세 (realvnc.com, wp301redirects.com)
- **데몬리스 컨테이너 런타임(Podman) 부상 + IaC 공급망 보안 강화** — Docker 데몬 탈피 흐름과 함께 GitHub Actions에 Trivy 스캔·모듈/프로바이더 서명 검증을 넣는 게 베스트프랙티스로 정착 (talent500.com, dev.to)

Sources: [talent500.com](https://talent500.com/blog/2026-devops-trends-autonomous-pipelines-platform-engineering-ai/), [requirementguide.com](https://www.requirementguide.com/blog/devops-automation/devops-trends-2026-ai-gitops-platform-engineering-cicd-devsecops-and-best-practices), [kubernetes.io](https://kubernetes.io/blog/2026/07/31/kubernetes-v1-37-sneak-peek/), [cloudsmith.com](https://cloudsmith.com/blog/kubernetes-1-37-what-you-need-to-know), [cncf.io](https://www.cncf.io/announcements/2026/05/21/cloud-native-computing-foundation-announces-opentelemetrys-graduation-solidifying-status-as-the-de-facto-observability-standard/), [elastic.co](https://www.elastic.co/blog/2026-observability-trends-generative-ai-opentelemetry), [jorijn.com](https://jorijn.com/en/blog/opentofu-vs-terraform-2026-the-fork-finally-diverged/), [dev.to](https://dev.to/matheus_releaserun/iac-security-in-2026-terraform-checkov-and-cloud-drift-detection-5n), [realvnc.com](https://www.realvnc.com/en/blog/devops-trends/), [wp301redirects.com](https://wp301redirects.com/latest-devops-best-practices-for-2026-ci-cd-kubernetes-ai-automation-and-platform-engineering-trends/)

## explore
- 2026년 AI 코딩의 병목은 코드 생성이 아니라 "대형 저장소 이해"로 이동 — 벡터 임베딩·AST 그래프·사전계산 컨텍스트 파일·멀티에이전트 지식추출이 핵심 기법으로 정리됨 (zylos.ai, buildmvpfast.com)
- 로컬 우선 코드 지식그래프가 대세: CodeGraph(SQLite+tree-sitter, 47k★)·GitNexus(42k★)가 온디바이스로 구조를 사전계산해 MCP로 서빙, 클라우드·임베딩 API 없이 코드 유출 제로 (pharaoh.so, tokenade.net)
- LSP 연동 시 코드 탐색이 텍스트 검색 대비 극적으로 빨라지고(45초→50ms), tree-sitter 기반 지식그래프를 MCP로 노출하면 에이전트 토큰 사용 약 10배·툴 호출 2.1배 절감 보고 (anthonywest.co.uk, zylos.ai)
- 엔터프라이즈는 SCIP식 시맨틱 인덱싱·히스토리 인지 검색·중앙 코드그래프 서비스로 수렴 — "구조를 사전계산해 툴로 노출"이 탐색 아키텍처의 표준 패턴 (rywalker.com)
- probe 같은 ripgrep 속도+tree-sitter AST 결합형 시맨틱 검색 CLI가 에이전트용 탐색 도구로 부상, "CLI의 귀환" 흐름 (github.com/probelabs, cocoindexio.substack.com)
- 탐색 결과물인 AGENTS.md는 150줄 이하로 짧게, 규칙 나열 대신 코드 예시 1개+상세 문서로의 브레드크럼(점진적 공개)이 베스트프랙티스 — 2,500개 저장소 분석에서 장문 파일은 비용만 20~23% 증가 (augmentcode.com, agents.md)

Sources: [Zylos Research](https://zylos.ai/research/2026-04-19-codebase-intelligence-repository-understanding-ai-agents/), [Pharaoh](https://pharaoh.so/blog/codebase-intelligence-tool-comparison-2026/), [Anthony West](https://anthonywest.co.uk/research/code-intelligence-indexing-2026-openai), [Ry Walker](https://rywalker.com/research/code-intelligence-tools), [probe](https://github.com/probelabs/probe), [CocoIndex](https://cocoindexio.substack.com/p/we-launched-a-code-search-cli-for), [Augment Code](https://www.augmentcode.com/guides/how-to-build-agents-md), [agents.md](https://agents.md/)

## fullstack-integrator
- **Server Actions/Server Functions 안정화로 "백엔드 = 프론트 리포 안의 폴더" 패턴이 보편화** — API 라우트 없이 폼·이벤트에서 직접 서버 함수를 호출하는 배선이 통합 표준으로 정착 (logrocket.com, nextjs.org)
- **Next.js 16.x: Turbopack이 dev 기본 번들러(대형 프로젝트 HMR ~10배), 16.3 Preview에 instant navigation·부분 프리페칭 도입** — 통합 담당자는 빌드 파이프라인 전환 점검 필요 (nextjs.org, releasebot.io)
- **2026년 7월 Next.js 보안 릴리스: Server Actions DoS, middleware/proxy 우회, rewrites SSRF, 서버 함수 엔드포인트 노출 패치** — 프론트-백 경계 취약점이므로 즉시 업그레이드 권장 (nextjs.org)
- **엔드투엔드 타입 안전이 기본값으로: tRPC×TanStack Query 신규 통합, TanStack Start는 컴파일 타임 풀스택 타입 강제, OpenAPI가 필요하면 oRPC v1이 대안** (trpc.io, orpc.dev, infoq.com)
- **CI/CD 시크릿은 plaintext 환경변수 대신 vault 직접 연동 + 서비스별 최소권한 주입이 표준** — 2022년 유출 시크릿의 64%가 2026년에도 미회수, 회수 파이프라인 구축이 핵심 (infisical.com, doppler.com)
- **모노레포(Nx·Turborepo) 단위 Playwright E2E를 앱별이 아닌 리포 전체 레벨로 구성하는 패턴이 확산** — @nx/playwright 플러그인 기반 CI 통합이 사실상 표준 (pliszko.com, stacks.ensono.com)

Sources: [LogRocket – 8 trends web dev 2026](https://blog.logrocket.com/8-trends-web-dev-2026/), [Next.js July 2026 Security Release](https://nextjs.org/blog/july-2026-security-release), [Next.js Server Actions guide](https://nextjs.org/docs/app/guides/server-actions), [Releasebot – Next.js updates Aug 2026](https://releasebot.io/updates/vercel/next-js), [tRPC blog](https://trpc.io/blog), [oRPC v1 announcement](https://orpc.dev/blog/v1-announcement), [InfoQ – oRPC v1](https://infoq.com/news/2025/12/orpc-v1-typesafe/), [Infisical – Secrets management best practices 2026](https://infisical.com/blog/secrets-management-best-practices), [Doppler – env var secrets 2026](https://www.doppler.com/blog/environment-variable-secrets-2026), [pliszko.com – Playwright in Nx monorepo](https://pliszko.com/blog/post/2024-07-25-setting-up-e2e-tests-in-nrwl-nx-monorepo-with-playwright), [Ensono Stacks – Testing with Playwright](https://stacks.ensono.com/docs/testing/testing_in_nx/testing_with_playwright)

## orchestrator
- **오케스트레이션 패턴 표준화**: 프로덕션에서는 supervisor/worker(계층 위임), fan-out(병렬 산개-수집), pipeline(순차), debate(다관점 비평), swarm(동적 피어) 5~6개 패턴이 정착 — "가장 정교한 패턴"이 아니라 문제에 맞는 최경량 패턴 선택이 베스트프랙티스 (beam.ai, digitalapplied.com)
- **실패 원인 1위는 컨텍스트 비일관성**: 멀티에이전트 실패의 주범은 패턴 선택이 아니라 공유 컨텍스트/상태 관리 부재 — 파이프라인 단계 간 영속 상태 저장소(shared context layer) 설계가 핵심 (atlan.com)
- **비용-정확도 트레이드오프 정량화**: 멀티에이전트는 단일 대비 약 2배 비용에 정확도 +2.1%p 수준 — 복잡한 크로스도메인 작업에만 병렬 위임을 쓰고 단순 작업은 직접 처리하는 라우팅 판단이 오케스트레이터의 역할 (beam.ai)
- **Claude Code Agent Teams 부상**: 서브에이전트(결과만 필요할 때, 저비용)와 Agent Teams(팀원별 독립 컨텍스트 + 공유 태스크 리스트 + 상호 메시징)의 사용처 구분이 2026년 오케스트레이션의 핵심 설계 결정 (tembo.io, cloudzero.com)
- **A2A v1.0 + MCP 2계층 스택이 사실상 표준**: 2026년 4월 A2A v1.0 출시 후 150+ 조직 지원, MCP는 월 9,700만 SDK 다운로드 — "수직 도구 연결은 MCP, 수평 에이전트 간 조율은 A2A" 구조가 엔터프라이즈 기본 아키텍처화 (glukhov.org, zylos.ai)
- **거버넌스 통합**: MCP·A2A 모두 Linux Foundation 산하 Agentic AI Foundation(2025년 12월 출범, OpenAI·Anthropic·Google·Microsoft·AWS·Block 공동 창립)으로 이관 — 프로토콜 수렴 가속 (zylos.ai)

Sources: [beam.ai](https://beam.ai/agentic-insights/multi-agent-orchestration-patterns-production) · [atlan.com](https://atlan.com/know/multi-agent-system-orchestration/) · [digitalapplied.com](https://www.digitalapplied.com/blog/multi-agent-orchestration-5-patterns-that-work) · [tembo.io](https://www.tembo.io/blog/claude-code-multi-agent-orchestration) · [cloudzero.com](https://www.cloudzero.com/blog/claude-code-agents/) · [glukhov.org](https://www.glukhov.org/ai-systems/comparisons/a2a-protocol-2026-adoption/) · [zylos.ai](https://zylos.ai/research/2026-03-26-agent-interoperability-protocols-mcp-a2a-acp-convergence/)

## server-engineer
- PostgreSQL가 사실상 기본값으로 굳어짐: pgvector·JSONB·RLS(멀티테넌시)·전문검색을 단일 엔진으로 흡수해 "polyglot persistence" 피로를 줄이는 추세 (instaclustr.com, makerkit.dev)
- PostgreSQL 18 신기능이 스키마 설계에 직접 영향: 네이티브 `uuidv7()`(인덱스 지역성↑), 가상 생성 컬럼, `WITHOUT OVERLAPS` 시간 제약, B-tree skip scan (digitalapplied.com, jusdb.com)
- 무중단 온라인 스키마 변경이 표준 요구사항으로 격상 — 마이그레이션 다운타임은 "아키텍처 실패"로 간주, 3NF 정규화 기본 후 선택적 비정규화 원칙 (jusdb.com, dev.to)
- 분산 SQL(CockroachDB·AlloyDB)이 성숙해 관계형 스키마 그대로 수평 확장·글로벌 일관성 확보; 500GB 미만은 여전히 수직 확장+커넥션 풀링으로 충분 (velodb.io, wittgeo.medium.com)
- 벡터 검색이 전용 DB에서 코어 DB로 내재화: Azure SQL Hyperscale 벡터 인덱스(2026-03), Pinecone 서버리스가 서버 프로비저닝 없이 수십억 벡터 저장 (netcomlearning.com, marktechpost.com)
- 스테이트풀 서버리스 성숙: Aurora Serverless 스케일 30% 개선(2026-04), 상태·영속성 유지형 서버리스가 콜드스타트·관측성 한계를 해소하며 프로덕션 표준화 (middleware.io, techaheadcorp.com)

## supabase-backend
- Auth 패스키(WebAuthn) 정식 제공 — 생체인증·하드웨어 키 로그인이 피싱 저항형으로 지원되므로 RAKWAN 인증 설계에 우선 검토 (supabase.com)
- Realtime Broadcast가 바이너리(bytea) 페이로드를 지원 — 단 Dart/Kotlin 클라이언트는 미지원·구버전 SDK는 조용히 드롭하므로 Flutter 연동 시 주의 (supabase.com)
- 대시보드에 RLS Tester(Feature Preview) 추가 — 임의 역할로 SELECT를 실행해 정책 디버깅 가능, RLS 검증 워크플로에 도입 권장 (supabase.com)
- 셀프호스트 기본 이미지가 Postgres 17로 상향, 2026-08-09 주부터 API 게이트웨이 기본값이 Kong→Envoy로 교체 예정 (supabase.com, github.com)
- RLS 성능 베스트프랙티스: 재귀적 권한 체크는 SECURITY DEFINER 헬퍼 함수로, 역할 판별은 JWT 커스텀 클레임(app_metadata)으로 DB 조회 제거 (supabase.com, makerkit.dev)
- Edge Functions에서 트랜잭션+RLS가 필요하면 Postgres 함수(RPC) 호출 패턴이 표준 — 저장 프로시저가 호출자 권한으로 실행되어 RLS 유지 (marmelab.com); 커스텀 OAuth2/OIDC IdP 연결(PKCE 기본) 및 ISO 27001:2022 인증도 확보 (supabase.com)

Sources: [Supabase Changelog](https://supabase.com/changelog), [Developer Update — June 2026](https://supabase.com/changelog/46689-developer-update-june-2026), [Developer Update — July 2026](https://supabase.com/changelog/47796-developer-update-july-2026), [Developer Update — May 2026](https://supabase.com/changelog/45702-developer-update-may-2026), [RLS Performance and Best Practices](https://supabase.com/docs/guides/troubleshooting/rls-performance-and-best-practices-Z5Jjwv), [Supabase RLS Best Practices (Makerkit)](https://makerkit.dev/blog/tutorials/supabase-rls-best-practices), [Transactions and RLS in Edge Functions (Marmelab)](https://marmelab.com/blog/2025/12/08/supabase-edge-function-transaction-rls.html)

## tech-lead
- 에이전틱 코딩 재편: 상위 팀들은 대형 피처팀 대신 2~4인 '팟'으로 재구성하고, 개발자는 목표 정의→에이전트 산출물 리뷰→결과 책임의 '지휘자(conductor)' 역할로 이동 — 1인이 다수 에이전트/태스크를 병렬 감독 (dev.to, pragmaticengineer.com)
- Planner→Architect→Implementer→Tester→Reviewer 식 역할 분담형 멀티에이전트 파이프라인이 실험 단계를 지나 팀 워크플로 표준으로 정착 중 — 체크포인트·소유권·감사로그를 갖춘 구조화된 워크플로가 성패를 가름 (cio.com, blueprism.com)
- 코드리뷰 기준: PR 400라인 상한을 CI 게이트로 강제하고 스택드 PR + 머지 큐로 분해 — 큰 PR은 AI 리뷰 정확도 하락과 머지 후 재작업 증가로 직결 (codeant.ai)
- AI 리뷰 도구는 모델보다 통합 품질이 관건: CI에서 안정적으로 돌고, 라인 단위 인용·고신호 findings·필터링이 되는지가 채택 기준 — 린터/포맷터/SAST(Semgrep·Snyk)는 휴먼 리뷰 이전 단계로 전진 배치 (collinwilkins.com, blog.exceeds.ai)
- 릴리즈 게이트: 크리티컬 이슈 시 머지 차단하는 품질 게이트 + main 머지마다 스테이징 자동 배포·스모크 테스트를 기본값으로 — IDC는 2026년 중반까지 DevOps 일상 업무의 약 1/3을 에이전트가 처리할 것으로 추정 (codeant.ai, cio.com)
- AI 투자 ROI 검증 압박 강화: 사이클타임 단축·리텐션·마진 등 측정 가능한 지표로 AI 도입 효과를 입증하는 체계가 테크리드의 새 책무로 부상 (blog.mean.ceo, waydev.co)

Sources: [dev.to — Agentic Coding in 2026](https://dev.to/ailoitte_sk/agentic-coding-in-2026-how-top-engineering-teams-are-restructuring-around-ai-agents-3ne1), [Pragmatic Engineer — AI Tooling 2026](https://newsletter.pragmaticengineer.com/p/ai-tooling-2026), [CIO — Agentic AI reshaping engineering workflows](https://www.cio.com/article/4134741/how-agentic-ai-will-reshape-engineering-workflows-in-2026.html), [CodeAnt — Code Review Best Practices 2026](https://codeant.ai/blogs/code-review-process-guide), [Collin Wilkins — AI Code Review 2026](https://collinwilkins.com/articles/ai-code-review-best-practices-approaches-tools), [Exceeds — AI Code Review Hybrid Workflows](https://blog.exceeds.ai/ai-code-review-best-practices/), [Waydev — 2026 Tech Trends for Engineering Leaders](https://waydev.co/2026-tech-trends-a-guide-for-engineering-leaders/)
