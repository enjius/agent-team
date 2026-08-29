---
name: knowledge-trading-quant
description: 트레이딩·퀀트·투자 최신 지식 — 시장동향, 전략, 리스크, 핀테크. 금융 역할이 작업 전 참고 (갱신: 2026-08-29)
---

# trading-quant 도메인 지식 (2026-08-29)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 시장·매크로 동향
- 연준은 2026년 내내 동결 기조가 유력하며 완화 재개 기대는 2027년 초로 밀림 — 7월 비농업고용·소매판매가 마이너스로 나오는 등 매크로 약화에도 근원 CPI 반등이 발목 (mufgresearch.com)
- 호르무즈 해협 봉쇄 이슈가 지정학적 인플레 장벽으로 작용해, 경기 냉각이 요구하는 금리 인하를 지연시키는 구도 (alanlongbon.substack.com)
- 8월 미 증시는 Q2 실적 혼조와 연준 불확실성 속에 섹터 간 분산(dispersion)이 커진 국면 — 지수보다 종목·섹터 선별이 성과를 가름 (intellectia.ai)
- 2022년 말 시작된 랠리의 '확산(broadening)'이 2026년 강세 논거의 핵심 — 대형 기술주 집중에서 폭 넓은 참여로 이동 중 (oppenheimer.com)
- 8월 초 격렬한 로테이션으로 모멘텀 전략이 타격, 시스터매틱 롱숏은 2년래 최악의 일간 손실 기록 후에도 월간 +1.7% 유지 (hedgeweek.com)

## 퀀트 전략·헤지펀드
- 골드만삭스 300여 앨로케이터 조사에서 퀀트가 2026년 가장 선호되는 전략 1위 — 순 23%가 비중 확대 계획 (finance.yahoo.com)
- 싱가포르 Quantedge가 YTD +34.6%로 독주 — 멀티매니저 대형사(밀레니엄 +8.2%, Point72 +10.9%, 시타델 +12%)를 크게 앞섬 (hedgeweek.com)
- 업계는 정적(static) 퀀트 모델을 사실상 폐기하고, 시장 레짐 변화에 실시간 적응하는 '다이내믹 퀀트'(AI 기반 레짐 적응형)로 이동 (rebellionresearch.com)
- 2026년 지배적 전략은 시스터매틱 글로벌 매크로, 변동성 아비트라지, 고빈도 마켓뉴트럴 — 전략 유형별 실사(DD) 프레임워크도 정교화 (resonanzcapital.com)
- 시스터매틱 펀드의 90% 이상이 최소 1개 대체데이터 소스를 활용 — 대체데이터가 차별화 요소에서 기본기로 전환 (acuityanalytics.com)
- 퀀트 헤지펀드 전체로는 8월 초 2년래 성과 저점을 찍는 등 크라우딩·로테이션 리스크가 상존 (hedgeweek.com)

## AI·LLM 퀀트 리서치
- LLM 기반 알파 마이닝 연구가 학회 메인스트림 진입 — QuantaAlpha, FactorMiner(2026.2), 코드 진화형 알파 마이닝(ACL 2026), AlphaAgentEvo(ICLR 2026) 등 (github.com/Tom-roujiang)
- 크로스섹셔널 퀀트 전용 풀스택 멀티에이전트 프레임워크 AlphaCrafter(2026.5) 등 '해석→전략 구축→실행 지원' 통합 파이프라인으로 연구 축 이동 (arxiv.org)
- 77개 연구를 분석한 2026 증거 지도: 시간 일관적 데이터 분할을 보고한 실증 연구는 19개 중 2개뿐 — 백테스트-실거래 갭과 프로토콜 비교불가능성이 최대 맹점 (arxiv.org)
- 멀티에이전트 트레이딩 프레임워크는 '자율 의사결정자'가 아니라 '감독하의 리서치 어시스턴트'로 보는 것이 현재 학계 합의 (dl.acm.org)
- 실무 AI 도입은 증강(augmentation) 중심: 74%가 운영 업무, 69%가 코파일럿으로 쓰지만 최종 투자결정을 AI에 맡기는 곳은 6%뿐 (resonanzcapital.com)
- 생성형 AI를 리서치·운영에 활용한 펀드가 비도입 펀드 대비 연 3~5%p 초과성과라는 조사 — 단 인과관계 해석엔 주의 필요 (tommasomariaricci.com)
- AI 예산 배분 벤치마크: 인재 30~40%, 컴퓨트 20~30%, 데이터 인프라 15~25% — 빅테크發 인재 영입 경쟁 격화 (tommasomariaricci.com)

## 파생·변동성 (0DTE·디스퍼전)
- 0DTE가 SPX 옵션 거래량의 약 50~63%(일평균 약 230만 계약)를 차지하며 지수 옵션 시장의 기본 구조가 됨 (cboe.com)
- 딜러 감마가 양(+)이면 0DTE 헤지가 변동성을 억제(피닝), 음(-)이면 증폭(트렌딩) — 효과는 장 마감 2시간 전에 최대 (spotgamma.com)
- 나스닥이 매그니피센트7·브로드컴·IBIT 등 개별종목에 월·수요일 만기 추가를 SEC 승인받아, 초단기 만기가 지수를 넘어 개별주로 확산 (cboe.com)
- 개별주 준일일(near-daily) 만기는 실적 쇼크·집중 보유 구조와 감마 헤지가 맞물려 갭 리스크를 키울 수 있다는 경고 (cboe.com)
- 0DTE 전략의 스위트스팟은 VIX 15~25 구간 — VIX 15 미만에선 프리미엄이 거래비용을 못 이김 (volatilitybox.com)

## 디지털자산·토큰화
- 비트코인 변동성이 사이클 저점 — 낮은 레버리지, 기관 참여, 장기보유자 축적으로 시장 구조가 안정화 (coincall.com)
- 8월 중순 미 현물 비트코인 ETF에 이틀간 약 4.9억 달러 순유입되며 기관 수요 재개 (cryptonomist.ch)
- 이더리움 ETF 월간 유입($3.65억)이 사상 처음 비트코인을 추월 — 기관 자금의 로테이션 신호 (crypto.news)
- 스테이블코인 시총 3,220억 달러 돌파(2024년 초 1,370억 대비), 토큰화 국채 상품 70억 달러 초과 (coindesk.com)
- 토큰화 주식 시장이 연초 대비 30배 성장(온체인 거래량 약 90억 달러, 시총 약 24억 달러) — 크립토 거래소들이 주식 브로커리지로 변신 중 (financemagnates.com)
- NYSE 모회사 ICE가 24/7 거래·즉시결제·소수점 소유를 지원하는 토큰화 증권 플랫폼 개발 착수 (gfmag.com)
- Kraken은 비미국 리테일에 합성 주식 토큰 무기한선물(최대 20배)을, Robinhood는 Arbitrum 기반 토큰화 주식을 출시 — 슈왑도 오버나이트 거래 종목 확대 (coindesk.com)

## 규제·컴플라이언스
- SEC가 2026년 8월 '레귤레이션 크립토 애셋' 신규 규정 제안 — 크립토 투자계약에 맞춤형 등록면제 2종($5M 1회성 / 연 $75M) 포함 (sec.gov)
- SEC·CFTC가 3월 크립토 자산 분류 공동 가이던스 및 MOU 체결 — 양 기관 관할 조율·조화가 공식화 (ropesgray.com)
- GENIUS Act로 결제 스테이블코인의 연방 규제 체계 확립 — 증권·상품·예금이 아닌 별도 레짐으로 OCC 주관 (clearygottlieb.com)
- 하원 통과한 CLARITY Act에 이어 1월 상원 은행위가 자체 시장구조 법안 초안 공개 — 디지털자산 관할 경계 입법이 막바지 국면 (congress.gov)
- 규제 명확화가 기관 자금 유입과 토큰화 상품 확산의 직접 촉매로 작동 — 트레이딩 데스크는 상품별 관할(SEC vs CFTC) 매핑을 선행해야 (lw.com)

## 리스크 관리·시스템 리스크
- 사모신용(private credit)이 2008년 이후 최대 시험대 — 2025년 말 대형 레버리지론 디폴트와 PIK 토글 증가가 후기 사이클 스트레스 신호 (withintelligence.com)
- FSB 5월 보고서: 좁은 기준 디폴트율은 낮지만 선택적 디폴트·부실 교환 포함 시 상승 추세 — PIK 의존 증가는 신용 악화 징후 (fsb.org)
- 연준 금융안정보고서: 헤지펀드 레버리지가 사상 최고 수준 유지 — 현물-선물 베이시스 트레이드 감소분을 스왑 스프레드 등 상대가치 트레이드가 대체 (federalreserve.gov)
- 사모신용 펀드는 자기자본 65~80%로 보이나 보험사 등 계열 포함 연결 기준 레버리지는 12:1 — 은행이 논뱅크의 선순위 대부자가 되는 '재계층화' 체인 리스크 (perspectiveonrisk.substack.com)
- AI 투자 과열과 크레딧 시장 과잉이 겹치는 구간 — 담보 재평가 시 은행→논뱅크 체인 전체가 동시에 조여지는 전염 경로 주시 (hedgethink.com)

## 도구·인프라
- 2026년 파이썬 백테스팅 생태계의 활성 3강은 vectorbt, backtrader, QuantConnect(LEAN) — 입문 프레임워크로는 vectorbt 추천이 우세 (python.financial)
- vectorbt는 pandas/NumPy/Numba 기반 벡터화 백테스팅에 선택적 Rust 엔진까지 얹은 하이브리드 구조로 진화 (pypi.org)
- 백테스트→실거래 전환 생존성이 중요하면 NautilusTrader가 가장 강력한 오픈소스 기반으로 평가 (python.financial)
- 실무 워크플로 정석: vectorbt로 아이디어 탐색 → backtrader로 체결 검증 → QuantConnect로 라이브 배포 (pickuma.com)
- awesome-quant·awesome-systematic-trading(97개 라이브러리) 등 큐레이션 목록이 도구 선정의 출발점으로 유용 (github.com)

Sources: [Hedgeweek](https://www.hedgeweek.com/quant-hedge-funds-hit-two-year-performance-low/), [Yahoo Finance](https://finance.yahoo.com/news/hedge-fund-strategies-investors-desire-105401900.html), [Resonanz Capital](https://resonanzcapital.com/insights/quant-hedge-funds-in-2026-a-due-diligence-framework-by-strategy-type), [Awesome LLM Quant Papers](https://github.com/Tom-roujiang/Awesome-LLM-Quantitative-Trading-Papers), [ACM ICAIF](https://dl.acm.org/doi/full/10.1145/3768292.3770387), [MUFG Research](https://www.mufgresearch.com/rates/august-2026-fed-rates-call-update/), [Cboe](https://www.cboe.com/insights/posts/0-dt-es-decoded-positioning-trends-and-market-impact), [SpotGamma](https://spotgamma.com/0dte/), [SEC](https://www.sec.gov/newsroom/press-releases/2026-76-sec-proposes-new-regulation-crypto-assets), [Ropes & Gray](https://www.ropesgray.com/en/insights/alerts/2026/03/sec-and-cftc-issue-landmark-joint-guidance-on-classification-of-crypto-assets), [Cleary Gottlieb](https://www.clearygottlieb.com/news-and-insights/publication-listing/2026-digital-assets-regulatory-update-a-landmark-2025-but-more-developments-on-the-horizon), [FSB](https://www.fsb.org/uploads/P060526.pdf), [Federal Reserve](https://www.federalreserve.gov/publications/2026-may-financial-stability-report-leverage.htm), [CoinDesk](https://www.coindesk.com/markets/2026/06/11/wall-street-and-crypto-are-crashing-into-each-other-as-tokenized-treasury-markets-hit-usd14-6-billion), [Finance Magnates](https://www.financemagnates.com/forex/tokenised-stocks-jump-30-as-platforms-explore-247-equity-trading/), [Global Finance](https://gfmag.com/technology/nyse-plans-tokenized-24-7-trading/), [python.financial](https://python.financial/), [Pickuma](https://pickuma.com/for-investor/quantconnect-vs-backtrader-vs-vectorbt-which-to-start-2026/)
