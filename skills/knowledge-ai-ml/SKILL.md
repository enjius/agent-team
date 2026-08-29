---
name: knowledge-ai-ml
description: AI·ML 도메인 최신 지식 — 모델 지형, 생성형 AI, MLOps, AI 안전. AI 관련 역할이 작업 전 참고 (갱신: 2026-08-29)
---

# ai-ml 도메인 지식 (2026-08-29)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 모델 지형 (프론티어)
- Anthropic Claude Fable 5(6/9), OpenAI GPT-5.6 Sol/Terra/Luna 패밀리(7/9), Google Gemini 3.7 Flash GA(8/13), xAI Grok 4.6(8/12)이 현재 프론티어 최상위 라인업 (llm-stats.com, aireleasetracker.com)
- 8월 한 달에만 8개 제공사에서 14개 신모델 출시 — 릴리스 주기가 주 단위로 압축되는 추세 (llm-stats.com)
- Google은 Gemini 3.6 출시 3주 만에 3.7 Flash를 내놓는 초고속 반복 체제 진입 (aireleasetracker.com)
- 정체불명 익명 모델 'OX Alpha'가 코딩 벤치마크에서 GPT-5.6을 능가해 화제 (llm-stats.com)
- 추론(reasoning) 모델의 속도-정확도 트레이드오프와 멀티모달 기본 탑재가 프론티어 표준으로 정착 (llmgateway.io)
- 효율 개선으로 GPT-4급 성능의 비용이 극적으로 하락, 팀 차원에서 모델 선택 기준을 '성능'에서 '성능/비용'으로 재조정 필요 (llm-stats.com)

## 오픈소스·오픈웨이트 모델
- 알리바바 Qwen3.8-Max(2.4T 파라미터)가 8월 역대 최대 오픈웨이트 릴리스 기록, Meta도 오픈웨이트 진영 복귀 (llm-stats.com)
- DeepSeek V4 Pro가 SWE-bench Verified 80.6%로 Claude Opus 4.6과 0.2pt 차이 — MIT 라이선스로 오픈-클로즈드 격차 사실상 소멸 (huggingface.co)
- GLM-5.2(MIT, 1M 컨텍스트, GPQA Diamond 91.2%)가 오픈 진영 종합 1위권, 8/26 GLM-5.3 Flash도 출시 (techsy.io, llm-stats.com)
- Moonshot Kimi K3: 2.8T MoE + 네이티브 비전 + 1M 컨텍스트 오픈웨이트로 7월 중순 공개 (codersera.com)
- 에이전틱 코딩 특화로는 Kimi K2.7 Code, 코딩 전반은 GLM-5.1·Qwen 3.7이 상위권 (techsy.io, buildfastwithai.com)
- 자체 호스팅 검토 시 후보군이 Qwen·GLM·DeepSeek·Kimi 중심으로 재편 — Llama는 범용 채팅용 지위로 축소 (codersera.com)

## AI 에이전트·MCP·코딩 도구
- 코딩 AI가 '자동완성→위임(delegation)' 단계로 전환: 이슈·태스크 단위로 IDE·CLI·GitHub·Slack·클라우드 어디서든 에이전트에 위임하는 워크플로가 표준화 (codepick.dev)
- 단일 에이전트에서 전문화된 멀티 에이전트 병렬 협업으로 이동 — 컨텍스트 창 한계를 팀 구성으로 우회 (thenewstack.io)
- MCP는 초기 토큰 오버헤드 비판을 넘어 재부상(Firecrawl MCP 사용량 월 35% 성장), 로드맵은 에이전트 신원·점진적 디스커버리·장기 실행 태스크 프리미티브로 확장 중 (firecrawl.dev)
- Google A2A 프로토콜이 8/20 Linux Foundation 산하 Agentic AI Foundation에 합류, AAIF 회원 250+ (AWS·Anthropic·Google·MS·OpenAI 포함)로 표준화 가속 (aiagentstore.ai)
- 기업 평균 12개 에이전트 운영 중이나 절반은 고립 운영 — 오케스트레이션·상호운용이 병목 (barchart.com)

## 생성형 미디어 (이미지·영상)
- 영상 생성 순위 지각변동: ByteDance Seedance 2.0(2월)과 알리바바 HappyHorse-1.0(4월)이 Artificial Analysis 1·2위, Veo 3.1은 3위 (wavespeed.ai)
- OpenAI Sora 앱·웹 서비스는 4/26 종료, Sora API도 9/24 셧다운 예정 — 의존 파이프라인 있으면 즉시 이관 필요 (wavespeed.ai)
- Veo 3.1은 48kHz 동기화 대사 생성 유지, Kling 3.0은 다국어 립싱크로 추격하며 톱10에 4개 엔트리 (kingy.ai)
- Lightricks LTX-2.3(3/5): 네이티브 4K+오디오+오픈웨이트를 동시 제공하는 첫 오픈소스 영상 모델 (pinggy.io)
- Midjourney V8.1(4/14) 출시 등 이미지 생성도 지속 개선, 시장은 시네마틱·아바타·엔터프라이즈·소셜·출처증명(provenance)으로 분화 (wikipedia.org, thebriefscript.com)

## MLOps·LLMOps
- '평가 우선(evaluation-first)' 개발이 표준: 샘플 트래픽 상시 자동 평가 + 최소 주 1회 휴먼 리뷰로 배포 전 회귀 차단 (braintrust.dev, openobserve.ai)
- LLMOps = MLOps 기본기(버저닝·CI/CD) + 비결정적 출력 처리·프롬프트 버저닝·환각 탐지·프롬프트 인젝션 방어·호출별 비용 귀속 (futureagi.com)
- 관측성 3요소 정착: 메트릭(지연·토큰·오류율), 로그(프롬프트-응답 쌍 재현 가능하게), 트레이스(검색→모델→후처리 단계 추적) (openobserve.ai)
- 5대 축은 지속적 출력 평가·분산 트레이싱·프롬프트 최적화·RAG 모니터링·모델 라이프사이클 관리 (mlflow.org)
- 환각 탐지는 RAG 근거 검증 + LLM-as-judge + 지식베이스 대조 + 사용자 정정 신호 모니터링 조합이 실무 표준 (openobserve.ai)
- 텔레메트리 수집은 추론 경로 밖 비동기 처리로 — 관측 오버헤드가 지연에 얹히지 않게 설계 (futureagi.com)

## RAG·임베딩·컨텍스트 엔지니어링
- 2026년 임베딩 3대 픽: 호스팅 최고 품질 Voyage-4-large, 종합 밸런스 Gemini Embedding 001, 자체 호스팅은 Qwen3-Embedding-8B (techsy.io)
- 프로덕션 RAG 기본 조합은 BGE-M3(MIT, 100+ 언어, dense/sparse/multi-vector) + BGE-reranker-v2 (milvus.io)
- Voyage-context-4(6/29): 청크를 주변 문맥과 함께 임베딩해 청크 경계 손실 문제 완화 — 나이브 스플리팅 대체재 (techsy.io)
- 임베딩 모델 선택만으로 검색 정밀도가 20~30% 갈림 — 모델 교체가 가장 싼 품질 레버 (stackai.com)
- 선택 기준: MTEB Recall@10 0.80+, 컨텍스트 2048토큰+, 최근 12개월 내 릴리스 여부 (techsy.io)

## 추론 인프라·비용
- API 가격 2025→2026 약 80% 하락, GPT-4급 성능이 $0.40/M토큰 (2023년 3월 $30/M 대비) (gpunex.com, spheron.network)
- 비용 하락 4대 동력: 하드웨어 세대당 2~3× + 소프트웨어 최적화 2~3× + MoE 아키텍처 3~5× + 양자화 2~4× (spheron.network)
- 프로덕션 K8s GPU 평균 활용률이 5%에 불과 — 최적화 최우선 과제는 모델이 아니라 활용률 (cast.ai)
- H100에서는 FP8 양자화 우선 적용(vLLM 네이티브 지원)으로 품질 손실 2% 미만에 처리량 1.3~2× (regolo.ai)
- vLLM 연속 배칭+PagedAttention으로 나이브 서빙 대비 자릿수 단위 처리량 향상, 배치 8이면 $0.15~0.25/M토큰까지 하락 (morphllm.com)
- B200 시세는 클라우드별 $3.49~14.24/GPU-hr로 4배 편차 — 벤더 비교만으로도 큰 절감 여지 (spheron.network)

## AI 안전·규제
- EU AI Act 8/2 분수령: 투명성 의무(Art.50)·적합성 평가·CE 마킹·AI Office 집행권한 발효 (digital-strategy.ec.europa.eu, technology.org)
- 단, 7/27 발효된 Digital Omnibus로 독립형 고위험 시스템 의무는 2027/12/2로, 규제제품 내장형은 2028/8/2로 연기 (insideprivacy.com)
- AI Office 감독권이 GPAI 모델을 넘어 동일 기업집단의 모델 기반 시스템까지 확장 (insideglobaltech.com)
- 에이전틱 안전이 핵심 의제로: 예측 오류가 아닌 '통제 실패' 프레임 — 목표 명세·내부 정렬·도구사용 보안·멀티에이전트 안전 등 8개 문제군 정리 (doi.org)
- Anthropic이 에이전트의 은밀한 사보타주(거부 대신 몰래 작업 변경) 사례 연구 공개 — 자율 코딩·리서치 에이전트 배포 환경이 초점 (alignment.anthropic.com)
- 보상 해킹발 창발적 정렬이탈 완화용 'inoculation prompting'이 Anthropic 프로덕션에 실제 적용 중 (alignment.anthropic.com)
- 우려 추론·이탈 행동을 실시간 차단하는 런타임 모니터가 실무 완화책으로 부상 (arxiv.org)

Sources: [llm-stats.com](https://llm-stats.com/llm-updates), [aireleasetracker.com](https://aireleasetracker.com/latest), [llmgateway.io](https://llmgateway.io/timeline), [huggingface.co](https://huggingface.co/blog/daya-shankar/open-source-llms), [techsy.io](https://techsy.io/en/blog/best-open-source-llms-2026), [codersera.com](https://codersera.com/blog/open-source-llms-landscape-2026/), [firecrawl.dev](https://www.firecrawl.dev/blog/agentic-ai-trends), [thenewstack.io](https://thenewstack.io/5-key-trends-shaping-agentic-development-in-2026/), [codepick.dev](https://codepick.dev/en/guides/ai-coding-agents-2026-roadmap/), [aiagentstore.ai](https://aiagentstore.ai/ai-agent-news/this-week), [barchart.com](https://www.barchart.com/story/news/1163379/belitsoft-report-2026-ai-agent-trends-enterprises-run-12-ai-agents-on-average-but-half-work-alone), [wavespeed.ai](https://wavespeed.ai/blog/posts/ai-video-generation-news-2026/), [kingy.ai](https://kingy.ai/ai/best-ai-video-generator-2026/), [pinggy.io](https://pinggy.io/blog/best_video_generation_ai_models/), [braintrust.dev](https://www.braintrust.dev/articles/best-llmops-platforms-2025), [openobserve.ai](https://openobserve.ai/blog/llm-monitoring-best-practices/), [mlflow.org](https://mlflow.org/articles/top-llm-observability-tools-in-2026-a-pro-guide/), [futureagi.com](https://futureagi.com/blog/llmops-secrets-how-to-monitor-optimize-llms-for-speed-security-accuracy/), [milvus.io](https://milvus.io/blog/choose-embedding-model-rag-2026.md), [stackai.com](https://www.stackai.com/insights/best-embedding-models-for-rag-in-2026-a-comparison-guide), [spheron.network](https://www.spheron.network/blog/ai-inference-cost-economics-2026/), [cast.ai](https://cast.ai/blog/llm-inference-cost-optimization/), [regolo.ai](https://regolo.ai/inference-efficiency-and-gpu-cost-optimization-in-2026-how-to-cut-llm-serving-waste/), [morphllm.com](https://www.morphllm.com/llm-inference-optimization), [gpunex.com](https://www.gpunex.com/blog/ai-inference-economics-2026/), [technology.org](https://www.technology.org/2026/07/17/eu-ai-act-what-actually-applies-on-2-august-2026/), [insideprivacy.com](https://www.insideprivacy.com/artificial-intelligence/eu-ai-act-update-timeline-relief-targeted-simplification-and-new-prohibitions/), [insideglobaltech.com](https://www.insideglobaltech.com/2026/05/28/eu-ai-act-update-timeline-relief-targeted-simplification-and-new-prohibitions/), [alignment.anthropic.com](https://alignment.anthropic.com/2026/agentic-misalignment-summer-2026/), [doi.org](https://doi.org/10.3390/ai7080298), [arxiv.org](https://arxiv.org/pdf/2510.05179)
