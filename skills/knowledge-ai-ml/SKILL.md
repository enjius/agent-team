---
name: knowledge-ai-ml
description: AI·ML 도메인 최신 지식 — 모델 지형, 생성형 AI, MLOps, AI 안전. AI 관련 역할이 작업 전 참고 (갱신: 2026-09-10)
---

# ai-ml 도메인 지식 (2026-09-10)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 프론티어 모델 지형
- Anthropic이 9/1 Claude Fable 5.1·Mythos 5.1 출시. 동일 가중치이나 Mythos는 검증된 방어 조직에만 세이프가드 해제 제공, 가격 동결에 API 호환성 깨지는 변경 3건 포함 (digitalapplied.com)
- OpenAI GPT-6 Astra 9/3 출시. 1M 컨텍스트, 입력 $10/출력 $50 per M토큰, 272K 초과 프롬프트는 전체 재과금, 고급 사이버 기능은 Daybreak 프로그램 참여 조직만 허용 (cloudzero.com, wikipedia.org)
- Google Gemini 3.8 Flash 9/2 출시, 3.7 Flash와 동일한 도입가 유지. 사이버 완화 완화판 'Cyber' 변종은 Fairwind 게이트 뒤에 제공 (digitalapplied.com)
- Meta Muse Spark 1.3 출시(9/2), 기여자 티어 신설. Perplexity는 로컬 PPLX Qwen 3.8 27B를 쓰는 Hybrid Compute 공개(9/1) (digitalapplied.com)
- 9월 프론티어 4건 중 3건이 "일반판 + 게이트된 보안 특화 티어" 이중 출시 구조. 사이버 역량 게이팅이 업계 표준으로 정착 중 (local-ai-zone.github.io)
- 현재 종합 순위 상위는 Claude Opus 5, GPT-6 Astra, Claude Fable 5 순. 모델 선정 시 벤치마크보다 가격·컨텍스트 재과금 구간 확인 필수 (benchlm.ai)

## 오픈웨이트 모델
- Kimi K3(7/16): 2.8T MoE, 896 전문가 중 16개 활성(약 50B), 1M 컨텍스트, 네이티브 멀티모달. 현재 최대 오픈웨이트 (thundercompute.com)
- Qwen3.8(8/12): 2.4T 파라미터로 오픈웨이트 2위. 8월은 "오픈웨이트 역사상 가장 중요한 달"로 평가 (llm-stats.com)
- GLM-5.2(Z.ai, 6월): 744B/40B 활성, 1M 컨텍스트, MIT 라이선스. Terminal-Bench 2.1 81.0으로 Opus 4.8에 근접, SWE-bench Pro 오픈 1위 (cline.bot, codersera.com)
- DeepSeek V4 Pro(4/24 프리뷰): 1.6T/49B 활성, 1M 컨텍스트, MIT. SWE-bench Verified 80.6% (emergent.sh)
- MiniMax 최신 모델 SWE-bench Pro 59.0%로 GPT-5.5(58.6%) 상회. 중국계 오픈 랩(DeepSeek·Qwen·MiniMax·GLM)이 폐쇄 랩보다 먼저 움직이는 패턴 (developersdigest.tech)
- 코딩 에이전트용 셀프호스팅은 GLM-5.2 또는 DeepSeek V4 Pro가 기본 선택지. 둘 다 MIT라 상용 제약 없음 (codingfleet.com)

## 생성형 AI (이미지·비디오·오디오)
- 이미지 모델은 프로덕션급 도달, 비디오는 네이티브 오디오·실제 카메라 제어 탑재로 "에이전시급" 격차 급속 축소 (hedra.com)
- 텍스트→비디오 Elo 1위는 Gemini Omni Flash(1324, 분당 $6). 오디오 포함 품질 1위는 Seedance 2.0(1213) (ngram.com)
- 캐릭터 일관성은 긴 프롬프트 대신 참조 이미지 제어가 표준. Veo 3.1 Ingredients 3장, Seedance 2.0 9장+클립+오디오, Wan 2.7 9그리드 입력 (wavespeed.ai)
- 셀프호스팅 오픈 비디오 대안: LTX-2.3, Wan 2.7, HunyuanVideo 1.5 (pinggy.io)
- Sora 2 API는 2026-09-24 서비스 종료 예정. 의존 파이프라인은 즉시 이전 필요 (llm-stats.com)
- 비디오 생성은 "인프라 단계" 진입. 모델 선택보다 파이프라인·비용·배치 처리 설계가 차별화 요소 (blog.mean.ceo)

## 에이전트·에이전틱 코딩
- MCP(에이전트↔도구)와 A2A(에이전트↔에이전트)가 사실상 HTTP급 표준. 공개 MCP 서버 2,000개 이상, WebMCP·OSI도 프로토콜 스택 편입 중 (dev.to, firecrawl.dev)
- 단일 에이전트에서 병렬 전문 에이전트 팀으로 이동. 이를 조율하는 소프트웨어 계층을 "에이전트 하네스"로 부름 (thenewstack.io)
- Claude Code: 서브에이전트, 체크포인트 자동 저장, 파일 편집 훅, 예약 루틴 추가. 1M 컨텍스트에 멀티파일 작업 토큰 소모 약 5.7배 절감 주장 (turingcollege.com)
- OpenAI는 GPT-5.3-Codex까지 출시. 전작 대비 25% 빠르고 작업 중 실시간 조종 지원 (builder.io)
- 포지셔닝: Copilot=엔터프라이즈 기본, Cursor=IDE 중심, Claude Code=심층 에이전틱 리팩토링, Codex=비동기 작업. Grok Build가 가격 경쟁 합류 (thenewstack.io)
- 코딩 에이전트의 기업 확산으로 AIR Security가 $50M 투자받아 에이전트용 인라인 방화벽 출시. 에이전트 보안이 별도 카테고리로 부상 (agentic.ai)

## MLOps / LLMOps
- OpenTelemetry GenAI 시맨틱 컨벤션(gen_ai.* 스팬)이 관측성 벤더 중립 기준선. 도구 선정 시 OTel 네이티브 여부가 핵심 판단 기준 (signoz.io)
- 관측성 도구 포지션: Langfuse=오픈소스 기본, LangSmith=LangChain 워크플로, Braintrust=엄밀한 eval 과학, Arize Phoenix·OpenLLMetry=OTel 기반 유연성 (firecrawl.dev, openobserve.ai)
- 에이전트는 멀티턴·툴콜·중간 결정까지 추적 필요. 멀티턴 평가+실패 자동 발굴+회귀 테스트를 한 워크플로로 묶는 추세 (digitalapplied.com)
- FinOps for ML: 요청·모델·고객 단위 추론 비용 추적이 표준 요구사항. GPU 비용이 재무팀 검토 항목 (guideflow.com)
- 플랫폼 수렴: SageMaker·Vertex·Databricks가 LLMOps 기능 흡수, 순수 LLMOps 도구는 eval·프로덕션 트레이싱으로 심화. 대부분 팀은 예측 ML+GenAI 이중 스택 운영 (medium.com/codex)
- 추론 서빙: vLLM·SGLang 모두 연속 배칭, PagedAttention/RadixAttention, 청크 프리필, 스펙큘레이티브 디코딩, 프리필-디코드 분리 지원. P/D 분리로 처리량 약 2배 (spheron.network, inclusion-ai.org)
- 하드웨어: Nvidia Rubin이 Blackwell 대비 추론 토큰 비용 최대 10배 절감, GPU당 HBM4 288GB·22TB/s. TPU v7·Trainium 3·Maia 200 등 커스텀 ASIC이 추론 시장 잠식 예상 (nvidianews.nvidia.com, introl.com)

## 학습·RAG·후처리 기법
- 표준 순서는 프롬프트 → RAG → 파인튜닝 → 증류. 질문은 "RAG vs 파인튜닝"이 아니라 어떤 조합인가 (metacto.com, substack.com)
- 에이전틱 RAG: 검색을 모델이 판단하는 도구로 취급. RL로 언제 검색·읽기·응답할지를 최종 결과 보상으로 학습 (medium.com, arxiv.org)
- 보상모델+PPO는 거의 불필요. DPO·KTO·ORPO가 훨씬 적은 비용으로 유사 정렬 품질 달성 (metacto.com)
- GRPO 기반 RFT(강화 파인튜닝)가 저비용으로 보편화. 동일 프롬프트 분포에 성공 비트를 주면 순수 모방을 능가 (medium.com)
- RFT 연산량 확장 시 도구 사용 빈도·추론 깊이·정확도가 체계적으로 향상. 에이전틱 RL 서베이 arXiv 2509.02547 참고 (arxiv.org)

## AI 안전·규제
- EU Digital Omnibus on AI(규정 2026/1744) 7/27 발효. Annex III 고위험 의무 2027-12-02로, Annex I 제품 내장 AI는 2028-08-02로 연기 (gibsondunn.com, cloudsecurityalliance.org)
- 연기와 무관하게 GPAI 제공자 의무와 Article 50 투명성 의무는 원래 일정대로 이미 시행 중. 실무 준수 코드(Code of Practice) 계속 적용 (mayerbrown.com, praxikon.com)
- EU AI Office와 각국 DPA가 8/2 이후 배포된 고위험 시스템의 Article 11 기술문서 감사 착수. 기록·인간 감독·구매자 대응 문서가 즉시 필요 (blog.mean.ceo)
- 브라질·인도·중국·미국도 집행 단계 진입. 브라질 프레임워크는 EU 위험 분류·알고리즘 영향평가 구조 차용 (cubbbix.com)
- FLI AI Safety Index 2026 여름: 9개 기업 중 C- 이상 없음, 대부분 D 이하. 프레임워크에 정량 임계값·독립 감사·의사결정 권한 부재 지적 (futureoflife.org)
- 프론티어 출시가 미 행정부 자발적 사전 검토를 거치는 관행 정착(GPT-6 Astra 사례). 사이버 역량은 검증 조직 한정 제공이 공통 패턴 (wikipedia.org)
- 해석가능성·CoT 모니터링 패러다임에 "탐지는 예방이 아니다"라는 비판 확산. Anthropic Constitutional AI 2.0(2월)은 레드팀 유해 출력 40% 감소 보고 (clawprint.org, claude5.com)

Sources: [DemandSphere](https://www.demandsphere.com/research/demandsphere-radar/ai-frontier-model-tracker/), [Digital Applied](https://www.digitalapplied.com/blog/ai-model-releases-september-2026-tracker), [LLM Stats](https://llm-stats.com/llm-updates), [BenchLM](https://benchlm.ai/frontier-ai-models), [Local AI Zone](https://local-ai-zone.github.io/blog/September_2026_AI_Model_Updates.html), [Thunder Compute](https://www.thundercompute.com/blog/best-open-source-llms), [Cline](https://cline.bot/blog/best-open-weight-models-that-matter-in-2026), [Codersera](https://codersera.com/blog/glm-5-2-vs-deepseek-v4-coding-2026/), [Emergent](https://emergent.sh/learn/glm-5-2-vs-deepseek-v4-pro), [CodingFleet](https://codingfleet.com/blog/glm-5-2-vs-deepseek-v4-pro/), [Developers Digest](https://www.developersdigest.tech/blog/glm-5-2-vs-deepseek-v4-vs-qwen3-open-weights-coding-showdown), [Hedra](https://www.hedra.com/blog/ai-models-first-half-2026), [ngram](https://www.ngram.com/blog/state-of-generative-ai-video-models-2026), [WaveSpeed](https://wavespeed.ai/blog/posts/ai-video-generation-news-2026/), [Pinggy](https://pinggy.io/blog/best_video_generation_ai_models/), [mean.ceo video](https://blog.mean.ceo/ai-video-generation-trends-september-2026/), [DEV Community](https://dev.to/alexmercedcoder/the-state-of-agentic-ai-standards-in-2026-mcp-a2a-webmcp-osi-and-the-protocol-stack-taking-3o2l), [Firecrawl](https://www.firecrawl.dev/blog/agentic-ai-trends), [The New Stack](https://thenewstack.io/claude-code-vs-cursor-vs-codex-vs-antigravity-2026/), [Turing College](https://www.turingcollege.com/blog/best-ai-coding-agents-2026-claude-code-codex-cursor), [Builder.io](https://www.builder.io/blog/codex-vs-claude-code), [Agentic.ai](https://agentic.ai/news), [SigNoz](https://signoz.io/comparisons/llm-observability-tools/), [Firecrawl observability](https://www.firecrawl.dev/blog/best-llm-observability-tools), [OpenObserve](https://openobserve.ai/blog/llm-observability-tools/), [Digital Applied observability](https://www.digitalapplied.com/blog/agent-observability-2026-evals-traces-cost-guide), [Guideflow](https://www.guideflow.com/blog/mlops-tools), [Medium CodeX](https://medium.com/codex/mlops-in-2026-from-mlflow-to-llmops-the-complete-guide-to-shipping-ai-in-production-0024955b70c4), [Spheron P/D](https://www.spheron.network/blog/prefill-decode-disaggregation-gpu-cloud/), [Inclusion AI](https://www.inclusion-ai.org/blog/llm-landscape-vllm-sgl/), [NVIDIA Newsroom](https://nvidianews.nvidia.com/news/rubin-platform-ai-supercomputer), [Introl](https://introl.com/blog/custom-silicon-inflection-2026-hyperscaler-asics-nvidia-gpu), [metacto](https://www.metacto.com/blogs/rag-vs-fine-tuning-vs-other-llm-techniques-choosing-the-right-approach), [Substack](https://aishwaryasrinivasan.substack.com/p/fine-tuning-vs-prompt-engineering), [Medium agentic RAG](https://buzzgrewal.medium.com/how-ai-agents-learned-to-think-the-reinforcement-learning-recipe-behind-agentic-rag-and-deep-0cd3663c9bf6), [Medium RFT](https://cobusgreyling.medium.com/agentic-reinforcement-fine-tuning-of-a-language-model-72c011750ba8), [arXiv 2509.02547](https://arxiv.org/pdf/2509.02547), [CloudZero](https://www.cloudzero.com/blog/gpt-6-pricing/), [Wikipedia GPT-6 Astra](https://en.wikipedia.org/wiki/GPT-6_Astra), [Gibson Dunn](https://www.gibsondunn.com/eu-ai-act-omnibus-agreement-postponed-high-risk-deadlines-and-other-key-changes/), [CSA](https://labs.cloudsecurityalliance.org/research/csa-research-note-eu-ai-act-high-risk-deadline-omnibus-20260/), [Mayer Brown](https://www.mayerbrown.com/en/insights/publications/2026/07/eu-ai-act-news-digital-omnibus-on-ai-new-guidance-on-risk-classification-gpai-and-transparency-obligations), [Praxikon](https://www.praxikon.com/en/posts/digital-omnibus-high-risk-postponement-december-2027), [mean.ceo regulation](https://blog.mean.ceo/ai-regulation-news-september-2026/), [Cubbbix](https://cubbbix.com/blog/ai-regulation-september-2026-global-update), [FLI](https://futureoflife.org/ai-safety-index-summer-2026/), [Clawprint](https://www.clawprint.org/p/openai-anthropic-google-deepmind-the-ai-safety-landscape-in-2026), [Claude 5 Hub](https://claude5.com/news/constitutional-ai-2-0-safety-alignment-breakthroughs-in-2026)
