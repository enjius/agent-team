---
name: knowledge-ai-ml
description: AI·ML 도메인 최신 지식 — 모델 지형, 생성형 AI, MLOps, AI 안전. AI 관련 역할이 작업 전 참고 (갱신: 2026-08-30)
---

# ai-ml 도메인 지식 (2026-08-30)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 모델 지형 — 프런티어 모델
- 8월 한 달에만 8개 사에서 14개 신모델이 출시되며 릴리스 속도가 검증 역량을 추월했다는 평가 (llm-stats.com, llmgateway.io)
- Anthropic은 Claude Opus 5(7월 24일)에 이어 Claude 5 패밀리를 전개 중이며, 최상위 Mythos 티어(Fable 5) 신설 (learn.oreateai.com)
- OpenAI GPT-5.6 패밀리(Sol/Terra/Luna)가 7월 9일 GA — Sol이 플래그십 티어 (llmgateway.io)
- Google Gemini 3.7 Flash(8월 13일)가 현재 가장 빠른 프런티어급 모델로 평가 (llm-stats.com)
- xAI Grok 4.6(8/12), Alibaba Qwen3.8-Max(8/3), Meta Muse Spark 1.2(8/5) 등 비미국·비3사 릴리스도 활발 (aireleasetracker.com)
- 8월 주요 릴리스 전부가 멀티모달(텍스트+이미지, 일부는 +비디오+오디오) 이해를 기본 탑재 — 텍스트 전용 모델은 사실상 퇴장 (felloai.com)

## 오픈소스·오픈웨이트 모델
- 오픈웨이트 선두는 Qwen 3.5 / DeepSeek V4 / Llama 4 / Mistral Large 3 / GLM-4.7 구도 (codersera.com)
- DeepSeek V4-Pro가 SWE-bench Verified 80.6%로 클로즈드 프런티어와 0.2pt 차이까지 근접, MIT 라이선스 (huggingface.co)
- Qwen 3.5(2월)는 397B 총/17B 활성 파라미터의 네이티브 VLM으로 201개 언어·1M 컨텍스트 지원, Apache 2.0 (featherless.ai)
- 스파스 MoE가 플래그십 오픈모델의 사실상 표준 아키텍처 — 총 파라미터 대비 활성 파라미터 4~5% 수준 (hidekazu-konishi.com)
- 이미지 쪽 오픈웨이트는 Black Forest Labs FLUX가 선두 — 자체 데이터 파인튜닝·자가 호스팅 가능 (buildfastwithai.com)

## 에이전트·MCP
- MCP는 실험 단계를 지나 표준 인프라로 정착 — 공개 MCP 서버 1.7만 개+, 도입 기업 72%가 사용 확대 예정 (firecrawl.dev)
- 프로토콜 역할 분담이 관례화: 도구 접근은 MCP, 에이전트 간 조정은 A2A, UI 연동은 AG-UI (47billion.com)
- 프로덕션 프레임워크 순위는 LangGraph 1.0, Claude Agent SDK, CrewAI 1.14, MS Agent Framework 1.0, LlamaIndex Workflows 1.0 순으로 평가 (langchain.com)
- 프로덕션 베스트프랙티스: 스코프 권한, 액션별 결정 로그(감사성), 리스크 임계값 기반 인간 승인 체크포인트, 비가역 액션에 하드웨어 기반 인가 (the-agent-report.com)
- 표준 레퍼런스 아키텍처가 자리 잡아, 표준이 있는 부분에 커스텀 통합 코드를 짜지 않는 것이 권장사항 (alicelabs.ai)

## 생성형 미디어 (이미지·비디오)
- 비디오는 Google Veo 3.1이 포토리얼·시간적 일관성·지시 이행에서 최상위, "Ingredients to Video"로 제어력 우위 (kingy.ai)
- OpenAI는 Sora 웹/앱을 4월 26일 종료했고 API도 2026년 9월 24일 중단 예정 — Sora 의존 파이프라인은 이전 필요 (wavespeed.ai)
- Seedance 2.0이 멀티 캐릭터·장면 전환 등 시네마틱 스토리텔링에서 강세 (teamday.ai)
- 2026년 초 기준 선두 비디오 모델은 8~20초 네이티브 해상도 클립에 동기화 오디오·물리 일관성·컷 간 캐릭터 일관성 제공 (imggen.org)
- 이미지 상위권은 ChatGPT Images 2.0(포토리얼·커머셜), Nano Banana Pro(스타일화), Midjourney V8.1(아트·에디토리얼) 구도 (buildfastwithai.com)

## MLOps·LLMOps
- 클래식 ML 플랫폼과 LLM 플랫폼의 경계가 소멸 — 하나의 레지스트리·모니터링·배포 체계로 XGBoost와 파인튜닝 LLM을 함께 운영하는 통합 전략이 승자 (hyscaler.com)
- LLM 관측성은 로그 수준을 넘어 프롬프트/응답 실시간 모니터링, 토큰·비용 어트리뷰션, 프롬프트 단위 효과 측정이 필수 항목 (langwatch.ai)
- 할루시네이션 모니터링이 모델 관측성의 신규 카테고리로 정착, 프롬프트 버저닝·평가 프레임워크·비용 관리가 핵심 역량 (stackpulsar.com)
- 오픈소스 쪽은 MLflow가 에이전트 트레이싱+리플레이·프롬프트 버저닝·자동 평가를 단일 플랫폼에 통합해 독보적 (mlflow.org)
- Opik(Comet)이 신흥 강자 — 비용 추적 트레이싱, 내장 평가 지표(할루시네이션·관련성), 에이전트 옵티마이저 SDK 제공 (firecrawl.dev)
- 드리프트·피처 중요도 변화·비즈니스 지표 상관까지 잡는 AI 전용 관측 도구(Arize, WhyLabs, Fiddler)가 범용 모니터링을 대체 (hyscaler.com)

## 추론 인프라·비용
- 추론 비용이 3년 만에 1,000배 하락 — GPT-4급 성능이 백만 토큰당 $0.40 수준 (gpunex.com)
- 2026년 들어 추론이 학습을 제치고 GPU 수요의 1위 동인이 됨 (spheron.network)
- 비용 절감 최대 레버는 연속 배칭 — vLLM/TensorRT-LLM에서 켜는 것만으로 동일 카드에서 2~3배 처리량 (regolo.ai)
- 프리픽스 캐싱은 긴 공유 시스템 프롬프트를 쓰는 챗/RAG에서 프리필 연산의 60~80% 제거 (cast.ai)
- H100에서는 FP8 양자화 우선 적용이 권장 — 품질 손실 2% 미만에 1.3~2배 처리량 (morphllm.com)
- 하드웨어(세대당 2~3배)·서빙 소프트웨어(2~3배)·MoE 아키텍처(3~5배)·양자화(2~4배)가 복리로 비용을 끌어내리는 중 (gpunex.com)

## AI 안전·규제
- EU AI Act 핵심 의무가 8월 2일 발효 — 챗봇 고지, 합성 콘텐츠 표시, 딥페이크 라벨링 등 Article 50 투명성 의무가 집행 대상 (technology.org)
- 단, Digital Omnibus(Regulation 2026/1744, 7/27 발효)로 고위험(Annex III) 의무는 2027년 12월로, 제품 내장형(Annex I)은 2028년 8월로 연기 (insideprivacy.com)
- 2026년 8월 2일 이전 출시된 합성 콘텐츠 생성 시스템의 기계판독 가능 마킹 의무는 2026년 12월 2일로 유예 (lw.com)
- AI 생성 비동의 성적 이미지(NCII)에 대한 금지 조항이 Article 5에 신설 (insideglobaltech.com)
- 연구 트렌드: 해석가능성이 CoT 검증기 등 실시간 세이프가드로 프로덕션 투입, 공격 표면은 프롬프트에서 스테가노그래피·백도어로 이동 (medium.com)
- Representation Engineering 기반 '뉴럴 서킷 브레이커'로 에이전트의 기만·권력추구 시그니처를 실행 전 차단하는 연구가 진행 중 (sparai.org)
- FLI Summer 2026 AI Safety Index가 9개 주요 AI 기업을 37개 지표로 평가 — 안전 프레임워크 임계값의 측정가능성·외부 집행가능성 요구 (futureoflife.org)
