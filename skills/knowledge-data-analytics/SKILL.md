---
name: knowledge-data-analytics
description: 데이터 분석·엔지니어링 최신 지식 — 지표, 파이프라인, 실험. 데이터 역할이 작업 전 참고 (갱신: 2026-08-08)
---

# data-analytics 도메인 지식 (2026-08-08)

> 역할별 에이전트 KNOWLEDGE 블록을 도메인 단위로 통합한 지식 베이스.
> `agent-team learn --domains` 가 이 파일을 통째로 갱신한다.

## bigdata-engineer
- **Kafka의 '디스크리스(diskless)' 아키텍처 전환** — 오브젝트 스토리지 직결(KIP-1150 계열)로 브로커 디스크·복제 비용을 없애고 Iceberg와 통합해 실시간·과거 데이터를 단일 스토리지로 통합하는 흐름이 2026년 핵심 트렌드 (kai-waehner.de)
- **Flink 2.2~2.3의 AI 네이티브 스트리밍** — SQL에서 `ML_PREDICT`(LLM 추론)·`VECTOR_SEARCH`(실시간 벡터 검색), Materialized Table, 분리형(disaggregated) 상태 백엔드, Delta Join으로 스트리밍+AI 파이프라인을 SQL만으로 구성 가능 (flink.apache.org)
- **Apache Iceberg가 레이크하우스 표준 테이블 포맷으로 사실상 확정** — Kafka→Iceberg 직접 머티리얼라이즈(Confluent Tableflow 등)로 별도 ETL 없이 스트림을 분석 테이블화하는 패턴이 보편화 (infoworld.com, confluent.io)
- **틱/시계열 저장은 개방 포맷 중심 재편** — QuestDB·InfluxDB 3 등이 콜드 데이터를 Parquet로 오브젝트 스토리지에 계층화하고 Arrow(ADBC)로 제로카피 조회, kdb+ 대체 흐름 가속 (questdb.com)
- **엔터프라이즈 요구는 RPO=0·주권 클라우드** — 무손실 복제와 자동화된 DR, 데이터 주권 규제 대응용 리전별 Kafka 배포가 플랫폼 선택 기준으로 부상 (kai-waehner.de)
- **스트리밍이 AI 에이전트의 '컨텍스트 엔진'으로** — 실시간 피처/임베딩 공급 파이프라인(Kafka+Flink+벡터 검색)이 피처 스토어의 차세대 형태로 자리잡는 중 (risingwave.com, confluent.io)

Sources: [Top Trends for Data Streaming 2026 (Kai Waehner)](https://www.kai-waehner.de/blog/2025/12/10/top-trends-for-data-streaming-with-apache-kafka-and-flink-in-2026/), [Data Streaming Landscape 2026](https://www.kai-waehner.de/blog/2025/12/05/the-data-streaming-landscape-2026/), [Flink 2.2.0 Release](https://flink.apache.org/2025/12/04/apache-flink-2.2.0-advancing-real-time-data--ai-and-empowering-stream-processing-for-the-ai-era/), [3 Data Engineering Trends riding Kafka, Flink, Iceberg (InfoWorld)](https://www.infoworld.com/article/3607370/3-data-engineering-trends-riding-kafka-flink-and-iceberg.html), [Best Time-Series Databases 2026 (QuestDB)](https://questdb.com/blog/best-time-series-databases/), [Confluent Cloud Q2 2026](https://www.confluent.io/blog/2026-q2-confluent-cloud-launch/)

## data-analyst
- 세만틱 레이어가 AI 에이전트 BI의 필수 인프라로 부상 — AI 분석 실패 대부분이 환각이 아닌 "잘못된 테이블·조인·집계" 같은 시맨틱 오류라서, 거버넌스된 지표 정의 계층을 먼저 세우는 것이 2026년 표준 (cube.dev, atlan.com, strategy.com)
- dbt Core v2.0 알파(Rust 기반 고속 런타임)와 내장 SQL 린터 dbt lint 베타 출시 — dbt+DuckDB 조합으로 로컬 개발 후 Snowflake/BigQuery 배포하는 재현 가능한 파이프라인 패턴이 확산 (docs.getdbt.com, medium.com)
- 2026 State of Analytics Engineering: 데이터 "신뢰" 중시 응답 66%→83%, "속도" 50%→71%로 급등 — 지표 정합성 검증과 데이터 품질 테스트가 분석팀 최우선 과제 (getdbt.com)
- 실험 플랫폼은 웹·기능 플래그·개인화·AI 프롬프트 실험을 단일 플랫폼에서 통합 운영하는 방향으로 진화 — Statsig, GrowthBook, Amplitude, LaunchDarkly 중심의 "실험 주도 개발(experimentation-driven development)"이 제품팀 전반의 표준으로 (growthbook.io, convert.com, amplitude.com)
- 프로덕트 분석은 warehouse-native(Mitzu, Kubit, Netspring 등)로 이동 — 이벤트 데이터를 웨어하우스 밖으로 복제하지 않고 SQL 투명성을 유지해야 AI 분석 에이전트 연동도 안정적 (mitzu.io)
- AI 에이전트가 "인사이트의 첫 접점"이 되는 Agentic BI 확산 — ThoughtSpot Spotter, Sigma 등 자연어 질의·자동 이상탐지·내러티브 설명 기능이 대시보드를 보완하며, 에이전트가 호출할 수 있는 지표 API 노출 여부가 툴 선택 기준으로 부상 (mitzu.io, kyvosinsights.com)

Sources: [Cube — Semantic Layer for AI Agents 2026](https://cube.dev/articles/semantic-layer-for-ai-agents-2026), [Atlan — Semantic Layer for AI Agents Guide](https://atlan.com/know/ai-agent/semantic-layer-for-ai-agents/), [dbt Labs — State of Analytics Engineering 2026](https://www.getdbt.com/resources/state-of-analytics-engineering-2026), [dbt release notes](https://docs.getdbt.com/docs/dbt-versions/release-notes), [GrowthBook — Best A/B Testing Platforms 2026](https://www.growthbook.io/blog/best-a-b-testing-platforms), [Convert — How to Run A/B Tests in 2026](https://www.convert.com/blog/a-b-testing/how-to-run-ab-tests-guide-for-experimenters/), [Mitzu — Best Warehouse-Native Analytics Tools 2026](https://mitzu.io/post/best-warehouse-native-analytics-tools-in-2026/), [Mitzu — Best AI Data Analyst Tools 2026](https://mitzu.io/post/best-ai-data-analyst-tools-for-product-teams-2026/)

## data-engineer
- **dbt Core v2.0 + Fusion 엔진 오픈소스화, Fivetran-dbt 합병 완료(2026.6)** — Rust 기반 Fusion이 Snowflake/BigQuery/Databricks Preview, DuckDB Beta 지원으로 로컬·CI에서 웨어하우스 비용 없이 dbt 실행 가능 (getdbt.com, kestra.io)
- **Apache Iceberg가 레이크하우스 테이블 포맷 사실상 표준으로 정착** — 주요 클라우드·플랫폼이 Iceberg 중심으로 수렴, dbt v2.0도 Iceberg 카탈로그 스펙 간소화 지원 (datalakehousehub.com, getdbt.com)
- **실시간 파이프라인이 기본값화** — 신규 파이프라인의 약 60%가 실시간/준실시간 요건 포함, Debezium·Flink 기반 CDC→Iceberg/Delta 직접 커밋 패턴이 표준 아키텍처로 부상 (dataverses.io, inveritasoft.com)
- **데이터 옵저버빌리티가 데이터 컨트랙트의 강제(enforcement) 계층으로 진화** — 스키마·신선도·품질 SLA를 계약화하고, 자율 에이전트가 이상 감지·원인 설명·해결까지 수행하는 방향(예: Actian Data Observability Agents) (siffletdata.com, atlan.com, dqlabs.ai)
- **AI 에이전트용 데이터 품질이 2026년 최우선 과제** — AI 도입 기업 51%가 부정적 결과 경험, 원인 1/3이 AI 부정확성(McKinsey 인용); 카탈로그·품질·옵저버빌리티를 단일 플랫폼으로 통합하고 MCP/API로 메타데이터를 에이전트에 노출하는 흐름 (sombrainc.com, atlan.com)
- **실험(A/B) 설계에서 쿠키리스 트래킹과 지표 소스 오브 트루스 정합성이 핵심 체크포인트** — 분석툴·실험플랫폼·CRM 간 이벤트 집계 불일치 사전 검증, 평균 회귀 오판 방지, 홀드아웃 기반 딥 텔레메트리 분석이 베스트프랙티스로 강조 (convert.com)

Sources: [getdbt.com](https://www.getdbt.com/blog/what-s-shipped-in-dbt-may-2026), [kestra.io](https://kestra.io/resources/data/fivetran-dbt-merger-fusion-engine), [datalakehousehub.com](https://datalakehousehub.com/blog/2025-09-2026-guide-to-data-lakehouses/), [dataverses.io](https://dataverses.io/resources/blog/data-engineering-trend-2026), [siffletdata.com](https://www.siffletdata.com/blog/7-data-ai-predictions-for-2026), [atlan.com](https://atlan.com/know/ai-agent/data-for-ai/data-contracts-for-ai/), [sombrainc.com](https://sombrainc.com/blog/ai-data-quality), [convert.com](https://www.convert.com/blog/a-b-testing/how-to-run-ab-tests-guide-for-experimenters/)
