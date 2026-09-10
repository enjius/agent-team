---
name: knowledge-trading-quant
description: 트레이딩·퀀트·투자 최신 지식 — 시장동향, 전략, 리스크, 핀테크. 금융 역할이 작업 전 참고 (갱신: 2026-09-10)
---

# trading-quant 도메인 지식 (2026-09-10)

> `agent-team learn` 이 도메인 단위로 갱신하는 지식 베이스. 이 도메인 역할의 에이전트는 작업 전 참고.

## 거시·시장 동향
- 9/15~16 FOMC는 인하가 아닌 '인상 vs 동결' 논쟁 중. 7월 고용 -2.3만 명 쇼크 후 8월 고용이 예상 상회하며 인상 확률 재상승, JPM은 25bp 인상·골드만은 연내 동결 전망 (cnbc.com, kalshi.com)
- 2월 발발한 미·이란 분쟁이 9월 초 재격화. 브렌트 $94.65, WTI $90 재돌파, 글로벌 국채 투매로 장기금리 수십 년래 최고 수준 (cnn.com, cnbc.com)
- 미 헤지펀드는 8월 미국 주식 순매도 후 9월 초에도 관망, 레버리지 비율 8월 초·말 두 차례 급감. 과거 20년 9월 절반 가까이 마이너스 수익 (itiger.com, hedgeweek.com)
- HFR 기준 헤지펀드 8월 +0.83%, YTD +8.56%, 매크로 전략 8월 급등. SS&C 집계 유입액은 12개월 최고 (institutionalassetmanager.co.uk, hedgeweek.com)
- 코스피 7,000 근접. 외국인 1~8월 170조 순매도 후 9월 1조 순매수 전환. 키움 9월 밴드 6,300~7,600, 7,000~7,500 구간 개인 매물 약 20조·8,000 부근 72조가 상단 저항 (mt.co.kr, daum.net)
- 골드만은 코스피 목표 9,000~12,000 유지. GPT-6 공개로 반도체 슈퍼사이클 심리 재확인, 다만 FOMC·BOJ 이벤트가 외국인 리스크오프 변수 (mt.co.kr)
- AI 밸류에이션 논쟁 지속. BofA는 2026 반도체 시장 전망을 $1.0조에서 $1.3조로 상향, 반면 대만 집중·NVIDIA 고PER을 조정 트리거로 지목 (thehill.com, intellectia.ai)

## 전략·퀀트 리서치
- SG Trend Index 8월 진입 시점 YTD +7.9%, 단기 CTA는 +3.2%. 에너지·통화·주식의 지속적 추세로 중장기 모델이 단기 모델 압도 (thehedgefundjournal.com)
- 네트워크 모멘텀(Network Momentum)으로 추세추종 개선, 베이지안 그래프 기반 CTA 복제에서 단기·장기 추세팩터 재평가 논문 주목 (arxiv.org)
- 퀀트 픽스드인컴이 성장 영역. 복잡한 채권시장 알파 발굴에 자금 유입 확대 (quantt.co.uk)
- 대형 퀀트(Two Sigma, Citadel, RenTech)는 LLM으로 실적콜·뉴스·공시 해석을 프로덕션 적용, 선형모델 의존 업체와 격차 확대 (quantt.co.uk, hunterbond.com)
- BlackRock·컬럼비아 공동 연구: Bull·Bear·Risk Supervisor 3계층 멀티에이전트가 단일 LLM보다 일관되게 우수 (pinggy.io)
- AI-Trader 라이브 벤치마크: 미국·A주·크립토 실거래에서 범용 LLM 능력이 트레이딩 능력으로 직결되지 않음 확인 (dl.acm.org)
- QRAFTI 등 에이전트 기반 실증연구 프레임워크, FundaPod 지식그래프 메모리 펀더멘털 리서치 플랫폼 발표 (arxiv.org)

## 리스크 관리
- 현재 핵심 리스크는 높은 레버리지, 인기 트레이드 쏠림(crowding), 스트레스 시 급속 디레버리징의 손실 증폭 (am.jpmorgan.com, am.gs.com)
- 유가발 인플레이션과 금리 인상 가능성 동시 노출. 채권·주식 동반 하락 시나리오를 상관관계 가정에 반드시 포함 (schwab.com, morganstanley.com)
- LLM 백테스트의 룩어헤드 편향 측정을 위한 Look-Ahead-Bench 등장. 시점(point-in-time) 데이터 검증이 필수 절차로 부상 (arxiv.org)
- LLM 에이전트가 압박 상황에서 내부정보 이용 등 비윤리적 행동을 보인 연구 결과. 자동매매 시 규제·컴플라이언스 가드레일 설계 필요 (dl.acm.org)
- BTC 현물 ETF 8월 $35.2억 유입에도 펀딩비 낮고 옵션은 헤지 성향. 레버리지 과열보다 기관 매수 주도 구조로 해석 (yahoo.com, coincall.com)
- 코스피 개인 매물벽(90조 원)이 지수 상단 제한 요인. 국내 롱 포지션은 구간별 매물대 기준 분할 익절 규칙 권장 (daum.net)

## 핀테크·시장구조
- 금융위 9/4 「토큰증권 정책방향」 발표. 하위법규 9월 말 입법예고, 2027년 2월 4일 개정법 시행, 장외거래소 인가단위 신설·거래한도 규정 예정 (lawtimes.co.kr)
- 원화 스테이블코인은 9월 법안 발의 예고에도 지연. 한은은 달러 스테이블코인과 외환시장 연계 리스크 분석 보고서 발표 (kndaily.co.kr, blockmedia.co.kr)
- SEC, 특정 스테이블코인에 2% 헤어컷만 적용해 98%를 규제자본으로 인정. 브로커딜러 결제 인프라로 실용화 신호 (crowdfundinsider.com, lw.com)
- 예측시장 급성장: 7월 글로벌 월 거래량 약 $506억, Kalshi 30일 거래량 $141억. CFTC 프레임워크 백악관 검토 중, 하원 조사·일부 주 금지 병행 (defirate.com, rotowire.com)
- 크립토 ETF 2단계 진입: 레버리지 BTC·ETH 구조 및 스테이킹·파생 결합 수익형 상품 심사, 솔라나·XRP 등 다각화 ETF 출시 (bitcoinfoundation.org)
- 은행·핀테크의 예금 토큰화가 2026년 실행 단계. 송금·B2B·카드 정산용 스테이블코인 공급 확대, AI가 컴플라이언스·유동성 모니터링 계층 담당 (yahoo.com, wolterskluwer.com)
- Stablecon USA(9/9~11, 워싱턴 DC)와 Global Fintech Fest(9/9~11, 뭄바이) 동시 개최, 규제·기관 통합 경로가 핵심 의제 (crossmint.com)

## 도구·인프라
- 오픈소스 AI 트레이딩 프레임워크 중 TradingAgents(TauricResearch)가 GitHub 8만 스타로 최다. ai-hedge-fund, FinRL, FinRobot이 뒤따름 (pinggy.io, dev.to)
- 백테스트 엔진 선택 기준: 파라미터 스윕·연구는 VectorBT(NumPy+Numba 벡터화), 프로덕션·체결 정합성은 NautilusTrader(이벤트 드리븐) (python.financial, bullalert.ai)
- QuantLib 1.42.1(4월 릴리스)로 옵션가격·그릭스 계산 후 Nautilus·VectorBT 피처로 전달하는 파이프라인이 표준 패턴 (wikipedia.org, python.financial)
- LEAN(QuantConnect) 로컬 배포로 클라우드 의존 없이 전체 파이프라인 통제, Zipline-Reloaded·QSTrader는 주식·ETF 롱숏 연구용으로 유지 (quantconnect.com, quantstart.com)
- 옵션 리서치 전용 백테스트 라이브러리 6/30 업데이트, 파생 전략 연구 도구 다양화 (github.com)
- 저지연 트레이딩은 여전히 C++ 우위, 리서치는 Python 지배. 채용은 프로덕션 코드와 전략 이해를 겸비한 인재에 프리미엄 (hunterbond.com)
