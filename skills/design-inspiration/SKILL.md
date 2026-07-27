---
name: design-inspiration
description: 사용자가 원하는 스타일을 말하면 Pinterest(kr.pinterest.com)에서 자동으로 레퍼런스를 찾아 그 스타일대로 디자인한다. 앱 화면·UI 시안·디자인시스템·비주얼 작업 시 반드시 사용. 사용자가 URL을 주지 않아도 스스로 검색한다.
---

# Design Inspiration — "스타일만 말하면 Pinterest 찾아서 그대로 디자인" (자동)

**원칙: 사용자는 스타일만 말한다. 에이전트가 알아서 Pinterest를 찾고 반영한다. URL 요청 금지(없어도 스스로 검색).**

## 입력 해석
사용자 말("미니멀한 핀테크 홈", "파스텔 톤 온보딩", "다크모드 트레이딩 대시보드")을 **영문 검색 키워드 2~4개**로 변환.
예: `fintech app home minimal UI`, `pastel onboarding mobile`, `dark trading dashboard UI`.

## 2단계 자동 레퍼런스 수집

### Tier 1 — 검색 기반 (항상 실행, 로그인 불필요)
1. `WebSearch`로 `site:kr.pinterest.com <키워드>` 및 `site:pinterest.com <키워드>` 검색.
2. 상위 핀 5~10개의 제목·설명·연관검색어에서 스타일 신호(무드·컬러·레이아웃 용어) 수집.
3. 막히면 `site:dribbble.com` / `site:behance.net` 폴백.

### Tier 2 — 비전 기반 (가능하면 실행, 진짜 이미지 보고 매칭)
Bash + 브라우저(Playwright/Chromium)가 있으면 실제 핀 이미지를 캡처해 눈으로 분석:
```
python3 - "<키워드>" <<'PY'
import sys, asyncio
from playwright.async_api import async_playwright
q=sys.argv[1].replace(' ','%20')
async def run():
    async with async_playwright() as p:
        b=await p.chromium.launch()
        pg=await b.new_page(viewport={'width':1280,'height':1600})
        await pg.goto(f"https://kr.pinterest.com/search/pins/?q={q}", wait_until="networkidle", timeout=45000)
        await pg.wait_for_timeout(3000)
        await pg.screenshot(path="/tmp/pin_refs.png", full_page=False)
        await b.close()
asyncio.run(run())
PY
```
→ 생성된 `/tmp/pin_refs.png` 를 Read로 열어 **비전으로 팔레트·레이아웃·컴포넌트 스타일**을 분석.
→ 로그인월·봇차단으로 빈 화면이면 Tier 1 결과만 사용(정직하게 알림).

## 산출
1. **무드보드 표**: `소스(핀 URL) + 차용 요소(레이아웃/컬러 HEX/타이포/컴포넌트)`.
2. 그 방향으로 디자인 산출: 컬러토큰·타이포·컴포넌트 스펙·화면 시안 설명. `canvas-design`·`brand-guidelines`·`theme-factory` 스킬과 연계해 실제 시안/아티팩트 생성.
3. 핀 URL을 함께 제시해 사용자가 눈으로 확인 가능하게.

## 원칙
- **참고이지 복제 금지**: 무드·패턴·방향만 차용(저작권·상표).
- 접근성(대비 4.5:1·터치타깃)·브랜드 정합은 레퍼런스보다 우선.
- Tier 2가 막히면 숨기지 말고 "이미지 직접 열람 실패 → 검색 기반으로 진행"이라고 밝힌다.
