---
name: knowledge-legal-ops
description: 법무·컴플라이언스·운영 최신 지식 — 규제, 약관, 문서화, CS. 법무·운영 역할이 작업 전 참고 (갱신: 2026-08-08)
---

# legal-ops 도메인 지식 (2026-08-08)

> 역할별 에이전트 KNOWLEDGE 블록을 도메인 단위로 통합한 지식 베이스.
> `agent-team learn --domains` 가 이 파일을 통째로 갱신한다.

## doc-writer
- AI가 문서 초안을 기본으로 작성하고 사람은 검수·구조화에 집중하는 "AI 초안 → 휴먼 리뷰" 워크플로가 2026년 표준으로 정착 (document360.com)
- Docs-as-code가 개발자 문서의 기본 운영 모델이 됨 — 2025 Q4 테크니컬라이터 채용공고의 63%가 Git 필수 요건 명시(2022년 10% 미만 대비 급증) (gitbook.com)
- AI 에이전트용 문서 표준 llms.txt는 5KB 이하·10~50개 큐레이션 링크가 베스트프랙티스로 굳어졌고, 전문 병합본 llms-full.txt가 2배 이상 더 자주 조회됨 (mintlify.com, buildwithfern.com)
- RAG·에이전트 친화 문서 작성법 확산: 각 헤딩 아래 독립적으로 검색돼도 완결되는 단락 구성, `<llms-ignore>` 태그로 마케팅 문구를 AI에게서 숨기는 기법 등장 (buildwithfern.com, mintlify.com)
- MCP 서버로 문서 시스템을 API·앱과 연결해 가이드를 실시간 자동 생성·갱신하는 "셀프 업데이트 문서"가 부상 — 2026년 개발자 75%가 MCP 활용 전망 (document360.com)
- API 문서는 OpenAPI 스키마에 현실적인 예시 응답을 포함하는 것이 중요해짐 — AI 코딩 어시스턴트가 이를 근거로 파싱 코드를 생성하기 때문 (buildwithfern.com)

Sources: [Document360 — Technical Writing Trends 2026](https://document360.com/blog/technical-writing-trends/) · [Document360 — AI Documentation Trends](https://document360.com/blog/ai-documentation-trends/) · [GitBook — Best technical documentation tools](https://www.gitbook.com/blog/best-technical-documentation-tools) · [Mintlify — Context for agents](https://www.mintlify.com/blog/context-for-agents) · [Fern — llms.txt Guide](https://buildwithfern.com/post/optimizing-api-docs-ai-agents-llms-txt-guide) · [Fern — LLM-friendly docs](https://buildwithfern.com/post/how-to-write-llm-friendly-documentation)

## legal-compliance
- **개인정보보호법 개정법 2026-09-11 시행 임박**: CEO를 개인정보 보호 최종책임자로 명시하고 CPO에 전문인력·예산·이사회 보고 의무 부과 — 시행 전 내부 거버넌스 체계 정비 필요 (kimchang.com, exosp.com)
- **AI기본법(2026-01-22 시행) 집행 본격화**: 채용·대출심사·의료 등 '고영향 AI'는 위험·영향평가와 문서화, 생성형 AI는 표시 의무 대상이며 시정명령 불이행 시 과태료 최대 3천만 원 (shinkim.com, help-me.kr)
- **EU AI Act 고위험 의무(8/2 기점) 유예 확정 흐름**: 2026-06 유럽의회가 Digital Omnibus로 고위험 AI 의무를 12~16개월 연기 승인했으나 법제 마무리 전까지는 8월 기한 기준으로 대비하라는 게 로펌 컨센서스 (hklaw.com, dlapiper.com, deloitte.com)
- **다크패턴 규제 집행 강화 국면**: 개정 전자상거래법의 6대 기만설계 금지(숨은 갱신·취소 방해 등)와 정기결제 증액·유료전환 30일 전 사전동의 의무 위반 제재가 늘고, 공정위가 2026년 과징금 상향 개정안 발의 예고 (lawtimes.co.kr, kimchang.com)
- **가상자산 2단계 입법·원화 스테이블코인 규제 진행 중**: 지급결제형·증권형·유틸리티형 분류 체계 도입과 스테이블코인 발행 인가 요건이 핵심으로, 핀테크·결제 서비스는 입법 방향 모니터링 필수 (lawtimes.co.kr, sedaily.com)
- **AI 학습데이터 저작권 리스크 기준 구체화**: 미국 판례상 합법 구매 자료 학습은 공정이용 인정, 불법 복제물 학습은 불인정으로 갈려 학습데이터 출처 증빙·라이선스 계약 체계가 실무 베스트프랙티스로 정착 (weekly.khan.co.kr, hwawoo.com)

Sources: [Kim & Chang — 2026 개인정보위 업무계획](https://www.kimchang.com/ko/insights/detail.kc?sch_section=4&idx=33715), [Exosphere — 2026 개인정보보호법 개정](https://exosp.com/blog/2026-personal-information-protection-act), [Shin & Kim — AI기본법 시행 시사점](https://www.shinkim.com/kor/media/newsletter/3114), [헬프미 — AI기본법 사업자 의무](https://www.help-me.kr/blog/article/korea-ai-act-2026-compliance-guide/), [Holland & Knight — EU AI Act 2026-08 기한](https://www.hklaw.com/en/insights/publications/2026/04/us-companies-face-eu-ai-acts-possible-august-2026-compliance-deadline), [DLA Piper — Digital AI Omnibus 유예](https://knowledge.dlapiper.com/dlapiperknowledge/globalemploymentlatestdevelopments/2026/The-Digital-AI-Omnibus-Proposed-deferral-of-high-risk-AI-obligations-under-the-AI-Act), [법률신문 — 전자상거래법 집행 전망](https://www.lawtimes.co.kr/news/articleView.html?idxno=215573), [Kim & Chang — 다크패턴 전자상거래법 개정](https://www.kimchang.com/ko/insights/detail.kc?sch_section=4&idx=29766), [법률신문 — 2026 가상자산 10대 이슈](https://www.lawtimes.co.kr/news/articleView.html?idxno=215219), [서울경제 — 스테이블코인 2단계 입법](https://www.sedaily.com/article/20015028), [주간경향 — AI 학습 저작권 판결](https://weekly.khan.co.kr/article/202507140600031), [화우 — AI 해외 기업 이슈 뉴스레터](https://www.hwawoo.com/kor/insights/newsletter/14664)

## support-ops
- AI 에이전트가 티어1 문의를 자율 해결하고 인간 상담원은 복잡·공감형 케이스에 집중하는 하이브리드 운영이 2026년 표준 — 세션 간 맥락을 기억하는 "메모리형 AI"와 감정분석·자동 요약이 기본기로 자리잡음 (freshworks.com, zendesk.com, crescendo.ai)
- 해결 건당 과금(Intercom Fin $0.99/resolution 등) 성과 기반 프라이싱이 확산 — AI 상담 도구 도입 시 좌석 수가 아닌 "해결률(~51% 벤치마크)" 기준으로 ROI를 산정하는 것이 베스트프랙티스 (fin.ai, myaskai.com)
- 지식베이스는 AI 학습 소스로 격상 — 티켓 데이터 기반 콘텐츠 갭 자동 감지(Zendesk content cues), FAQ를 AI가 읽기 좋은 구조로 유지하고 민감 질의는 고신뢰 스크립트 답변(Custom Answers)으로 분리하는 운영이 권장됨 (zendesk.com, usefini.com)
- 장애 대응 플레이북은 "무엇을 평가하라"가 아니라 "어느 대시보드를 열어 어떤 값을 채널에 붙여라" 수준의 구체성 + 조사 담당/인시던트 지휘 역할 분리 + 마지막 사용·리뷰 일자 추적이 2026년 핵심 원칙 (oneuptime.com, clickup.com)
- 플레이북은 문서가 아니라 훈련 대상 — 실전 압박 상황에서 연습하지 않은 플랜은 실패하며, AI 시대 위협 시나리오를 반영해 사후 리뷰(post-incident review) 때마다 갱신하는 주기적 테스트가 필수 (cm-alliance.com, ir-os.com)
- 고객 데이터 프라이버시가 지원 운영의 차별화 요소 — LLM이 민감 데이터를 보존하지 않도록 하는 프로그램, 자체 인프라에 데이터를 두는 도메인 특화 모델 운영이 선도 조직의 표준 (text.com, salesforce.com)

Sources: [Freshworks](https://www.freshworks.com/customer-service/trends/), [Zendesk](https://www.zendesk.com/blog/ai/productivity/ai-customer-service-statistics/), [Crescendo](https://www.crescendo.ai/blog/emerging-trends-in-customer-service), [Fin.ai](https://fin.ai/learn/ai-knowledge-base), [MyAskAI](https://myaskai.com/blog/intercom-fin-ai-agent-complete-guide-2026), [Fini Labs](https://www.usefini.com/guides/ai-knowledge-base-self-service-agent-support), [OneUptime](https://oneuptime.com/blog/post/2026-01-27-incident-response-playbooks/view), [ClickUp](https://clickup.com/blog/how-to-build-an-incident-response-playbook/), [CM Alliance](https://www.cm-alliance.com/cybersecurity-blog/cyber-incident-response-playbook-examples-for-2026), [IR-OS](https://ir-os.com/articles/incident-response-playbook), [Text.com](https://www.text.com/blog/future-of-ai-in-customer-support/), [Salesforce](https://www.salesforce.com/service/customer-service-trends/)
