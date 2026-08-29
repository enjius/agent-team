---
name: knowledge-trading-quant
description: 트레이딩·퀀트·투자 최신 지식 — 시장동향, 전략, 리스크, 핀테크. 금융 역할이 작업 전 참고 (갱신: 2026-08-08)
---

# trading-quant 도메인 지식 (2026-08-08)

> 역할별 에이전트 KNOWLEDGE 블록을 도메인 단위로 통합한 지식 베이스.
> `agent-team learn --domains` 가 이 파일을 통째로 갱신한다.

## asset-manager
- 마이데이터 2.0이 2025-06부터 27개 사업자 대상 시행 — 전송요구·동의 절차가 1회로 일원화되고 수집 범위가 의료·공공·통신으로 확대되어, 자산 집계 파이프라인의 동의 관리·데이터 스키마를 2.0 기준으로 재점검할 필요 (fsc.go.kr, kdi.re.kr)
- 거래내역 정합성 검증은 규칙 기반 매칭 엔진 + AI 예외처리 자동화가 표준으로 자리잡는 중 — 핵심 계좌부터 단계적 자동화, 예외 건별 소유자(owner) 지정, 전체 감사 추적(audit trail) 확보가 베스트프랙티스 (greshamtech.com, highradius.com, optimus.tech)
- 개인 자산앱 수익률 표기는 TWR(투자전략 평가용)과 MWR/IRR(실제 내 돈 수익 평가용) 병기가 업계 관행으로 정착 — JP모건 등 주요 서비스가 두 지표를 함께 제공하므로 대시보드도 이중 표기 검토 권장 (personalinvesting.jpmorgan.com, chase.com)
- 정산·잔액 원장은 범용 DB 테이블 대신 복식부기 전용 원장 설계가 강조되는 추세 — 고volume 환경에선 TigerBeetle 같은 debit/credit 네이티브 스키마의 전용 트랜잭션 DB를 원장에 쓰고 일반 데이터는 기존 DB에 두는 분리 패턴이 권장됨 (tigerbeetle.com, interledger.org)
- 자산 집계 API는 증권·연금·크립토 거래소까지 커버리지가 확대(Plaid Investments 기준 약 20개 계좌 유형) — 집계 후 순자산·자산배분 산출을 API 레이어에서 지원하는 흐름이므로 커버리지 갭(연금·ISA·크립토) 점검 필요 (plaid.com)
- 포트폴리오 회계 소프트웨어 선택 기준으로 "accounting-grade 데이터 리니지 + 성과보고와 원장 시스템 간 정합(reconcile to system of record)"이 2026년 핵심 평가축으로 부상 — 대시보드 수치와 원장 수치의 단일 진실원(SoR) 정렬을 우선순위로 (fundcount.com, solvexia.com)

Sources: [금융위 마이데이터 2.0](https://www.fsc.go.kr/no010101/84780), [KDI 오픈파이낸스 동향](https://eiec.kdi.re.kr/policy/domesticView.do?ac=0000180446), [Gresham reconciliation 2026](https://www.greshamtech.com/blog/best-reconciliation-software-for-financial-institutions-in-2026), [HighRadius reconciliation tools](https://www.highradius.com/resources/Blog/best-account-reconciliation-tools/), [Optimus AI reconciliation](https://optimus.tech/blog/best-ai-reconciliation-tools-for-finance-teams-2026), [J.P. Morgan 수익률 계산](https://support.personalinvesting.jpmorgan.com/?article=360018853471-How-does-JPMorgan-Personal-Investing-calculate-returns), [Chase TWR](https://www.chase.com/personal/investments/learning-and-insights/article/time-weighted-rate-of-return-explained), [TigerBeetle Docs](https://docs.tigerbeetle.com/single-page/), [Interledger×TigerBeetle](https://interledger.org/developers/blog/rafiki-tigerbeetle-integration/), [Plaid Investments](https://plaid.com/docs/api/products/investments/), [FundCount 2026](https://fundcount.com/best-portfolio-accounting-software/), [Solvexia portfolio reconciliation](https://www.solvexia.com/glossary/portfolio-reconciliation)

## chart-analyst
- AI 차트 도구가 스캔·백테스트·자동 추세선의 표준이 됨: TrendSpider(150+ 캔들패턴 자동 인식), Trade Ideas Holly AI 등이 2026년 대표 도구이며, 스캐너+차팅+저널링 3종 조합으로 오탐을 이중 확인하는 워크플로가 권장됨 (wallstreetzen.com, pragmaticcoders.com)
- TradingView가 2026년 AI Chart Copilot을 출시하고 Pine Script v6, Binance·Bybit·OKX 네이티브 연동, 알림·포트폴리오·채권/매크로 리서치 강화 등 AI 중심으로 개편됨 (chartwisehub.com, tradingview.com)
- 비전 LLM에 차트 "이미지"를 읽히는 방식은 신뢰 불가로 판명(방향성 정확도 ~51%, 패턴 인식 1/215) — 실제 캔들 수치 데이터 기반 분석이 필수라는 검증 결과가 확산됨 (gist.github.com, arxiv.org)
- MCP 서버로 실시간 캔들·스크리너·백테스트를 LLM에 직접 연결하는 패턴이 부상: TradingView MCP 등이 Claude/ChatGPT에서 주식·크립토·선물 데이터를 근거 기반 분석에 공급함 (github.com/atilaahmettaner/tradingview-mcp, lobehub.com)
- SMC/ICT(오더블록·FVG·유동성 풀)가 리테일 크립토·FX에서 지배적 시장구조 프레임워크로 정착했고, 프랙탈 특성상 멀티 타임프레임 분석과 결합해 쓰는 것이 표준이 됨 (excavo.com, lunefi.com)
- 학계에선 가격 데이터 기반 멀티에이전트 LLM(QuantAgent 등)이 지표·패턴·추세·리스크를 역할 분담해 분석하는 구조가 단일 모델 예측보다 우수하다는 연구가 이어짐 (arxiv.org)

Sources: [WallStreetZen](https://www.wallstreetzen.com/blog/best-ai-technical-analysis-tools/), [Pragmatic Coders](https://www.pragmaticcoders.com/blog/top-ai-tools-for-traders), [ChartWiseHub](https://chartwisehub.com/tradingview-updates-q1-2026/), [TradingView Blog](https://www.tradingview.com/blog/en/), [Vision LLM 차트 판독 검증](https://gist.github.com/roman-rr/c1cd675f7c35b68ae5ac281c30080166), [VLM 캔들스틱 벤치마크 (arXiv)](https://arxiv.org/html/2604.12659v1), [TradingView MCP (GitHub)](https://github.com/atilaahmettaner/tradingview-mcp), [Excavo SMC 가이드](https://excavo.com/blog/smart-money-concepts-guide), [LuneFi 시장구조 지표](https://lunefi.com/blog/market-structure-indicators-2026-best-smc-ict-tools-forex-crypto), [QuantAgent (arXiv)](https://arxiv.org/html/2509.09995v3)

## crypto-strategist
- 백테스트 과적합 방지의 표준이 CPCV(조합형 퍼지 교차검증)+Deflated Sharpe Ratio 조합으로 굳어졌고, scikit-learn 호환 오픈소스([github.com/eslazarev/purged-cross-validation](https://github.com/eslazarev/purged-cross-validation))로 purge/embargo/DSR을 바로 적용 가능 ([arxiv.org](https://arxiv.org/pdf/2512.12924)).
- 현실성 검증 기준: 슬리피지를 고정치가 아닌 주문크기/일거래량의 함수로 모델링하고, OOS에서 Sharpe가 40% 이상 하락하거나 MDD가 2배가 되면 과적합으로 판정 ([coinbureau.com](https://coinbureau.com/guides/how-to-backtest-your-crypto-trading-strategy), [paybis.com](https://paybis.com/blog/how-to-backtest-crypto-bot/)).
- 통계적 유의성 최소선은 다중 레짐(상승·하락·횡보)에 걸친 100~200회 이상 트레이드이며, 수수료·펀딩 반영 후 연 100%+ 수익 백테스트는 기본적으로 의심 대상 ([bitsgap.com](https://bitsgap.com/blog/how-to-read-crypto-backtest-results-like-a-pro-the-8-point-checklist), [fortraders.com](https://fortraders.com/blog/backtesting-strategies-that-actually-work)).
- 펀딩비 캐리(현물 매수+퍼프 숏) 수익률이 기관 유입으로 연 5~15% 수준까지 압축되어, 단순 캐리보다 거래소 간 펀딩 괴리·펀딩 예측(호가 불균형 기반) 전략으로 이동 중 ([quantt.co.uk](https://www.quantt.co.uk/resources/crypto-quant-strategies-2026), [arbitragescanner.io](https://arbitragescanner.io/blog/crypto-funding-rate-arbitrage-strategy-guide)).
- 퍼프 DEX는 Hyperliquid가 점유율 70%+로 사실상 표준 실행 venue가 됐고, 출금 불가 API 에이전트 월렛 구조 위에 Hummingbot·Freqtrade 등 오픈소스 봇 연동이 보편화 ([altrady.com](https://www.altrady.com/blog/crypto-trading-tools/hyperliquid-trading-guide), [dexly.trade](https://dexly.trade/learn/hyperliquid-trading-bots)).
- "자연어→전략 코드 생성" LLM 트레이딩 에이전트가 급증했지만 다수가 단순 보유 대비 언더퍼폼하는 마케팅성 제품이라, 에이전트 산출 전략도 동일한 OOS·비용 검증 게이트를 통과시켜야 함 ([bitsgap.com](https://bitsgap.com/blog/best-hyperliquid-trading-bots-in-2026), [gptrader.app](https://gptrader.app/ai-trading/how-to-build-a-trading-agent-ai-for-hyperliquid-dex-in-2026)).

## fintech-specialist
- 미 GENIUS법 하위규정 본격화 — OCC가 2026년 3월 결제 스테이블코인 발행 규칙안(NPRM)과 발행사 보고 양식을 내놓으며 1:1 준비금·감독 체계가 실무 단계로 진입, 은행·핀테크의 스테이블코인 결제 도입 판단이 올해의 전략 과제 (occ.gov, brookings.edu)
- 한국은 '디지털자산기본법' 연내 제정 드라이브 — 원화 스테이블코인 인가제·준비자산·상환청구권을 담은 당정 통합안이 9월 발의 예정으로, 발행 주체(은행 vs 비은행)가 최대 쟁점 (etnews.com, blockmedia.co.kr)
- 에이전틱 결제가 표준화 국면 — Google AP2·Mastercard Verifiable Intent가 FIDO Alliance에 이관(2026-05)되고 Visa Intelligent Commerce가 ChatGPT에 통합(2026-06), 실서비스는 카드 레일(TAP/AP2), M2M은 스테이블코인(x402)으로 이원화 추세 (eco.com, agenticplug.ai)
- 오픈뱅킹→오픈파이낸스 확장 — EU FiDA가 2026–27년 모기지·연금·투자·보험까지 데이터 공유를 확대하고, 미국은 연방 1033 규제 재부상과 주(州) 단위 입법이 병행되며 Plaid류 애그리게이터 미들웨어 모델이 사실상 표준 (spark.money, consumerfinancemonitor.com)
- FRAML(사기+AML 통합) 구조 전환 — 실시간 결제에서 사기 위험이 기존 이체 대비 10배(EBA 경고)로 커지며 탐지 창이 초 단위로 압축, KYC의 83%·거래모니터링의 78%가 AI 에이전트 도입 중이나 설명가능성·편향이 감독 이슈 (liminal.co, feedzai.com)
- FinCEN 대규모 AML 개편 — 2026년 4월 제안에서 "혁신 기술 실험에 추가 제재 리스크 없음"을 명시하고 형식적 점검에서 실효성 중심 감독으로 전환, 핀테크는 프로그램 효과성 입증 체계 재설계 필요 (fluxforce.ai, alessa.com)

Sources: [OCC Bulletin 2026-3](https://www.occ.gov/news-issuances/bulletins/2026/bulletin-2026-3.html), [Brookings](https://www.brookings.edu/articles/next-steps-for-genius-payment-stablecoins/), [전자신문](https://www.etnews.com/20251228000090), [블록미디어](https://www.blockmedia.co.kr/archives/1116640), [eco.com AP2](https://eco.com/support/en/articles/15192002-ap2-protocol-explained-google-s-agentic-commerce-standard-2026), [agenticplug.ai](https://agenticplug.ai/current-state-of-agentic-commerce), [Spark](https://www.spark.money/research/open-banking-global-state), [Consumer Finance Monitor](https://www.consumerfinancemonitor.com/2026/06/26/open-banking-regulation-in-2026-federal-regulation-resurfaces-as-states-bring-data-sharing-into-focus/), [Liminal](https://liminal.co/articles/insights/the-state-of-aml-compliance-in-2026), [Feedzai](https://www.feedzai.com/blog/future-aml-compliance-predictions/), [FluxForce](https://www.fluxforce.ai/blog/guide-to-aml-compliance-for-fintechs), [Alessa](https://alessa.com/blog/emerging-risks-in-aml-compliance-for-2026/)

## investment-expert
- 2026 포트폴리오 구성은 자산군 라벨이 아닌 목표기반(goal-based) 배분과 주식·채권·대체자산을 단일 리스크 프레임으로 묶는 '토탈 포트폴리오' 접근이 표준화 추세 (rbcgam.com, am.gs.com)
- 자문사 절반 이상이 대체투자를 평균 ~13% 편입하고, 고품질 채권 앵커 + 실물자산·옵션인컴 슬리브로 인컴·회복탄력성을 확보하는 배분이 주류 (ishares.com, lpl.com)
- 로보어드바이저 시장은 2026년 약 187억 달러(CAGR 31%)로 성장 중이며, 행동재무학 기반 개인화 + 생성형 AI 자문 + '알고리즘 리밸런싱·세금최적화 + 인간 어드바이저'의 하이브리드 모델이 핵심 (researchandmarkets.com, wezom.com)
- 다이렉트 인덱싱이 소액 최소금액($2,000~5,000)으로 리테일에 개방되어 2026년 말 8,000억 달러 돌파 전망 — ETF보다 빠른 성장률로 '초개인화 지수투자'가 앱 차별화 포인트 (broadridge.com, vettafi.com)
- 토큰화 ETF·펀드가 개념 검증을 넘어 24시간 거래 가능한 상품으로 상용화 단계 진입, 전체 ETF AUM은 2030년 35조 달러 전망 (jpmorgan.com, kucoin.com)
- 리스크 도구는 스트레스테스트·드로다운·집중도·상관관계 분석을 통합한 플랫폼(Nitrogen, Kwanti, YCharts 등)으로 수렴 중 — 리스크 점수의 수치화·시각화(클라이언트 대면)가 베스트프랙티스 (investmentnews.com, stratifi.com)

Sources: [RBC GAM](https://www.rbcgam.com/en/ca/article/portfolio-construction-trends-2026/detail), [Goldman Sachs AM](https://am.gs.com/en-us/advisors/insights/article/investment-outlook/portfolio-construction-2026), [iShares](https://www.ishares.com/us/insights/inside-the-market/2026-market-outlook-investment-directions), [LPL](https://www.lpl.com/research/weekly-market-commentary/lpl-research-2026-strategic-asset-allocation.html), [Research and Markets](https://www.researchandmarkets.com/reports/5766552/robo-advisory-market-report), [Wezom](https://wezom.com/blog/fintech-development-trends-2026), [Broadridge](https://www.broadridge.com/next/articles/etfs-make-room), [VettaFi](https://www.vettafi.com/insights/indexing-article-etfs-vs-direct-indexing-what-the-shift-toward-personalization-means-for-asset-managers), [J.P. Morgan](https://www.jpmorgan.com/insights/securities-services/custody/etf-trends), [KuCoin](https://www.kucoin.com/blog/future-ETFs), [InvestmentNews](https://www.investmentnews.com/glossary/risk-management-tools/263189), [StratiFi](https://www.stratifi.com/blog/financial-advisor-portfolio-management-software)

## investment-lead
- 기관 자산배분이 전통 60/40에서 60/20/20(주식/채권/대체)로 이동 중이며 사모시장이 약 $20조 규모로 성장, 사모대출은 미국 기관 45%가 확대 계획 — 앱의 자산배분 기본 프레임에 대체자산 슬리브 반영 검토 필요 (natixis.com, blackrock.com)
- 개인·자산관리 고객의 사모시장 접근이 에버그린 펀드 구조(ELTIF·LTAF·모델 포트폴리오)로 확산 — 유동성 정책과 상품 로직 기준 설계 시 참조할 구조 (avivainvestors.com)
- 웰스매니지먼트에서 '에이전틱 AI'가 자문 전달 방식을 바꾸는 핵심 트렌드로 부상, 로보어드바이저 시장은 2026년 $18.7B(CAGR ~31%)로 성장하며 하이브리드(디지털+휴먼) 모델이 표준화 (investsuite.com, thebusinessresearchcompany.com)
- SEC가 2026-01-28 3개 부서 합동성명으로 "토큰화해도 증권은 증권" 원칙을 명확화했고, 3월 나스닥의 토큰화 증권 거래 승인·DTCC 파일럿으로 토큰화 RWA 시장이 Q1에만 30% 성장($29B) — 토큰화 자산 취급 시 기존 증권규제 준수가 기본선 (lw.com, investax.io)
- 미 연준·OCC·FDIC가 2026-04 SR 26-2로 모델 리스크 관리 기준을 개정했으나 생성형·에이전틱 AI 공백이 남아, CRI의 FS AI RMF(230개 통제항목)가 사실상의 보완 프레임워크로 활용됨 — AI 기반 투자 로직의 거버넌스 체크리스트로 유용 (bloomberg.com, mitratech.com)
- EU AI Act 고위험 시스템 규제가 2026-08-02 발효되어 신용평가·자동화된 금융 접근성 결정 등이 고위험으로 분류 — AI 추천·자산배분 기능의 설명가능성·감사 로그 요건을 상품 기준에 선반영 권장 (sia-partners.com)

Sources: [Natixis IM](https://www.im.natixis.com/en-us/insights/portfolio-construction/2026/institutional-market-trends-shaping-2026), [BlackRock](https://www.blackrock.com/institutions/en-us/insights/outlooks/private-markets-outlook), [Aviva Investors](https://www.avivainvestors.com/en-gb/capabilities/private-markets/private-markets-study-2026/), [InvestSuite](https://www.investsuite.com/insights/blogs/top-wealth-management-trends-in-2026-the-shift-to-agentic-ai-and-private-markets), [TBRC](https://www.thebusinessresearchcompany.com/report/robo-advisory-global-market-report), [Latham & Watkins](https://www.lw.com/en/us-crypto-policy-tracker/regulatory-developments), [InvestaX](https://investax.io/blog/q1-2026-real-world-asset-tokenization-market-report), [Bloomberg](https://www.bloomberg.com/professional/insights/regulation/july-2026-global-regulatory-brief-model-risk-capital-markets-reform-and-ai-innovation/), [Mitratech](https://mitratech.com/resource-hub/blog/ai-governance-financial-services-accountability-gap/), [Sia Partners](https://www.sia-partners.com/system/files/document_download/file/2026-04/2026SIA_AI_Regulation-US_FS%201%20(1)%20(1).pdf)

## market-research-analyst
- **에이전틱 리서치 어시스턴트가 표준으로**: AlphaSense가 SuperAnalyst(2026.6)·Deep Research 등 "몇 주치 분석을 수분으로 압축"하는 워크플로 에이전트를 출시, 애널리스트는 데이터 수집(3~4시간)에서 벗어나 이상탐지·해석에 집중 (alpha-sense.com, thewallstreetschool.com)
- **AI 자본지출이 최대 매크로 테마**: 모건스탠리 추산 2028년까지 AI 인프라 투자 약 3조 달러(80%+ 미집행)가 흐르나, 하이퍼스케일러 capex 증가율은 ~70%→10% 미만으로 둔화 전망 → 밸류에이션 리셋·섹터 로테이션 트리거 (morganstanley.com, bloomberg.com)
- **AI발 자금이 크레딧 시장 재편**: AI 인프라의 부채 조달 확대로 하이퍼스케일러·테크 발행 급증, 사모신용(private credit)이 2008년 이후 첫 완전 신용 사이클 시험대에 진입 (apolloacademy.com, spglobal.com, withintelligence.com)
- **리서치 워크플로 3대 축**: 생성형 AI·실시간 데이터 애널리틱스·예측 모델링이 어닝콜 요약, 회계 이상 플래깅, 대체데이터·매크로 신호 스캔에 내재화 — 커버리지 확대·비용 절감의 '빌드 vs 바이' 결정이 핵심 이슈 (sganalytics.com, magistralconsulting.com)
- **테마는 '광범위 노출→선별'로 이동**: H2 2026 헤지펀드는 시장 방향보다 구조적 테마의 진짜 승자 선별·타이밍이 관건, VC는 임보디드 인텔리전스·에이전틱 오케스트레이션·전력/소버린 인프라에 집중 (amundi.com, alpha-sense.com)
- **AI 생성 리서치 규제·거버넌스 부상**: AI 산출물 공시 규정 강화 예상 → 데이터 프라이버시 표준, 모델 정확도·감사가능성(auditability) 확보가 애널리스트 베스트프랙티스로 자리잡음 (thewallstreetschool.com, marvin-labs.com)

## math-modeler
-신경망 SDE(드리프트·변동성을 NN으로 학습)가 Black-Scholes·Heston·Dupire 대비 실제 S&P500/100 옵션 데이터 캘리브레이션에서 우위를 보이며, 앙상블·하이브리드 ML 가격결정 모델이 2024~2026 사이 주류로 이동 (tandfonline.com, arxiv.org)
- EU FRTB 시행이 2027년 1월로 재연기되고 미국은 2026년 3월 Basel Endgame 재제안 — 97.5% ES 대체, 데스크 단위 IMA 승인·PLA 테스트·NMRF 애드온 대응이 리스크 수리 실무의 최우선 과제 (bloomberg.com, sifma.org)
- 시계열 파운데이션 모델(TimesFM-2.5, Chronos-2, MOIRAI-2)이 제로샷 예측 도구로 확산 중이나, 일간 초과수익률 예측에서는 CatBoost·LightGBM 앙상블에 밀린다는 벤치마크 결과가 나와 금융 적용 시 선별 사용 권장 (machinelearningmastery.com, arxiv.org)
- 대형 시간스텝 몬테카를로(Seven-League Scheme)의 GPU 가속과 fBM 기반 SDE의 딥러닝 시뮬레이션 등, NN으로 확률적 콜로케이션 포인트를 학습해 MC 경로 생성 비용을 줄이는 기법이 실용 단계 진입 (arxiv.org, sciencedirect.com)
- 양자 진폭 추정(QAE) 기반 몬테카를로 가격결정이 오라클 없이 동작하는 알고리즘·확률변동성 모델 확장으로 발전, 고전 MC 대비 이차 스피드업을 확률변동성·조기행사 파생상품까지 확대하는 연구가 활발 (arxiv.org)
- 최적 정지(아메리칸 옵션) 문제에 딥 primal-dual BSDE 방법이 제안되어, 조기행사 경계·조건부 기대값 계산이라는 파생 가격결정의 전통적 난제를 심층학습으로 우회하는 흐름이 강화 (arxiv.org)

Sources: [Machine learning methods for pricing financial derivatives (Quantitative Finance)](https://www.tandfonline.com/doi/full/10.1080/14697688.2026.2623901), [ML/DL in Computational Finance: Systematic Review](https://arxiv.org/pdf/2511.21588), [Bloomberg — U.S. Basel III Endgame](https://www.bloomberg.com/professional/insights/financial-services/the-u-s-basel-iii-endgame-enters-a-new-phase/), [SIFMA — FRTB Guide](https://www.sifma.org/news/blog/the-fundamental-review-of-the-trading-book-frtb-an-introductory-guide), [2026 Time Series Toolkit](https://machinelearningmastery.com/the-2026-time-series-toolkit-5-foundation-models-for-autonomous-forecasting/), [Pretrained TSFMs for Financial Return Forecasting](https://arxiv.org/abs/2606.27100), [GPU Seven-League Scheme](https://arxiv.org/pdf/2302.05170), [DL-based MC for fBM SDEs](https://www.sciencedirect.com/science/article/abs/pii/S092523122400016X), [Monte-Carlo Option Pricing in Quantum Parallel](https://arxiv.org/html/2505.09459v1), [Deep primal-dual BSDE for optimal stopping](https://arxiv.org/pdf/2409.06937)

## news-harvester
- 뉴스 애그리게이션·이벤트드리븐 알림 시장이 2026년 26.2억 달러→2034년 69억 달러(CAGR 12.9%)로 확대, AI 예측분석이 기본 탑재되는 성숙 단계 진입 (intelmarketresearch.com)
- 실시간 감성분석은 FinBERT+RAG 파이프라인이 표준화 — 뉴스 검색·감성분류·주가 상관을 연결하되 짧은 헤드라인의 문맥 부족이 신뢰도 저하 요인 (papers.ssrn.com, arxiv.org)
- LLM은 고정(frozen)하고 검색 계층만 시장 국면에 맞춰 적응시키는 'Point-in-Time RAG'가 신뢰도·데이터누수(look-ahead) 방지 베스트프랙티스로 부상 (arxiv.org 2605.31201)
- 예측 감성을 실제 익일 수익률과 비교해 소스 신뢰도를 자동 재조정하는 피드백형 멀티소스 검색이 신호/노이즈 분류 정확도를 개선 (arxiv.org 2512.20082)
- 신형 저가 툴(NowNews 등, €14.99/월)이 감성 스코어·정직성 신호·차트 오버레이(Pulse Signal)를 제공, AlphaSense·Bloomberg Terminal의 기관용 표준과 가격 격차 형성 (nownews.dev)
- Signal AI 등은 수백만 소스를 실시간 분석하는 미디어 모니터링으로 확장 — 뉴스원과 실행(execution) 시스템 간 무결 연결이 핵심 경쟁축 (bestfinancesites.com)

Sources: [intelmarketresearch](https://www.intelmarketresearch.com/news-aggregationevent-driven-trading-alerts-market-44651), [SSRN](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5145647), [arXiv PIT-RAG](https://arxiv.org/html/2605.31201), [arXiv NIFTY](https://arxiv.org/html/2512.20082), [NowNews](https://nownews.dev/blog/best-ai-financial-news-analysis-tools-2026), [BestFinanceSites](https://bestfinancesites.com/financial-news-aggregators)

## pro-trader
- **CME 24/7 크립토 선물·옵션 정식 가동(5/29~)**: 주말에도 CME Globex에서 BTC/ETH 선물이 연속 체결되므로 주말 갭 리스크 헤지와 주말 유동성 얇은 구간의 슬리피지 관리가 새 실행 변수가 됨 ([cmegroup.com](https://www.cmegroup.com/media-room/press-releases/2026/2/19/cme_group_to_launch247cryptocurrencyfuturesandoptionstradingonma.html)).
- **전통 선물의 24/7 확장·에너지 무기한(퍼페추얼) 계약 규제 논의 진행 중**: CFTC가 7/9 CME 원유 24/7 상장을 보류시키고 의견수렴을 8/26까지 연장 — 원유·에너지 세션 구조 변경 가능성을 미리 모니터링할 것 ([cftc.gov](https://www.cftc.gov/PressRoom/PressReleases/9265-26), [federalregister.gov](https://www.federalregister.gov/documents/2026/07/28/2026-15216/request-for-comment-on-the-extension-of-standard-futures-contracts-to-247-trading-and-on-perpetual)).
- **이벤트 계약(예측시장)이 월 $50B+ 규모의 실자산군으로 부상**: IBKR가 Kalshi·CME·ForecastEx를 TWS에 통합, CPI·FOMC 이벤트 헤지/국면 판단용 실시간 확률 소스로 활용 가치 상승 ([falconx.io](https://www.falconx.io/newsroom/from-opinions-to-odds-emerging-trends-in-the-prediction-market-landscape), [mayerbrown.com](https://www.mayerbrown.com/en/insights/publications/2026/06/the-odds-are-in-cftc-proposes-framework-for-event-contracts-and-prediction-markets)).
- **8월 현재 국면: 관세 재점화(캐나다 50%·브라질 25%)+이란 분쟁+연준 매파적 동결(4.25~4.50%)로 변동성 상방 압력** — VIX 20 상회 지속 시 CTA 추세추종 자금 흐름이 모멘텀을 증폭하므로 역추세 진입은 사이즈 축소가 원칙 ([hightowersignature.com](https://hightowersignature.com/blogs/insights/update-on-the-economy-and-markets-august-2026)).
- **실행단에서 AI 오더플로 도구가 표준화**: 알고 체결이 선물 거래량의 절반 이상을 차지, Bookmap(빙산주문·흡수 감지)·NinjaTrader AI 오더플로 등으로 체결 품질(슬리피지·흡수 확인 후 진입) 관리가 베스트프랙티스 ([quantvps.com](https://www.quantvps.com/blog/best-automated-futures-trading-software), [ninjatraderecosystem.com](https://ninjatraderecosystem.com/article/order-flow-analysis-with-ai-integration-a-practical-guide-for-traders/)).
- **크립토 퍼프 미시구조 연구(25.11~26.1, 26개 거래소): CEX는 긴밀히 통합·DEX는 파편화된 2층 구조** — 청산 캐스케이드·펀딩 레짐·미결제약정(OI)이 단기 방향 신호로 유효, 청산 밀집 구간 근처 스탑 배치는 회피 ([mdpi.com](https://www.mdpi.com/2227-7072/14/5/103)).

## quant-analyst
- LLM 기반 팩터 마이닝이 2026년 퀀트 리서치의 핵심 흐름 — QuantaAlpha·FactorMiner 등 자기진화형(self-evolving) 알파 발굴 프레임워크 논문이 급증 ([arxiv.org](https://arxiv.org/pdf/2604.18500), [github.com](https://github.com/Tom-roujiang/Awesome-LLM-Quantitative-Trading-Papers))
- 단일 LLM 대신 멀티에이전트 구조(TradingAgents, QuantAgent 등)로 뉴스·실적·시그널을 역할 분담 분석하는 방식이 표준화되는 추세 ([arxiv.org](https://arxiv.org/pdf/2412.20138), [blog.brightcoding.dev](https://www.blog.brightcoding.dev/2026/06/02/why-top-quants-are-ditching-single-llms-for-quantagent-multi-agent-trading))
- 백테스트 도구 선택 기준이 "API 취향"에서 리서치 규모·체결 현실성·라이브 전환 비용으로 이동 — 대규모 파라미터 스윕은 VectorBT(PRO), ML 팩터 리서치는 Qlib이 사실상 표준 ([python.financial](https://python.financial/), [dev.to](https://dev.to/linou518/backtrader-vs-vnpy-vs-qlib-a-deep-comparison-of-python-quant-backtesting-frameworks-2026-3gjl))
- 2024~2026년 방법론이 전통 계량경제 모델에서 Transformer·하이브리드 딥러닝 프레임워크로 뚜렷이 전환 — 자산가격결정·변동성 예측·신용리스크 전반에서 예측력 개선 보고 ([arxiv.org](https://arxiv.org/pdf/2511.21588))
- 퀀트 전략의 자산군이 사모주식·사모신용·부동산 등 비정형 데이터 기반 프라이빗 자산으로 확장 중 ([informaconnect.com](https://informaconnect.com/quantminds-international/article/quant-investing-in-2026-whats-driving-the-industry-forward/))
- 실무 컨센서스: LLM은 대체데이터 파싱·리서치 생산성 가속에는 검증됐지만, 낮은 신호대잡음비·비정상성·규제 투명성 요건 때문에 end-to-end 자동 트레이딩은 프로덕션 수준 미달 — 인간 판단 결합이 여전히 베스트프랙티스 ([quantt.co.uk](https://www.quantt.co.uk/resources/ai-revolution-in-quant-trading-2026))

## quant-mathematician
- **DSR·PBO가 AI 생성 전략 평가의 사실상 표준으로 굳어짐**: 시행 횟수(effective number of trials)·왜도·첨도를 반영한 Deflated Sharpe Ratio 보정 없이는 다중검정으로 가짜 전략 발견이 수학적으로 보장된다는 점이 2026년 연구들에서 재확인 (pm-research.com, arxiv.org)
- **scikit-learn 호환 `purged-cross-validation` 라이브러리 등장**: purging·embargo·CPCV 경로 재구성·PSR/DSR·최소 트랙레코드 길이(MinTRL)를 GridSearchCV/Pipeline에 바로 꽂아 쓰는 구현이 공개되어 CPCV 실무 진입장벽이 크게 낮아짐 (github.com/eslazarev)
- **Conformal Kelly (2026.8, arXiv:2608.01494)**: conformal prediction의 분포무가정·유한표본 커버리지 보장 구간을 fractional Kelly의 스케일 인자로 쓰는 사이징 기법이 제안됨 — 점추정 edge 대신 구간 불확실성으로 베팅 비율을 조절 (arxiv.org)
- **'구현 리스크(Implementation Risk)'가 새 오차원으로 정량화됨 (arXiv:2603.20319)**: 동일 전략도 백테스트 코드 구현 선택에 따라 성과가 갈리는 오차를 측정한 연구와, 학술 전략의 90% 이상이 실자본 투입 시 실패(집계 p=0.34)했다는 정직한 검증 프로토콜 보고가 나옴 (arxiv.org)
- **과적합 방지를 목적함수에 내장하는 흐름**: 사후 DSR 보정 대신 GT-Score(Golden Ticket Score)처럼 anti-overfitting 페널티를 최적화 목표 자체에 심는 접근이 2026년 arXiv에서 확산 중 (arxiv.org)
- **드로다운 제약 Kelly가 실무 표준 시퀀스로 정리됨**: raw edge 추정 → base-rate 수축 → 레짐 스트레스 변동성 → raw Kelly → 드로다운 확률 제약·캡 적용의 순서화된 파이프라인과 VIX 레짐 스케일링 하이브리드 사이징 연구가 주목받음 (arxiv.org, atlaspeakresearch.com)

Sources: [pm-research.com](https://www.pm-research.com/content/iijpormgmt/40/5/94) · [arXiv 2608.01494](https://arxiv.org/html/2608.01494) · [arXiv 2603.20319](https://arxiv.org/html/2603.20319) · [arXiv 2604.18821](https://arxiv.org/pdf/2604.18821) · [github.com/eslazarev/purged-cross-validation](https://github.com/eslazarev/purged-cross-validation) · [arXiv 2508.16598](https://arxiv.org/html/2508.16598v1)

## risk-manager
You've reached your Fable 5 limit. Run /usage-credits to continue or switch models with /model.

## trader
- 나스닥·NYSE의 23×5 "글로벌 트레이딩 아워"가 2026년 SEC 승인(4/10)을 받아 Q3부터 시행되며, DTCC도 24/5 청산으로 전환 중 — 야간 세션의 얇은 유동성·스프레드 확대를 감안한 별도 사이징·주문(지정가 위주) 규칙이 필수 (arnoldporter.com, nyse.com, nasdaq.com)
- 실행 비용 관리의 표준은 TCA(사전 추정→사후 귀속) + Implementation Shortfall 계열 알고로 이동, 슬리피지·시장충격은 선형이 아닌 2차(quadratic) 함수로 모델링하고 백테스트에 왕복 0.1~0.3% 비용을 반영하는 것이 권장 관행 (talos.com, quantifiedstrategies.com)
- LLM 기반 "AI 트레이딩 에이전트"는 리서치·필터링·알림까지만 맡기고 실행은 사전 검증된 룰베이스 자동화+리스크 파라미터로 분리하는 워크플로가 정착 — 감사 불가한 트레이드 단위 의사결정과 동일 모델·프롬프트로 인한 군집 매매가 핵심 리스크 (bitsgap.com, brokeranalysis.com)
- 리테일 리스크 관리는 4계층 체계(트레이드당 1% 사이징 → 무효화 지점 하드 스톱 → 일 3%/주 5~6% 손실 한도 → 단계별 드로다운 복구 프로토콜)가 사실상 표준이며, ATR 기반 사이저·계좌 서킷브레이커 EA 등 무료~저가 도구가 보편화 (tradealgo.com, tradezella.com)
- 온체인 무기한선물이 급성장해 DEX 점유율 10%대(월 $739B, 1월 기준), Hyperliquid이 섹터 OI의 약 2/3를 차지하고 HIP-3로 금·원유·S&P500 등 토큰화 자산까지 24/7 거래 확대 — 청산 엔진·펀딩·오라클 리스크가 새 실행 변수 (datawallet.com, blockeden.xyz, atomicwallet.io)
- 라이브 전환 시 의도 자본의 10~20%로 시작하고 최소 1개월 페이퍼 트레이딩을 병행해 슬리피지·지연으로 인한 백테스트 대비 괴리를 실측 검증하는 것이 배포 베스트프랙티스 (quantvps.com, quantstart.com)

Sources: [Arnold & Porter — SEC approves Nasdaq extended hours](https://www.arnoldporter.com/en/perspectives/advisories/2026/04/sec-approves-nasdaq-proposal-to-expand-trading-hours), [NYSE Extended-Hours FAQ](https://www.nyse.com/publicdocs/nyse/NYSE_Extended_Hours_Trading_FAQ.pdf), [Nasdaq — Road to 24-Hour Trading](https://www.nasdaq.com/newsroom/nasdaqs-view-road-24-hour-trading), [Talos — TCA & Slippage](https://www.talos.com/insights/execution-insights-through-transaction-cost-analysis-tca-benchmarks-and-slippage), [QuantifiedStrategies — Algo Trading 2026](https://www.quantifiedstrategies.com/algorithmic-trading-strategies/), [Bitsgap — AI Agents vs Bots 2026](https://bitsgap.com/blog/ai-trading-agents-vs-trading-bots-in-2026-why-smarter-isnt-safer), [BrokerAnalysis — AI-Agentic Trading Layers](https://brokeranalysis.com/blog/ai-agentic-autonomous-trading-layers-2026-complete-review/), [TradeAlgo — Risk Tools 2026](https://www.tradealgo.com/trading-guides/tools/best-risk-management-tools-for-traders-in-2026-calculators-journals-and-position-sizers), [TradeZella — Risk Management Guide](https://www.tradezella.com/blog/risk-management-trading), [Datawallet — Perp Futures Stats](https://www.datawallet.com/crypto/crypto-perpetual-futures-statistics), [BlockEden — DEX Perp Market Share](https://blockeden.xyz/blog/2026/03/07/dex-perpetuals-market-share-growth/), [AtomicWallet — Perp DEXs 2026](https://atomicwallet.io/academy/articles/perpetual-dexs-2026), [QuantVPS — Algo Setup Guide](https://www.quantvps.com/blog/how-to-set-up-algorithmic-trading)

## trader-analyst
2026-08-08 기준, trader-analyst 분야 최신 핵심:

- **매크로 "고금리 장기화(higher-for-longer)"가 핵심 변수** — 연준 기준금리 3.50~3.75% 유지, 끈적한 인플레·유가 상승으로 완화 지연. NFP·CPI·잭슨홀·QT 종료 여부가 8월 리스크자산 방향타. (coinidol.com, coinbase.com)
- **ETF 자금 흐름이 BTC·ETH 수급의 지배적 요인으로 부상** — 美 상장 ETF가 신규 발행량의 100% 이상을 흡수하는 구도, 2025년 유입 $230억. 온체인보다 ETF 순유입 추적이 우선 지표. (21shares.com, theblock.co)
- **규제 명확화가 실질 촉매** — 美 CLARITY Act 상원 최종표결, 스테이블코인 GENIUS Act 최종 시행규칙(2026 중반), 스테이블코인 유통량 $1조 돌파 전망 → 결제·송금·트레저리 내러티브. (qz.com, coinbase.com)
- **AI 트레이딩 '에이전트'로 진화** — 단순 챗봇 아닌 가설 생성→실데이터 로드→통계검증→진입·손절·익절가 산출까지 자동화. 헤지펀드는 리서치·알파·실행·컴플라이언스에 에이전트 도입. (varrd.com, pragmaticcoders.com)
- **퀀트 플랫폼 접근성 확대** — QuantConnect·Composer·Alpaca·Portfolio123 등으로 백테스트·시스템매매 대중화. 다만 '로직 이해 후 사용·과장 수익 약속 회피'가 베스트프랙티스로 강조됨. (wallstreetzen.com, ambcrypto.com)
- **BTC 단기 구조** — $63,850 위에서 구성적이나 $65,000 확정 돌파가 상방 전환 조건, 총 시총 약 $2.29조로 구조적 통합 국면. (coinidol.com, analyticsinsight.net)
