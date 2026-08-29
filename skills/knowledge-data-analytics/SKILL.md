---
name: knowledge-data-analytics
description: 데이터 분석·엔지니어링 최신 지식 — 지표, 파이프라인, 실험. 데이터 역할이 작업 전 참고 (갱신: 2026-08-29)
---

# data-analytics 도메인 지식 (2026-08-29)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 데이터 플랫폼·레이크하우스
- Apache Iceberg가 오픈 테이블 포맷 표준으로 사실상 확정되며, 주요 클라우드·플랫폼이 Iceberg 기반 레이크하우스로 수렴하는 중 (datalakehousehub.com)
- 스노우플레이크 서밋 2026: 에이전트 표면 CoWork/CoCo, Horizon Context·Cortex Sense 시맨틱 계층, Iceberg v3 지원, AWS와 5년 60억 달러 인프라 계약 발표 (atlan.com, flexera.com)
- 데이터브릭스 서밋 2026: OLTP+OLAP를 단일 데이터 사본으로 통합하는 LTAP 아키텍처, 실시간 엔진 Lakehouse//RT, Kafka 없이 Delta로 직행 수집하는 Zerobus 공개 (futurumgroup.com, flexera.com)
- 대화형 분석 에이전트 Genie One(+Genie Code 등 특화 변형)으로 데이터브릭스도 '에이전트가 곧 분석 UI' 방향으로 이동 (atlan.com)
- 포인트 솔루션 조합 대신 Databricks·Snowflake·Microsoft 중심의 플랫폼 통합(consolidation)이 지배적 흐름 (n-ix.com)
- 테이블·이미지·텍스트·벡터를 한 플랫폼에서 다루는 멀티모달 데이터 지원이 확산 — LanceDB 등 임베딩 병행 저장 포맷 부상 (n-ix.com)
- 경량 스택도 유효: DuckDB/MotherDuck·DuckLake·Polars가 소규모 분석 워크로드에서 클러스터 없는 대안으로 자리잡음 (motherduck.com, uvik.net)

## 분석 엔지니어링·오케스트레이션
- Rust 기반 dbt Fusion 엔진이 네이티브 SQL 이해(정적 분석·즉시 오류 검출)로 개발 루프를 바꾸는 중 — Coalesce 2025 데모 이후 사실상 차세대 표준 (docs.getdbt.com, datalakehousehub.com)
- dbt 시맨틱 레이어 스펙이 개편되어 dbt Core 1.12에 반영 예정 — 메트릭 정의·관리가 간소화됨 (docs.getdbt.com)
- 시맨틱 레이어 도구 지형: dbt SL, Cube, Looker, Power BI 시맨틱 모델, Tableau Semantics, AtScale, Lightdash 등이 AI/BI 공용 지표 정의 계층으로 경쟁 (getbruin.com, omni.co)
- 2026 기본 스택: Snowflake/Databricks(저장) + dbt(변환) + Airflow(오케스트레이션) + Fivetran/Airbyte/dlt(수집) + Great Expectations/Monte Carlo(품질) 조합이 디폴트 (uvik.net)
- Airflow 3 세대가 오케스트레이션 표준 유지 — Airflow Summit 2026(8/31~9/2, 오스틴)에서 차기 로드맵 공개 예정 (airflow.apache.org)
- 오픈소스 신흥 도구로 Kestra(오케스트레이션), RisingWave·Bytewax(스트리밍), Apache Paimon(테이블 포맷) 주목 (uvik.net)

## AI 데이터 분석 에이전트·Text-to-SQL
- 시맨틱 레이어 그라운딩이 정확도를 결정: 스키마만 주면 84~90%인 SQL 정확도가 시맨틱 레이어 결합 시 98~100%까지 상승 (tellius.com)
- Databricks Genie·Snowflake Cortex Analyst가 각 플랫폼 내 NL-to-SQL 선두, Power BI Copilot·Tellius가 엔터프라이즈 분석용 상위권 (tellius.com)
- 코파일럿을 넘어 KPI 모니터링→이상 감지→차원별 통계 분해까지 자율 수행하는 '분석 에이전트'가 신규 카테고리로 정착 (noimosai.com)
- 최대 리스크는 '오류 없이 실행되지만 답이 틀린 쿼리' — 에이전트 오답 시 대응 방식을 설명 못 하는 벤더는 프로덕션 DB에 연결하지 말 것 (promethium.ai)
- 메트릭 드리프트 방지를 위해 컨텍스트 레이어(카탈로그+시맨틱+거버넌스)를 AI 앞단에 두는 아키텍처가 권장 패턴 (atlan.com)
- 잘 설계된 MetricFlow 메트릭 정의가 대시보드와 AI 에이전트 질의의 공용 단일 정의로 쓰이는 흐름 (thedataprism.com)

## 실험·A/B 테스트
- 플랫폼 지형: Statsig·GrowthBook·Amplitude·Optimizely·LaunchDarkly·Eppo 계열이 기능 플래그+실험 통합형으로 주류 (growthbook.io, amplitude.com)
- CUPED(사전 실험 데이터 기반 분산 감소)가 업계 표준 기법으로 정착 — 더 작은 표본으로 유의성 도달, 실험 기간 단축 (statsig.com, optimizely.com)
- CUPED+순차검정(sequential testing) 결합으로 조기 중단 규칙을 안전하게 적용하는 설계가 확산 (abtasty.com)
- 2026 신규 연구: 사전+실험 중 데이터를 결합한 분산 감소, CUPED의 방법론적 함정(공변량 예측력 의존 등)을 다루는 논문 다수 (arxiv.org)
- 베스트프랙티스는 화려한 AI 기능보다 가설·주요 지표·기간 사전 등록, 모든 검정 결과 투명 보고, 테스트 소유권 명시 (convert.com, otterab.com)
- 실험 플랫폼 선택 기준은 트래픽 규모·기술 리소스·실험 성숙도 매칭 — 도구보다 프로그램 운영 체계가 성패 좌우 (kameleoon.com)

## 스트리밍·실시간 분석
- 2026 6대 트렌드: 생태계 통합, 디스크리스 Kafka+Iceberg 스토리지 융합, 스트리밍 레이어 내 실시간 분석 내장, 무손실 SLA 요구, 주권 규제발 리전 배포, 에이전틱 AI에 실시간 컨텍스트 공급 (kai-waehner.de)
- Kafka(프로토콜 표준)+Flink(상태 기반 스트림 처리 표준) 조합이 이벤트 기반 시스템의 백본으로 굳어짐 (kai-waehner.de)
- 실시간 분석 시장은 2026년 약 277억 달러 규모(CAGR 20.4%)로 성장 전망 (gtracademy.org)
- 스트리밍이 사기 탐지·개인화·공급망 최적화를 넘어 AI 에이전트의 실시간 추론 컨텍스트 공급원으로 확장 (kai-waehner.de)
- 데이터브릭스 Zerobus처럼 메시지 버스를 생략하는 서버리스 푸시 수집 API가 스트리밍 인프라 단순화 트렌드를 보여줌 (futurumgroup.com)

## 데이터 품질·옵저버빌리티·데이터 계약
- 데이터 옵저버빌리티가 '있으면 좋은 것'에서 필수 인프라로 전환 — 인접 데이터 도구 카테고리보다 빠른 채택 속도 (revefi.com, dqlabs.ai)
- AI 에이전트가 소비·생산하는 데이터를 실시간 모니터링하는 '에이전트 옵저버빌리티'가 신규 영역으로 부상 (dqlabs.ai)
- 데이터 계약(스키마·신선도·품질 SLA)이 형식화되고, Snowflake·BigQuery·Databricks가 계약 프리미티브를 플랫폼에 내장하기 시작 (datakitchen.io)
- 옵저버빌리티가 데이터 계약의 '집행 계층' 역할로 진화 — 생산자·소비자 간 기대치를 자동 검증 (graycellamerica.com)
- 데이터 품질 문제로 조직당 연평균 1,290만 달러 손실 — AI 이니셔티브 실패의 최상위 원인으로 지목 (sombrainc.com)
- 품질·컴퓨트 비용을 함께 추적하는 비용 인지형(cost-aware) 옵저버빌리티가 플랫폼 차별화 포인트 (dqlabs.ai)

## 지표 체계·프로덕트 분석
- 노스스타 지표를 조작 가능한 입력 지표로 분해하는 '메트릭 트리'가 2026 BI의 핵심 프레임 — 시맨틱 레이어와 결합해 도구 간 지표 일관성 확보 (mixpanel.com, medium.com)
- 정적 대시보드보다 대화형 AI 애널리스트가 일상 의사결정에 더 유용하다는 재편이 진행 중 (koji.so)
- 좋은 NSM 기준: 매출의 선행지표, 고객 행동 기반, 평이한 언어 — 분기별 재검토 권장 (productschool.com, koji.so)
- 노스스타 맵 vs 대수적 KPI 트리 선택 기준이 정리되는 등 지표 설계 방법론이 성숙 단계 진입 (mixpanel.com)

## 데이터 비용 최적화(FinOps)
- 클라우드 데이터 지출이 기업 P&L에서 가장 빠르게 늘어나는 항목 — 대기업 76%가 월 500만 달러 이상 지출, 25%는 낭비 추정 (finops.org, polestaranalytics.com)
- FinOps 범위가 클라우드를 넘어 AI·SaaS·라이선스·데이터 플랫폼 전반의 가치 측정 체계로 확장 (finops.org)
- 효율적 FinOps로 클라우드 지출 20~30% 절감 가능(McKinsey) — 스토리지/컴퓨트 분리와 네트워크·데이터 이동 비용이 핵심 관리 대상 (polestaranalytics.com)
- Iceberg 테이블 유지관리(컴팩션·스냅샷 정리)가 레이크하우스 비용 절감의 새 실무 영역으로 부상 (lakeops.dev)
- 비용 인식을 사후 정산이 아닌 엔지니어링 설계 단계에 내재화하는 것이 2026 권장 접근 (newswireonline.com)
