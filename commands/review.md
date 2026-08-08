---
description: [review] 코드/PR 리뷰 — code-reviewer+security-reviewer가 정확성·보안·컨벤션 점검
---
code-reviewer(및 필요시 security-reviewer, flutter-code-reviewer)에게 아래 대상(변경/파일/PR)의 리뷰를 맡겨. 여러 리뷰어를 쓸 때는 서로의 결과를 보지 않고 **각자 독립으로** 보게 한 뒤 결과를 통합·중복 제거해.

관점: 버그·널안정성·경쟁상태·리소스누수·보안(입력검증/시크릿/권한)·컨벤션. 파일:라인 근거 + 수정 제안, 차단(blocker)/개선(nit) 구분.

판정 규칙: blocker가 하나라도 남아 있으면 "승인 불가"로 보고한다. 리뷰어가 확신 없는 지적은 추정(unverified)으로 표기해 blocker와 섞지 않는다. 코드를 작성한 에이전트가 자기 코드를 리뷰(셀프 승인)하는 것 금지.

대상: $ARGUMENTS
