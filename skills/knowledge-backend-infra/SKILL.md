---
name: knowledge-backend-infra
description: 백엔드·아키텍처·인프라 최신 지식 — 서버, DB, DevOps, 기술전략. 개발 총괄·백엔드 역할이 작업 전 참고 (갱신: 2026-09-10)
---

# backend-infra 도메인 지식 (2026-09-10)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 언어·런타임
- Go 1.27(2026-08-19 출시): 제네릭 메서드 도입, encoding/json/v2가 기본 JSON 엔진으로 승격, crypto/mldsa 양자내성 서명, 실험적 simd 패키지, 소형 할당 최대 30% 절감 (go.dev)
- JDK 27(2026-09-15 예정): G1이 모든 환경 기본 GC, 컴팩트 객체 헤더 기본화, TLS 1.3 양자내성 하이브리드 키교환, JFR 데이터 마스킹, 총 9개 JEP 확정 (openjdk.org, infoq.com)
- Java 25 LTS는 구조적 동시성 정식화·컴팩트 객체 헤더 등 18개 기능으로 현재 LTS 기준선, 신규 서비스는 25 이상 권장 (infoworld.com)
- Python 3.15(2026-10-01 예정)에서 free-threading ABI 안정화, FastAPI 0.139.2가 스레드 안전 라우터 리팩터 반영, GIL이 우연히 보장하던 상태 공유 코드 점검 필요 (medium.com, refontelearning.com)
- JS 런타임: Node.js가 여전히 엔터프라이즈 기본값, Bun은 성능·TS 우선 신규 프로젝트, Deno 2는 권한 샌드박스·엣지 배포에 적합 (dev.to)
- Rust는 1.90부터 x86_64 Linux에서 LLD 기본 링커·워크스페이스 일괄 publish 지원, Axum이 고성능 API 표준 프레임워크로 정착 (devtalk.com, rustify.rs)
- 조직 내 Go(대다수 마이크로서비스·툴링)+Rust(지연 민감 핫패스) 병행 패턴이 2026년 일반화 (devtoolswatch.com)

## 데이터베이스·스토리지
- PostgreSQL 19 베타3 진행 중, 9~10월 정식 예정: REPACK CONCURRENTLY, 병렬 autovacuum 인덱스 처리, 시퀀스 논리복제, pg_plan_advice, GROUP BY ALL, COPY TO JSON (postgresql.org)
- PG19의 SQL/PGQ 프로퍼티 그래프 기능은 2026-09-07 리버트되어 이번 버전에서 제외됨, 그래프 쿼리 의존 설계 보류 (postgresql.org)
- PostgreSQL 18(현행 안정판 18.6): 비동기 I/O로 순차스캔 최대 3배, 스킵 스캔, uuidv7(), 가상 생성 컬럼, OAuth 인증, 와이어 프로토콜 3.2 (postgresql.org)
- "Postgres 하나로 통합" 흐름: pgvector(벡터)·pg_duckdb(분석)·PostGIS(지리)를 단일 인스턴스에 얹어 DB 수 축소 (dev.to, motherduck.com)
- 분석 워크로드는 ClickHouse(대용량 이벤트·로그)와 DuckDB(임베디드·Parquet/Iceberg 직접 쿼리)로 양분, 단일 머신 분석은 둘 중 익숙한 쪽 선택 (clickhouse.com)
- Redis 호환 캐시는 Valkey(Linux Foundation, BSD)가 AWS·Google·Oracle 지원과 함께 사실상 기본값으로 이동 (jusdb.com)
- Kafka 4.x(ZooKeeper 완전 제거)에서 KIP-932 Share Consumer Group 큐 모델이 Preview로 승격, 큐 용도로 별도 브로커 도입 재검토 가능 (factorhouse.io)
- 실시간 스트리밍은 Kafka+Flink 조합이 표준, Redis Streams는 저지연 소규모 파이프라인에 국한 (kai-waehner.de)

## 컨테이너·Kubernetes
- Kubernetes v1.37 "Garhwal"(2026-08-26): 67개 개선, KYAML·metrics.k8s.io·DRA 코어·Pod Certificates가 Stable 승격 (kubernetes.io)
- v1.37에서 kube-dns·IPVS·cgroup v1 레거시 제거, 업그레이드 전 노드 cgroup v2 및 kube-proxy 모드 점검 필수 (devclass.com)
- v1.36 "Haru"(2026-04): User Namespaces, Mutating Admission Policies, 세분화된 Kubelet API 인가가 GA, 보안 기본값 강화 기조 (infoq.com)
- v1.34는 2026-10-27 EOL, 관리형 클라우드는 EOL 버전에 월 단위 연장 지원료 부과하므로 1.35+ 이관 일정 확보 (kubernetes.io, shattered.io)
- Docker Engine CVE-2026-34040(CVSS 8.8): 1MB 초과 요청 본문이 AuthZ 플러그인 우회, 특권 컨테이너 생성 가능, 즉시 패치 (cyera.com)
- 런타임 선택: 프로덕션 K8s는 containerd, 로컬·CI는 Docker, 루트리스 필요 시 Podman (eitt.academy)
- WebAssembly는 엣지 FaaS·플러그인에서 프로덕션 수준(WASI 0.3 비동기 I/O), 범용 백엔드 마이크로서비스는 스레딩 미비로 아직 부적합 (zeonedge.com, byteiota.com)

## IaC·플랫폼 엔지니어링·CI/CD
- IaC 시장은 Terraform(설치 기반 우위)·OpenTofu 1.9+(독자 기능 분기)·Pulumi(범용 언어·테스트 가능) 3분할로 안정화 (hexamatic.com.au)
- Pulumi가 HCL 네이티브 지원과 Terraform/OpenTofu 상태 파일 직접 관리, MCP 서버까지 제공하여 마이그레이션 장벽 축소 (devstarsj.github.io)
- GitOps 채택률 64%, 채택 조직 81%가 신뢰성·롤백 속도 향상 보고, ArgoCD 기반 선언적 배포가 엘리트 팀 표준 (tblocks.com)
- 플랫폼 엔지니어링이 2026년 조직 80% 수준으로 확산, 셀프서비스 내부 개발자 플랫폼(IDP)과 거버넌스 병행이 핵심 (webpronews.com)
- CI/CD 파이프라인은 정책-as-코드(OPA 등)로 보안·컴플라이언스를 강제하는 "계약"으로 진화 (requirementguide.com)
- DevOps 팀 76%가 AI를 CI/CD에 통합: 파이프라인 디버깅, 테스트 생성, 배포 위험 평가, 런북 작성 자동화 (enlightlab.com)
- DORA 2026 AI ROI 보고서: AI 도입은 개인 생산성은 높이나 배포 불안정성도 증가, 자동 테스트·CI·소규모 배치 투자로 상쇄 필요 (dora.dev, infoq.com)

## 관측성·SRE
- OpenTelemetry eBPF Instrumentation(OBI) 1.0 안정판이 2026년 핵심 목표, 제로코드 eBPF 계측과 수동 OTel SDK 계측 하이브리드가 권장 (opentelemetry.io)
- "Observability 2.0": eBPF 저수준 신호 + OTel 표준 텔레메트리 + AI 근본원인 분석 삼위일체, 알림 증가가 아닌 원인 요약이 목표 (medium.com, elastic.co)
- OTel이 GenAI 관측성 시맨틱 컨벤션을 확장, LLM 호출·토큰·에이전트 스팬을 기존 트레이스와 상관 분석 가능 (ibm.com)
- AI SRE 에이전트가 1차 대응자로 부상: Azure SRE Agent GA(2026-03), 사내 3.5만 건 인시던트 자동 완화 보고 (augmentcode.com)
- AIOps(정보 제공)와 AI SRE(직접 조사·조치)의 구분 명확화, 가드레일 내 자동 복구가 MTTR 최대 70% 단축 주장 (traversal.com, incident.io)
- 인시던트 관리 툴은 채팅 네이티브·AI 주도·보안 기본값 방향으로 재편 (incident.io)
- DORA 4대 지표만으로는 부족, 개발자 경험·AI 기여도·비즈니스 성과를 함께 추적하는 흐름 (oobeya.io)

## 클라우드·비용(FinOps)
- AWS Graviton5: 칩당 192코어(4세대 2배), L3 캐시 5배, 범용 성능 25% 향상, 신규 Nitro Isolation Engine (aws.amazon.com)
- Google Cloud Next '26: 8세대 TPU 2종, Virgo 메가스케일 데이터센터 패브릭, Gemini Enterprise 에이전트 플랫폼, 크로스클라우드 컴퓨트 (cloud.google.com)
- AWS-Google 멀티클라우드 연동 공식화로 크로스클라우드 네트워킹·운영 단순화 (ciodive.com)
- Google Cloud 8월 업데이트: DMS AI 코드 변환, Data Agent Kit(MCP 도구), AWS/Azure 데이터 크로스클라우드 캐시로 이그레스 절감 (cloud.google.com)
- Bedrock AgentCore에 거버넌스·관측성 강화, Bedrock 강화학습 파인튜닝 추가 (aws.amazon.com)
- State of FinOps 2026: FinOps 팀 98%가 AI 지출 관리, GPU 비용이 AI 조직 1위 관심사, 추론이 AI 인프라 지출 55% 차지 (finops.org)
- 엔터프라이즈 GPU 평균 활용률 약 5%(Cast AI, 2.3만 클러스터), 예약 인스턴스·모델 캐스케이드(소형 모델 80% 라우팅)로 30~90% 절감 사례 (cloudmagazin.com)

## AI 에이전트 인프라·API 설계
- MCP SDK 월 9,700만 다운로드(2026-03), Anthropic·OpenAI·Google이 네이티브 지원, 에이전트 도구 연결 표준으로 확정 (dev.to)
- 프로덕션 MCP 서버 필수 요건: OAuth 2.1, Streamable HTTP 세션 관리, 멀티테넌트 격리, 토큰 갱신 동시성, 레이트리밋 전파 (truto.one)
- 프로토콜 스택 합의: MCP(에이전트-도구), A2A(에이전트-에이전트), WebMCP(웹 접근) 3계층 (dev.to)
- 에이전트 게이트웨이에 요청 단위 인증·도구 수준 권한·전체 감사 로그를 두는 제로트러스트가 온프렘 기본 설계 (mintmcp.com)
- API는 멀티프로토콜 공존: 공개 API는 REST(OpenAPI 3.1), 클라이언트 UI는 GraphQL Federation v2, 내부 서비스는 gRPC (dev.to)
- 계약 우선(contract-first) 관행 정착: OpenAPI·SDL·proto를 코드보다 먼저 작성, AsyncAPI로 이벤트 API까지 통합 (buildwithfern.com, asyncapi.com)
- AI 기반 API 게이트웨이가 문서 자동 생성·이상 탐지·레이트리밋 수행, 게이트웨이+서비스메시로 거버넌스 중앙화 (alphonsolabs.com)

## 아키텍처·기술전략
- 마이크로서비스 도입 조직 42%가 일부 서비스를 재통합(CNCF 2025), 디버깅 복잡도·운영비·네트워크 지연이 원인 (horizonlabs.com.au)
- 모듈러 모놀리스가 기본 출발점으로 복귀: 모듈별 인터페이스·별도 스키마 유지 후 필요 시 추출 (javacodegeeks.com)
- 팀 역량·운영 성숙도에 맞춘 실용적 선택이 원칙, 유행 기반 분산화 지양 (ancient.global)
- 백엔드는 API 구축만큼 이벤트 오케스트레이션·스트리밍 중심으로 이동, 비동기 프로그래밍·메시지 큐 역량 필수 (talent500.com)
- DORA J커브: AI 도입 초기 생산성 일시 하락은 정상, 코드 리뷰 자동화와 배포 파이프라인 강화가 ROI 결정 (kodus.io)
- 클라우드 비용 상승과 AI 워크로드가 아키텍처 재검토 압력, 단순화·통합이 2026년 주요 동인 (zignuts.com)

## 보안·공급망
- 2025년 공급망 공격 2배 증가, 신규 악성 패키지 45만 건 이상(Sonatype), 조직 70%가 서드파티 관련 사고 경험 (cloudsmith.com)
- SLSA 1.2 공개, Sigstore(cosign·Fulcio·Rekor)와 함께 빌드 출처 증명이 운영 필수 요건으로 격상 (openssf.org)
- SBOM은 정적 문서에서 VEX 데이터로 지속 갱신되는 "살아있는" 인벤토리로 전환, EU CRA·EO 14028 규제 압력 (darkreading.com)
- 이미지 거버넌스 자동 강제: 신뢰 베이스 이미지, 서명, SBOM 생성, Trivy/Grype 스캔을 릴리스 파이프라인에 내장 (orca.security)
- K8s 어드미션 컨트롤로 미서명 이미지 배포 차단, Mutating Admission Policy GA로 정책 적용 범위 확대 (stribog.com)
- 양자내성 암호 전환 시작: Go 1.27 ML-DSA, JDK 27 하이브리드 TLS 키교환, Java 25 KDF API (go.dev, openjdk.org)
- RSAC 2026 주제는 에이전틱 AI 보안, 자율 에이전트의 스캔·복구와 동시에 MCP 기반 에이전트 위협 분류·검증 모델 연구 확산 (cloudsmith.com, arxiv.org)
