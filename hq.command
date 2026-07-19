#!/bin/bash
# 더블클릭하면: 최신 코드 받고 → 설치 → 라이브 본부 서버 시작 (localhost:7788)
cd "$(dirname "$0")" || exit 1
echo "▶ 최신 코드 받는 중..."
git pull origin main 2>/dev/null || true
echo "▶ 설치/갱신 중..."
./agent-team.sh install >/dev/null 2>&1 || true
echo "▶ 본부 서버 시작 (브라우저가 자동으로 열립니다)"
exec ./agent-team.sh serve
