---
name: knowledge-data-analytics
description: 데이터 분석·엔지니어링 최신 지식 — 지표, 파이프라인, 실험. 데이터 역할이 작업 전 참고 (갱신: 2026-08-30)
---

# data-analytics 도메인 지식 (2026-08-30)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 데이터 플랫폼 (Snowflake·Databricks)

- Databricks가 DAIS 2026에서 OLTP+OLAP을 단일 오픈포맷 사본으로 통합하는 LTAP 아키텍처를 발표 — 트랜잭션·분석 이중 저장 시대 종료 신호 (futurumgroup.com)
- Databricks Lakehouse//RT(신형 Reyden 엔진)와 서버리스 푸시 수집 API Zerobus로 실시간 분석·수집을 플랫폼 내장화 (flexera.com)
- LakeFlow 커넥터가 100개 이상으로 확대 — Salesforce·Workday·GA 등 SaaS 수집을 별도 ELT 툴 없이 처리하는 흐름 (atlan.com)
- Snowflake Summit 2026 핵심은 Horizon Context — 거버넌스된 시맨틱 컨텍스트로 AI 생성 분석의 신뢰성 문제를 정면 대응 (daanalytics.substack.com)
- Snowflake가 AWS와 5년 60억 달러 인프라 계약 체결, "Making AI Real for Business"를 기치로 신뢰 가능한 데이터 위 AI 강조 (flexera.com)
- 대기업은 Databricks(AI 개발)+Snowflake(거버넌스 분석)+Fabric(리포팅) 하이브리드 조합이 일반화 (thecodew.com)

## 레이크하우스·오픈 테이블 포맷

- Apache Iceberg가 데이터 레이크의 사실상 표준 테이블 포맷으로 확정 — 신규 파이프라인은 Iceberg 우선 검토가 기본값 (olake.io)
- 2026년은 Iceberg/Delta 위에서 직접 수집·처리·서빙하는 Python-first 도구 생태계가 성숙 (datalakehousehub.com)
- Debezium CDC + Flink 인라인 변환 → Iceberg/Delta 커밋의 실시간 레이크하우스 수집 패턴이 표준화 (datalakehousehub.com)
- 구글 등 주요 클라우드가 Iceberg 지원을 공식화하며 벤더 종속 없는 멀티엔진 접근이 현실화 (cloud.google.com)
- DuckLake 1.0 등 단순성·저지연 지향 경량 레이크하우스 포맷이 Iceberg의 대안 축으로 부상 (motherduck.com)

## 분석 엔지니어링 (dbt·시맨틱 레이어)

- dbt Fusion(네이티브 SQL 이해 엔진)으로 IDE 실시간 오류 피드백·초단위 로컬 컴파일·state-aware CI가 표준 개발 경험이 됨 (datalakehousehub.com)
- dbt Semantic Layer(MetricFlow)가 프로덕션급으로 성숙 — 지표 정의 하나로 BI 대시보드와 AI 에이전트 질의를 동시 커버 (docs.getdbt.com)
- 거버넌스된 시맨틱 레이어가 AI 분석 오류 대부분을 쿼리 실행 전에 차단한다는 게 2026년 컨센서스 (omni.co)
- 시맨틱 레이어 시장은 dbt SL·Cube·AtScale 3강 구도, 헤드리스(BI 도구 분리형) 방식이 임베디드·AI 용도로 확산 (kaelio.com, getbruin.com)
- dbt가 시맨틱 레이어 스펙 현대화를 진행 중 — 지표 정의 스키마 변경 예정이므로 추적 필요 (docs.getdbt.com)

## DuckDB·경량 분석 엔진

- DuckDB v2.0(2026년 가을 예정)에 Parquet/CSV 비동기 I/O 도입 — 원격 스토리지 쿼리 성능 대폭 개선 (motherduck.com)
- MotherDuck이 Postgres 와이어 프로토콜 엔드포인트 제공 — 아무 Postgres 클라이언트로 DuckDB SQL 실행 가능 (motherduck.com)
- MotherDuck Flights: AI 에이전트가 수집 파이프라인을 직접 생성·스케줄·운영하는 에이전트 네이티브 파이프라인 출시 (siliconangle.com)
- Dives(퍼블릭 프리뷰): AI 에이전트가 SQL 조합으로 공유 가능한 실시간 시각화를 생성 (motherduck.com)
- pg_duckdb 베타로 PostgreSQL 안에서 DuckDB 분석 쿼리를 직접 실행하는 하이브리드 패턴 확산 (hpcwire.com)

## 오케스트레이션·파이프라인

- Airflow 3.0의 asset 기반 스케줄링으로 Dagster식 자산 중심 모델과의 격차가 크게 축소 (astronomer.io)
- Airflow는 여전히 엔터프라이즈 지배적(생태계·채용풀 최대)이지만, 신규 프로젝트에서 Airflow를 택할 근거는 2020년보다 약해졌다는 평가 (getorchestra.io)
- Dagster는 자산 중심 아키텍처·리니지·메타데이터 가시성으로 분석 엔지니어링 팀에서 채택 증가 (medium.com/@hugolu87)
- Dagster가 2026년 5월 소규모 계정 가격 정책을 크게 변경 — 도입 검토 시 비용 재계산 필요 (getorchestra.io)
- 오케스트레이터 선택 기준이 "태스크 실행"에서 "자산 리니지+메타데이터+AI 연동"으로 이동 중 (datastackx.com)

## 스트리밍·실시간

- 2026년 6대 트렌드: 벤더 통합, 디스크리스 Kafka, Iceberg 연동 스토리지, 스트림 내 실시간 분석, 무손실(RPO=0)·리전 컴플라이언스, 운영형 AI 컨텍스트 공급 (kai-waehner.de)
- Fortune 100의 80% 이상이 Kafka를 프로덕션 운영 — 스트리밍은 이미 기본 인프라 (kai-waehner.de)
- 실시간 분석이 별도 서빙 레이어가 아니라 스트림 안으로 이동 — Flink가 금융·커머스·IoT 실시간 파이프라인의 백본 (ksolves.com)
- 디스크리스 Kafka·스트리밍 네이티브 스토리지·AI 오케스트레이션 레이어가 신규 카테고리로 성장 (kai-waehner.de)
- 스트리밍의 핵심 신규 용도는 에이전트/모델에 실시간 컨텍스트를 공급하는 운영형 AI (kai-waehner.de)

## 실험·A/B 테스트

- 2026년 실험 플랫폼 필수 요건: always-valid p-value 순차검정, CUPED 분산감소, SRM 감지, 베이지안 옵션, 멀티암드 밴딧 (growthbook.io)
- CUPED는 노이즈 큰 지표에서 표본 크기를 최대 50% 절감하지만, 재방문 사용자 기반(SaaS·스트리밍)에서만 유효 — 이커머스에서는 오히려 왜곡 가능 (abtasty.com)
- 워하우스 네이티브 실험(Eppo·Statsig 등: Snowflake/BigQuery/Databricks에서 제자리 분석)이 플랫폼 아키텍처의 주류 (growthbook.io)
- 순차검정이 LaunchDarkly 등 주요 플랫폼 전반에 채택되며 "지켜보다 조기 종료" 관행의 통계적 위험을 해소 (listenlabs.ai)
- 강건 순차 실험설계 등 학계 연구도 활발 — 실험 방법론이 계속 진화 중 (arxiv.org)

## 데이터 품질·옵저버빌리티

- 품질 관리의 출발점이 생산자-소비자 간 데이터 컨트랙트로 이동 — dbt 테스트·Great Expectations·OpenLineage와 병행 운영 (montecarlodata.com)
- AI 에이전트 자율성이 커지면서 작은 데이터 이상도 큰 사고로 이어져, 조기경보형 옵저버빌리티가 필수 인프라화 (montecarlo.ai)
- 옵저버빌리티 5대 축(신선도·스키마·볼륨·분포·리니지)을 ML이 학습해 사전 감지하는 방식이 표준 (montecarlo.ai)
- 수동 테스트는 1차 방어선으로 유지하되, ML 기반 자동 옵저버빌리티 + 인시던트 관리 프로세스가 대규모 팀의 미래로 평가 (montecarlodata.com)
- Monte Carlo가 연례 데이터 품질 실태조사(2026)를 발간 — 팀 벤치마크 자료로 활용 가치 (montecarlodata.com)

## AI 분석 에이전트·BI

- AI 데이터 분석이 "질문→SQL 1개" 챗봇을 넘어 KPI 모니터링→이상 감지→차원 분해→내러티브 보고까지 수행하는 다단계 에이전트로 진화 (tellius.com)
- Snowflake Cortex Analyst는 시맨틱 모델 결합으로 실사용 SQL 정확도 90%+ 달성 — 시맨틱 레이어 없는 text-to-SQL은 도태 중 (promethium.ai)
- Databricks는 Genie Spaces를 Genie Agents로 재편, 상태 유지 대화 API와 CI/CD용 관리 API 공개 (tellius.com)
- Power BI Copilot·Looker Gemini·ThoughtSpot NL 검색 등 자연어 BI가 전 플랫폼 기본 기능화 — Power BI가 북미 점유율 30%+로 지배적 (mopinion.com)
- Tableau Pulse처럼 지표를 상시 모니터링해 개인화 인사이트를 선제 푸시하는 프로액티브 BI가 새 UX 축 (technovapartners.com)
- 헤드리스 시맨틱 레이어(Cube 등)로 지표 정의를 BI 도구에서 분리해 앱·API·AI 에이전트에 공급하는 패턴 확산 (getbruin.com)

Sources: [datalakehousehub.com](https://datalakehousehub.com/blog/2025-09-2026-guide-to-data-lakehouses/) · [olake.io](https://olake.io/blog/apache-iceberg-features-benefits/) · [cloud.google.com](https://cloud.google.com/blog/products/data-analytics/committing-to-apache-iceberg-with-our-ecosystem-partners) · [docs.getdbt.com](https://docs.getdbt.com/blog/modernizing-the-semantic-layer-spec) · [omni.co](https://omni.co/articles/best-semantic-layer-for-ai-and-bi-2026) · [kaelio.com](https://www.kaelio.com/blog/best-semantic-layer-solutions-for-data-teams-2026-guide) · [motherduck.com](https://motherduck.com/duckdb-news/) · [siliconangle.com](https://siliconangle.com/2026/06/10/exclusive-motherduck-adds-agentic-data-ingestion-cloud-analytics-service/) · [hpcwire.com](https://www.hpcwire.com/bigdatawire/this-just-in/motherduck-unveils-beta-pg_duckdb-extension-bringing-duckdb-analytics-directly-to-postgresql/) · [astronomer.io](https://www.astronomer.io/airflow/astro-vs-dagster/) · [getorchestra.io](https://www.getorchestra.io/blog/airflow-vs-dagster-which-one-should-you-choose-in-2026) · [kai-waehner.de](https://www.kai-waehner.de/blog/2025/12/10/top-trends-for-data-streaming-with-apache-kafka-and-flink-in-2026/) · [growthbook.io](https://www.growthbook.io/blog/best-a-b-testing-platforms) · [abtasty.com](https://www.abtasty.com/blog/best-statistical-model-for-ab-testing/) · [arxiv.org](https://arxiv.org/pdf/2605.12899) · [montecarlodata.com](https://www.montecarlodata.com/blog-data-quality-survey) · [montecarlo.ai](https://montecarlo.ai/blog-data-management-trends) · [tellius.com](https://www.tellius.com/resources/blog/best-ai-data-analysis-agents-in-2026-12-platforms-compared-for-nl-to-sql-autonomous-investigation-and-governance) · [promethium.ai](https://promethium.ai/guides/text-to-sql-comparison-2026-enterprise-solutions/) · [futurumgroup.com](https://futurumgroup.com/insights/databricks-data-ai-summit-looking-beyond-the-database-through-unified-transactions-analytics-and-agentic-ai/) · [flexera.com](https://www.flexera.com/blog/perspectives/snowflake-summit-2026/) · [daanalytics.substack.com](https://daanalytics.substack.com/p/snowflake-summit-2026) · [atlan.com](https://atlan.com/know/ai-agent/databricks/databricks-data-ai-summit-2026-announcements/) · [getbruin.com](https://getbruin.com/blog/semantic-layer-tools/) · [mopinion.com](https://mopinion.com/business-intelligence-bi-tools-overview/)
