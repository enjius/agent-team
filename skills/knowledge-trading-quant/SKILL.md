---
name: knowledge-trading-quant
description: 트레이딩·퀀트·투자 최신 지식 — 시장동향, 전략, 리스크, 핀테크. 금융 역할이 작업 전 참고 (갱신: 2026-08-30)
---

# trading-quant 도메인 지식 (2026-08-30)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 시장동향·매크로
- 연준(Warsh 의장)이 인플레 재점화·고용 강세로 매파 전환 — 9월 인하 확률 32.6%까지 하락, 오히려 금리 인상 가능성이 논의되는 국면 (cnbc.com)
- S&P 500은 7,700선 안팎에서 등락 중이며, JP모건은 2026년 목표 7,500(연준 인하 지속 시 8,000+) 제시 (finance.yahoo.com)
- 미 국채 40조 달러 돌파 속 장기물 매도세 — 재무부가 10~30년물 유동성 지원 바이백을 2배 이상 확대해 금리 상단 방어 (cnbc.com)
- 금은 8월 한 달 +15%로 1999년 이후 최대 월간 상승, $4,500 돌파 후 $4,450대 조정 — 부채 우려·약달러가 수요 견인 (tradingeconomics.com, dailyforex.com)
- 달러 인덱스는 8월 -0.8%로 약세, 금·비달러 자산의 상대 매력 상승 (cnbc.com)
- 2분기 실적 호조와 AI 관련 디레버리징 마무리 기대가 하반기 증시의 핵심 지지 요인 (forbes.com)

## 퀀트 전략·AI/ML
- 정적(static) 팩터 모델에서 벗어나 시장 레짐 변화에 실시간 적응하는 '다이나믹 퀀트'가 업계 표준으로 이동 (rebellionresearch.com)
- 뉴스·공시·어닝콜·소셜 등 비정형 데이터에서 ML로 시그널·팩터를 생성하는 방식이 알파 발굴의 중심 (jagadishwrites.com)
- HFT가 미국 주식 거래량의 약 72~78%를 차지하고 주요 금융기관의 75%가 AI 시스템을 배치 — ML은 실험이 아닌 시장 인프라화 (aisuperior.com)
- LLM 기반 '알파 마이닝' 연구가 급증 — AlphaAgent(KDD), AlphaCrafter, QRAFTI 등 팩터 생성→레짐 인식 선택→적응적 트레이딩을 묶은 멀티에이전트 프레임워크 등장 (arxiv.org, dl.acm.org)
- 오픈소스 TradingAgents가 v0.3.1(2026-07)로 갱신, Claude Sonnet 5 등 멀티 LLM 프로바이더 지원 (github.com/TauricResearch)
- 학계·업계 공통 결론: LLM 에이전트는 아직 '감독하의 리서치 어시스턴트'이며 완전 자율 매매 주체로 보기 어려움 (arxiv.org)
- 최고 성과 조합은 금융 이론+엄격한 리스크 통제+인간 전문성에 AI 패턴인식을 얹는 하이브리드 접근 (rebellionresearch.com)

## 헤지펀드·리스크 관리
- 3월 변동성 장에서 Big4(시타델·밀레니엄·포인트72·발야스니)가 동시 드로다운(BAM -4.3%, ExodusPoint -4.5%) — 포드샵 포지션 쏠림(crowding) 리스크 노출 (hedgeco.net)
- 4월 랠리에서 멀티스트랫 대형사가 급반등, 스톡피킹 펀드는 2016년 이후 최고 월간 성과 (hedgeco.net)
- 멀티스트랫 평균 총 레버리지 444%(2025-11) — 비용과 레버리지가 이 모델의 핵심 리스크로 지목 (longangle.com)
- 밀레니엄식 하드 리밋(약 7.5% 드로다운 시 포드 자동 청산) 등 중앙집중 리스크 통제+분산 운용팀 구조가 업계 지배적 모델 (hedgefundinterview.com)
- 5년(~2025) 기준 멀티스트랫 샤프 2.83 vs 주식 0.53 — 자금이 계속 플랫폼형으로 집중되는 근거 (longangle.com)
- 성과 기반 실시간 포드 간 자본 재배분과 15~20% 포드 성과보수 구조가 표준화 (hedgefundinterview.com)

## 디지털자산·규제
- GENIUS법(2025-07 제정) 시행 규칙 마감이 2026-07-18 — Fed·FDIC·OCC·FinCEN·OFAC 동시 룰메이킹으로 스테이블코인이 제도권 결제 인프라로 편입 중 (brookings.edu)
- CLARITY법이 디지털 상품 현물시장을 CFTC 전속 관할로 정리 — SEC/CFTC 경계 확정 시 글로벌 규제 경쟁 촉발 전망 (elliptic.co)
- 비트코인 ETF 주간 순유입 $8.5억(4월 중순 이후 최대), BlackRock IBIT 독주 — 반면 소형·니치 ETF는 청산 진행(해시덱스 DEFI 8/17 상장폐지) (cryptonomist.ch, coincall.com)
- 비트코인 변동성이 사이클 저점 — '고변동 투기자산'에서 기관 포트폴리오 자산으로 성격 전환 (coincall.com)
- 토큰화 자산 시장 $250억 규모(2020 대비 245배) — 국채·PE·부동산 펀드의 토큰화가 SEC 면제 신청 등 실무 단계 진입 (investing.com, paulhastings.com)
- Grayscale 등은 2026년을 '기관 시대의 개막'으로 규정 — 어드바이저 채널·기관 자금의 구조적 유입 전망 (research.grayscale.com)

## 프리딕션 마켓·신흥 자산군
- 프리딕션 마켓 월간 거래량이 2025-09 $50억 미만에서 2026-04 약 $240억으로 급성장, 연간 $3,250억 페이스 (trmlabs.com, falconx.io)
- Kalshi가 월 거래량 $95억으로 Polymarket($33억)을 앞서나 오픈이자는 양사 약 $4억으로 백중세 (insights4.vc)
- ICE/NYSE가 Polymarket에 최대 $20억 전략 투자($80억 밸류) — 제도권 편입 신호 (trmlabs.com)
- CFTC가 Polymarket의 미국 내 브로커리지·고객 직접 온보딩 승인(2025-11), Robinhood는 Kalshi 연동으로 2,700만 계좌에 프리딕션 허브 제공 (falconx.io)
- 2026 월드컵이 스포츠 이벤트 기반 거래량의 대형 촉매로 작동 — 스포츠·매크로 이벤트가 주력 카테고리 (sportico.com)

## 핀테크·자산관리
- AI 증강 어드바이저 모델 확산 — AI가 프로스펙팅·포트폴리오 설계·리밸런싱을 맡고 인간은 고관여 의사결정에 집중 (vestmark.com)
- 금융기관 52%가 생성형 AI 사용 중, 웰스매니지먼트사 95%가 AI 투자 확대 계획 (nextmsc.com)
- 로보어드바이저가 리테일을 넘어 기관 데스크의 리밸런싱·세금손실수확(tax-loss harvesting) 자동화로 확장 (bdo.com)
- Coinbase가 수수료 무료 주식거래+로보어드바이저를 붙여 '에브리싱 익스체인지'로 확장 — 브로커리지·거래소·크립토 경계 붕괴 (investing.com)
- 부동산 등 대체자산의 토큰화 소액분할($1,000 단위)로 리테일 접근성 확대 (innreg.com)
- 은행의 'Wealth-management-as-a-Service' 상품화가 새 수익모델로 부상 (vestmark.com)

## 퀀트 도구·인프라
- awesome-quant(wilsonfreitas)가 여전히 퀀트 라이브러리 탐색의 표준 큐레이션 리스트 (github.com)
- QuantConnect Lean 엔진이 로컬 배포 가능한 오픈소스 풀 파이프라인으로 클라우드 비종속 퀀트에게 선호됨 (backtrex.com)
- Backtrader의 cloudQuant 포크가 AI 지원 전략 툴링을 얹어 활발히 유지보수 중 — 원본 정체의 대안 (backtrex.com)
- zipline-reloaded는 주식 전략용으로 건재, Blankly는 백테스트→페이퍼→라이브 배포 통합형으로 주목 (github.com)
- LLM 에이전트 기반 리서치 프레임워크(TradingAgents, FundaPod 등)가 백테스팅 스택 위의 새 레이어로 편입되는 추세 (github.com, arxiv.org)
- 옵션 전용 리서치·백테스트 라이브러리 등 자산군 특화 도구의 세분화 진행 (github.com)
