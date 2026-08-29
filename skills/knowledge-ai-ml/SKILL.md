---
name: knowledge-ai-ml
description: AI·ML 도메인 최신 지식 — 모델 지형, 생성형 AI, MLOps, AI 안전. AI 관련 역할이 작업 전 참고 (갱신: 2026-08-08)
---

# ai-ml 도메인 지식 (2026-08-08)

> 역할별 에이전트 KNOWLEDGE 블록을 도메인 단위로 통합한 지식 베이스.
> `agent-team learn --domains` 가 이 파일을 통째로 갱신한다.

## ai-generative-engineer
- **GPT Image 2(4월 출시)가 아레나 1위, MiniMax H3(Hailuo 3.0, 7/31)는 텍스트·이미지·비디오·오디오 입력→2K 스테레오 오디오 비디오 출력에 모션 트랜스퍼·생성형 편집까지 지원 — 멀티모달 통합 생성이 표준화 흐름** (llm-stats.com, local-ai-zone.github.io)
- **Qwen-Image-2.0(2월)이 생성·편집을 7B 단일 모델로 통합, 네이티브 2K·타이포그래피 강점으로 T2I·편집 아레나 동시 1위 — 20B→7B 경량화로 자체 호스팅 파이프라인 비용이 크게 하락** (qwenimages.com, gigazine.net)
- **FLUX.2·Qwen-Image 등 오픈 웨이트 모델이 포토리얼리즘·텍스트 렌더링·편집에서 클로즈드 모델과 대등 — 핵심 IP용 LoRA 파인튜닝 기반으로 오픈 모델 채택이 실용적 디폴트가 됨** (thundercompute.com, spheron.network)
- **VLM은 실시간 스트리밍 비디오로 이동 중: OpenMOSS MOSS-VL-Realtime(11B, 오픈소스)이 능동 발화 벤치마크 SOTA, Thinking Machines의 Inkling(975B MoE)은 Apache 2.0 공개 — 이미지 분석 파이프라인에 실시간·프로액티브 패턴 검토 가치** (thursdai.news)
- **디퓨전 LoRA 실무 컨센서스: 스타일·오브젝트 삽입은 r=64~128, α=2r 기준으로 시작해 검증 손실 기반 rank 조정, DAAM 어트리뷰션 맵으로 데이터셋 오염 토큰 진단** (thecodeforge.io, propelrc.com)
- **EU AI Act 50조(AI 생성물 기계판독 가능 표시 의무)가 2026년 8월부터 집행, 캘리포니아 SB 942도 1월 발효 — C2PA 메타데이터+비가시 워터마크(SynthID류)+로깅의 다층 표시가 생성 파이프라인 필수 요건화** (sesamedisk.com, magiclight.ai)

Sources: [llm-stats 이미지 생성 리더보드](https://llm-stats.com/leaderboards/best-ai-for-image-generation), [Local AI Zone 8월 업데이트](https://local-ai-zone.github.io/blog/ai-updates-august-2026.html), [Qwen-Image-2.0 릴리스](https://qwenimages.com/blog/qwen-image-2-release), [GIGAZINE](https://gigazine.net/gsc_news/en/20260212-qwen-image-2/), [Thunder Compute 오픈소스 이미지 모델](https://www.thundercompute.com/blog/best-open-source-image-generation-models), [Spheron 이미지 편집 모델 배포 가이드](https://www.spheron.network/blog/deploy-open-source-ai-image-editing-models-gpu-cloud-2026/), [ThursdAI 2026년 7월 릴리스](https://thursdai.news/releases/2026-07), [TheCodeForge LoRA/PEFT 가이드](https://thecodeforge.io/ml-ai/lora-peft-fine-tuning/), [propelrc LoRA 학습 가이드](https://propelrc.com/how-to-train-stable-diffusion-lora-models/), [sesamedisk C2PA·EU AI Act](https://sesamedisk.com/ai-content-provenance-2026-c2pa-watermarking/), [MagicLight C2PA 워터마킹 의무화](https://magiclight.ai/news/c2pa-and-global-watermarking-mandates-for-ai-video-in-2026/)

## ai-lead
- 2026-08-02부로 EU AI Act의 GPAI 모델 제공자 의무에 대한 AI Office 집행 권한이 발효 — 기술문서 요구·모델 평가·시정명령·과징금(최대 €15M 또는 매출 3%)이 실제 리스크가 됨 (artificialintelligenceact.eu, digitalapplied.com)
- 프런티어 모델 경쟁 재편: Anthropic Claude Fable 5·Opus 5(7월), OpenAI GPT-5.6(7월), Gemini 3.5 Flash Lite 등 최신 세대가 출시되어 모델 포트폴리오·벤더 전략 재검토 필요 (llm-stats.com, llmgateway.io)
- 에이전틱 AI 운영의 핵심은 모델이 아닌 '하니스 엔지니어링' — 재시도·서킷브레이커·휴먼 체크포인트·예산/중단 조건을 갖춘 "신뢰 못 하는 마이크로서비스"로 취급하는 것이 프로덕션 베스트프랙티스로 정착 (medium.com, devstarsj.github.io)
- 연결된 에이전트 네트워크 간 간접 프롬프트 인젝션이 지속·전파되는 'ZombieAgent'형 공격이 시연됨 — 멀티에이전트 아키텍처에 격리·권한 최소화 등 보안 기준 수립 시급 (ailoitte.com)
- 비용 최적화의 최고 ROI 수단은 모델 라우팅(단순 쿼리→소형 모델) — 다층 평가(자동 지표+모델 기반 평가+휴먼 저지)와 함께 LLMOps 스택의 표준 구성요소화 (medium.com)
- 기업 AI의 병목은 배포가 아닌 전환: AI 도입 조직 중 워크플로·역할 재설계까지 완료한 곳은 12%뿐이며, 리더 80%가 보안을 최대 장벽으로 지목 — 거버넌스·운영모델 재설계가 AI 리드의 핵심 과제 (deloitte.com)

## ai-ml-engineer
- MCP 2026-07-28 스펙이 initialize 핸드셰이크·세션ID를 제거한 완전 스테이트리스 구조로 전환, OAuth mix-up 방어 강화와 MCP Apps·비동기 장기실행 태스크 확장이 공식화됨 (venturebeat.com, developers.googleblog.com)
- 파인튜닝 실무 표준은 "Prompt → RAG → LoRA/QLoRA 파인튜닝 → 증류" 순서로 수렴, 파인튜닝은 지식 주입이 아닌 행동·형식 교정용이며 비용·지연 절감용 증류가 최고 ROI로 부상 (winder.ai, bigdataboutique.com)
- 추론 서빙은 대량 배치·처리량 중심이면 vLLM, 반복 프리픽스가 많은 에이전트·대화형 워크로드면 RadixAttention 기반 SGLang을 쓰고 게이트웨이 뒤에 병행 운영하는 이원화가 정착 (yottalabs.ai, sandbase.ai)
- 에이전트 평가는 end-to-end·트래젝터리(툴콜·재시도·핸드오프)·컴포넌트 3계층으로 나누고, 프로덕션에서는 휴리스틱 100% + LLM-judge 5~10% 샘플링으로 트레이스 기반 상시 평가하는 게 베스트프랙티스 (confident-ai.com, braintrust.dev)
- 평가-관측 통합이 핵심 트렌드: 점수를 프롬프트·모델·데이터셋 버전에 역추적 가능하게 연결하고, 프로덕션 엣지케이스를 평가셋으로 자동 환류시켜 품질 드리프트를 사전 감지 (adaline.ai, future_agi/medium.com)
- 에이전트 간 통신 표준 A2A v1.0이 프로덕션 표준으로 정식 릴리스되고 MCP 서버 구현 200+ 돌파, 멀티에이전트 상호운용성이 프레임워크 선택의 주요 기준이 됨 (ruh.ai, aaif.io)

Sources: [VentureBeat](https://venturebeat.com/infrastructure/mcp-just-got-its-biggest-update-ever-heres-what-changes-for-ai-agents), [Google Developers Blog](https://developers.googleblog.com/scaling-ai-agent-infrastructure-with-the-mcp-stateless-updates/), [Winder.AI](https://winder.ai/rag-vs-fine-tuning-2026-decision-framework/), [BigData Boutique](https://bigdataboutique.com/blog/fine-tuning-llms-when-rag-isnt-enough), [Yotta Labs](https://www.yottalabs.ai/post/vllm-vs-sglang-which-inference-engine-should-you-use-in-2026), [SandBase](https://www.sandbase.ai/blog/vllm-vs-sglang-2026/), [Confident AI](https://www.confident-ai.com/blog/llm-agent-evaluation-complete-guide), [Braintrust](https://www.braintrust.dev/articles/agent-observability-complete-guide-2026), [Adaline](https://www.adaline.ai/blog/complete-guide-llm-ai-agent-evaluation-2026), [ruh.ai](https://www.ruh.ai/blogs/ai-agent-protocols-2026-complete-guide), [AAIF](https://aaif.io/blog/mcp-is-growing-up)

## ai-safety
- EU AI Act GPAI 집행이 2026-08-02부로 발효 — AI Office가 기술문서 제출·모델 접근·리스크 완화를 강제할 수 있고 최대 글로벌 매출 3%/€1,500만 벌금, Code of Practice 서명사는 감경 고려 (helpnetsecurity.com, artificialintelligenceact.eu)
- 프롬프트 인젝션이 여전히 에이전틱 AI 보안 사고의 최다 원인 — 테스트된 에이전트 시스템의 84%가 뚫렸고 "완전 패치 불가" 전제하에 OpenAI Lockdown Mode 같은 권한 축소 모드가 표준화되는 추세 (helpnetsecurity.com, adversa.ai)
- 새 공격 클래스 부상: Agent Data Injection(신뢰된 메타데이터로 위장한 간접 인젝션)과 MCP 서버 취약점(Anthropic Git MCP CVE-2025-68143~45) — 레드팀 범위에 도구·RAG·MCP 공급망 포함 필수 (adversa.ai, zylos.ai)
- 멀티턴 제일브레이크 평가가 표준으로 이동 — MultiBreak(멀티턴 벤치마크), Jailbreak Distillation(자동 갱신형 "renewable" 벤치마크) 등 단일턴 벤치마크의 한계를 보완하는 도구 등장 (arxiv.org, techxplore.com)
- 가드레일 운영 베스트프랙티스는 5계층 방어(입력 검증→프롬프트 격리→모델 가드레일→출력 필터→상시 모니터링) + Garak/PyRIT/HarmBench로 배포 후 지속 레드팀 (generalanalysis.com, confident-ai.com)
- 조달·감사 기준은 OWASP LLM Top 10과 NIST AI RMF로 수렴 — 방어 문서화를 갖춘 조직은 34.7%에 불과해 정책·증적 체계가 차별화 포인트 (confident-ai.com, helpnetsecurity.com)

Sources: [Help Net Security — EU AI Act enforcement](https://www.helpnetsecurity.com/2026/08/04/eu-ai-act-enforcement-ai-models/), [Help Net Security — OWASP prompt injection](https://www.helpnetsecurity.com/2026/06/11/owasp-prompt-injection-ai-security-failures/), [artificialintelligenceact.eu](https://artificialintelligenceact.eu/enforcement-of-chapter-v-under-the-eu-ai-act/), [Adversa AI](https://adversa.ai/blog/top-agentic-ai-security-resources-august-2026/), [Zylos Research](https://zylos.ai/research/2026-05-16-agentic-ai-security-prompt-injection-defense-stack/), [MultiBreak (arXiv)](https://arxiv.org/html/2605.01687v1), [TechXplore](https://techxplore.com/news/2026-03-renewable-benchmark-llm-jailbreak-safety.html), [General Analysis](https://generalanalysis.com/guides/best-ai-guardrails), [Confident AI](https://www.confident-ai.com/knowledge-base/compare/best-ai-red-teaming-tools-2026)

## mlops-engineer
- 통합 MLOps/LLMOps 플랫�폼 수렴: 전통 ML 모델과 파인튜닝 LLM을 동일한 레지스트리·모니터링·배포 파이프라인으로 관리하고, 프롬프트도 git 태그 릴리스로 버전 관리하는 것이 표준화 (medium.com/codex)
- KServe가 vLLM 기반 런타임으로 LLM을 서빙하며 OpenAI 호환 API를 노출 — 서빙 스택은 vLLM/Triton behind KServe가 기본 조합으로 정착 (kodekloud.com, rahulkolekar.com)
- 드리프트 감지·비용 평가·재학습·검증·배포까지 닫힌 루프로 자동화하는 "자율 재학습(autonomous retraining)"이 확산, 사람은 정책·예외만 검토 (hyscaler.com)
- 드리프트 모니터링은 특징 드리프트(PSI/KS)·예측 드리프트·개념 드리프트(지연 레이블 보정) 3계층 + 인프라·데이터품질·모델성능·비즈니스임팩트 4계층 관측이 베스트프랙티스 (mlmonitoring.report, hjlabs.in)
- EU AI Act: 2026-08-02부로 투명성 의무(Art.50)·GPAI 집행권·벌칙 체계가 본격 발효(고위험 시스템 중과 의무는 2027-12/2028-08로 연기) — 감사가능성·로그 보존이 MLOps 파이프라인 요구사항으로 편입 (artificialintelligenceact.eu, hklaw.com)
- 2026 기본 스택: Iceberg/Delta(데이터) + Feast/Tecton(특징스토어) + MLflow 3(GenAI 트래킹)/W&B + Airflow/Dagster/Kubeflow(오케스트레이션) + DVC(데이터 버전) 조합이 사실상 표준 (rahulkolekar.com, devidevs.com)

Sources: [MLOps in 2026 Guide](https://hyscaler.com/insights/mlops-in-2026-guide/), [MLOps in 2026: From MLflow to LLMOps](https://medium.com/codex/mlops-in-2026-from-mlflow-to-llmops-the-complete-guide-to-shipping-ai-in-production-0024955b70c4), [ML Monitoring Report](https://mlmonitoring.report/), [MLOps on Kubernetes 2026](https://kodekloud.com/blog/using-kubernetes-for-mlops/), [MLOps in 2026 — The Definitive Guide](https://rahulkolekar.com/mlops-in-2026-the-definitive-guide-tools-cloud-platforms-architectures-and-a-practical-playbook/), [MLOps Tools Comparison 2026](https://devidevs.com/blog/mlops-tools-comparison-2026-complete-stack), [EU AI Act Aug 2026 Deadline (Holland & Knight)](https://www.hklaw.com/en/insights/publications/2026/04/us-companies-face-eu-ai-acts-possible-august-2026-compliance-deadline), [EU AI Act High-level Summary](https://artificialintelligenceact.eu/high-level-summary/)
