---
name: knowledge-data-analytics
description: 데이터 분석·엔지니어링 최신 지식 — 지표, 파이프라인, 실험. 데이터 역할이 작업 전 참고 (갱신: 2026-09-10)
---

# data-analytics 도메인 지식 (2026-09-10)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 레이크하우스·테이블 포맷
- Iceberg v3(deletion vector·row lineage·VARIANT 타입)가 2026 상반기 GA, Snowflake·Databricks 모두 지원 시작 (atlan.com, databricks.com)
- Apache Polaris가 2026-02 톱레벨 프로젝트 승격, REST 카탈로그(Polaris·Unity·Nessie)가 레이크하우스 통제 계층으로 자리잡음 (amdatalakehouse.substack.com, cloudrps.com)
- Gartner가 레이크하우스를 "transformational"로 격상, 다만 실제 도입률은 27%·웨어하우스 44%로 하이브리드가 다수 (n-ix.com)
- Databricks가 OLTP+OLAP 단일 사본 아키텍처 LTAP와 100ms 미만 실시간 분석 Lakehouse RT(Reyden 엔진) 발표 (atlan.com, futurumgroup.com)
- Snowflake Summit 2026: Iceberg v3·Datastream·Openflow·Adaptive Compute 등 26개+ 신기능 (atlan.com, constellationr.com)
- 테이블 포맷 경쟁에 DuckLake·Paimon이 추가되어 Iceberg/Delta/Hudi 외 선택지 확대 (amdatalakehouse.substack.com)
- 멀티모달 레이크하우스(테이블·이미지·텍스트·벡터 통합)와 플랫폼 내장 거버넌스(Unity·Horizon·Glue)가 표준화 추세 (inveritasoft.com)

## 변환·모델링(dbt)·시맨틱 레이어
- dbt Fusion 엔진이 릴리스 트랙(Nightly/Stable/Extended/Fallback)으로 운영되며 신규 프로젝트는 Fusion Stable 기본 (docs.getdbt.com)
- 시맨틱 레이어 스펙 개편: semantic model을 model YAML에 내장, measure→simple metric 통합, Core 1.12 예정·Fusion 선반영 (docs.getdbt.com)
- 모델 단위 쿼리 히스토리가 Snowflake·BigQuery에 이어 Databricks·Redshift 지원 (getdbt.com)
- Snowflake Horizon Context·Cortex Sense, Databricks Genie 온톨로지 등 벤더별 "컨텍스트/시맨틱 레이어"가 AI 에이전트 정확도의 핵심으로 부상 (atlan.com, pointfive.co)
- 거버넌스된 메타데이터 컨텍스트 레이어가 text-to-SQL 환각률을 40% 이상 감소시킨다는 주장, 시맨틱 레이어 없는 LLM 쿼리는 지양 (cube.dev)
- DuckDB·Polars·Iceberg·dbt 조합이 소규모 팀의 "모던 분석 스택"으로 정착 (medium.com, datalakehousehub.com)

## 인프로세스 분석 엔진
- DuckDB 1.5.4(2026-06), Polars 1.42.1(2026-06) 출시, Arrow 제로카피로 상호 연동 (opensourceforu.com, pyinns.com)
- DuckDB 1.4 LTS부터 Iceberg 쓰기 지원, Polars 스트리밍 엔진도 Iceberg sink 추가 (iceberglakehouse.com)
- Polars 2.0 로드맵: morsel 기반 병렬 + Rust async 스트리밍 엔진 전면 재설계 (danilchenko.dev)
- 단일 노드 수십 GB 규모는 Spark 대신 DuckDB/Polars가 기본 선택지로 권장되는 흐름 (analyticsvidhya.com)
- DuckDB 커뮤니티 익스텐션(spatial·graph 등) 생태계 확대 (opensourceforu.com)

## 오케스트레이션·파이프라인
- Prefect가 2026-07-13 Dagster Labs 인수 발표, 양 제품은 독립 브랜드·라이선스 유지 (datalakehousehub.com)
- Airflow 3.2(2026-04): 에셋 파티셔닝·멀티팀 배포 추가로 Dagster와의 에셋 기반 차이 축소 (datalakehousehub.com, astronomer.io)
- Airflow 3의 에셋 기반 데이터 인지 스케줄링이 기본이 되어 "태스크 vs 에셋" 구분은 사실상 희석 (modern-datatools.com)
- Uber IngestionNext(Kafka+Flink+Hudi)로 지연 시간→분 단위·컴퓨트 25% 절감, Pinterest CDC 프레임워크로 24h→15분 (kai-waehner.de)
- 이벤트 드리븐·스트리밍 퍼스트 인제스천이 배치 스케줄러 대체 옵션으로 부상 (datalakehousehub.com)
- 파이프라인 비용(FinOps) 추적을 관측성 플랫폼에 통합하는 흐름 (revefi.com)

## 스트리밍
- Kafka 4.x(4.0~4.2, 4.2는 2026-02): ZooKeeper 완전 제거·KRaft 단일화, Queues(KIP-932 share group) 도입 (kafka.apache.org, softwaremill.com)
- Flink 2.3.0(2026-06-25): SQL changelog 연산자, materialized table 강화, Hadoop 없는 네이티브 S3 파일시스템(실험) (flink.apache.org)
- Flink Agents 0.3 출시로 스트리밍 위 에이전트 실행 프레임워크 형성 (flink.apache.org)
- 디스크리스 Kafka(AutoMQ 등 S3 기반)·스트리밍 네이티브 스토리지가 신규 카테고리로 성장 (kai-waehner.de)
- Kafka Streams는 경량 임베디드, Flink는 복잡 상태·SQL 처리로 역할 분담이 정리됨 (conduktor.io)

## 데이터 품질·관측성·계약
- 데이터 관측성 시장 2026년 35.1억 달러 전망, 53% 조직 도입·31% 12개월 내 계획 (revefi.com, dqlabs.ai)
- 데이터 컨트랙트가 Snowflake·BigQuery·Databricks 플랫폼 기능으로 내장되고 관측성이 계약 집행 계층 역할 (datakitchen.io, revefi.com)
- AI 에이전트가 소비·생산하는 데이터의 실시간 품질 모니터링이 새로운 관측 대상 (digna.ai)
- 신선도·볼륨·스키마 반응형 모니터링에서 AI 기반 선제적 이상 탐지·자동 복구로 이동 (graycellamerica.com)
- 관측성 플랫폼에 컴퓨트 비용 추적을 결합해 "데이터 경제성"까지 관리 (revefi.com)

## 실험·A/B 테스트
- 2026 실험 플랫폼 필수 요건: always-valid p-value 순차 검정, CUPED, SRM 탐지, 베이지안 옵션, 밴딧 (growthbook.io, adasight.com)
- CUPED는 재방문 사용자 비중이 높은 서비스(스트리밍·SaaS)에서 유효, 저재방문 이커머스에선 오히려 왜곡 가능 (abtasty.com)
- 순차 검정은 실험 시작 전에 활성화해야 하며 사후 적용은 무효 (adasight.com)
- Eppo·Statsig 등 웨어하우스 네이티브(Snowflake/BigQuery/Databricks 내 분석) 플랫폼이 주류 (growthbook.io)
- 순차 실험 설계의 강건성(robust sequential design) 연구 활발 (arxiv.org 2605.12899)

## 지표·제품 분석
- 노스스타 1개 + 입력 지표 3~4개 + 가드레일(이탈·지원부하·지연·마진) 구조가 표준 권고 (aakashg.com, siftfeed.com)
- AI 기능 지표는 AI 사용량이 아닌 사용자 산출물(예: 실제 배포된 코드) 기준으로 설계 (ericdataproduct.substack.com, institutepm.com)
- 모델 지표·사용자 지표·비즈니스 지표 3계층으로 분리 관리 (leanpivot.ai)
- "의사결정 속도(Decision Velocity)"가 2026 신흥 조직 지표로 언급 (plane.so)

## BI·에이전틱 분석
- Looker BI Agents·Dashboard Agents(2026-04~), Tableau Next(자동 시맨틱 모델·MCP 지원), Power BI Copilot 등 주요 BI가 에이전트화 (cube.dev, omni.co)
- Snowflake CoWork/CoCo(구 Snowflake Intelligence·Cortex Code) GA, Databricks Genie One·Agent Bricks로 플랫폼 내 분석 에이전트 경쟁 (atlan.com)
- Snowflake AI Agent Identity GA: 에이전트별 암호학적 신원·RBAC·감사로그 필수화 (atlan.com)
- "AI 네이티브 BI vs 기존 BI+어시스턴트" 구분이 선정 기준으로 등장, 후자는 구 쿼리 모델 한계 승계 (holistics.io, omni.co)
- 범용 text-to-SQL은 비즈니스 맥락 부재로 그럴듯하지만 틀린 결과 위험, 시맨틱 레이어 검증이 선행 조건 (cube.dev)
- MCP를 통한 BI↔외부 AI 도구 상호운용이 표준 인터페이스로 확산 (omni.co)
