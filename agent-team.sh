#!/usr/bin/env bash
#
# agent-team.sh — Claude Code 에이전트 팀을 app 폴더로 꺼내와 운영/오케스트레이션
# ---------------------------------------------------------------------------
# macOS(zsh/bash) 로컬에서 실행. Tattoo/.claude/agents, ~/.claude/agents,
# rakwan/.claude/agents 등에 흩어진 서브에이전트 .md 를 하나의 app 폴더로 모아
# 그 팀을 Claude Code 로 호출·조율해 앱을 만들게 한다.
#
# 사용법:
#   ./agent-team.sh init    <APP_DIR>
#   ./agent-team.sh import  <APP_DIR> [--from DIR ]... [--force]
#   ./agent-team.sh list    <APP_DIR>
#   ./agent-team.sh run     <APP_DIR> "<작업 지시>" [--interactive] [--model M]
#   ./agent-team.sh console <APP_DIR>
#   ./agent-team.sh doctor
#
# 소스 폴더 기본값(순서대로 우선순위, 먼저 온 것이 우선):
#   $HOME/Tattoo/.claude/agents      (메인 팀)
#   $HOME/.claude/agents             (전역 팀 32명)
#   $HOME/rakwan/.claude/agents      (앱 제작 별동대 13명)
# 환경변수 AGENT_TEAM_SOURCES 로 콜론(:) 구분 재정의 가능.
# ---------------------------------------------------------------------------
# nounset(-u)는 macOS 기본 bash 3.2 에서 빈 배열 확장 시 오작동하므로 제외.
set -eo pipefail

# ── 스크립트/홈 위치 (git과 무관하게 Mac에서 독립 동작) ──────────────
# 심링크로 실행돼도 실제 스크립트 폴더를 찾도록 링크를 따라간다.
_resolve_self() {
  local src="${BASH_SOURCE[0]:-$0}"
  while [ -h "$src" ]; do
    local dir; dir="$(cd "$(dirname "$src")" && pwd)"
    src="$(readlink "$src")"; [ "${src:0:1}" = "/" ] || src="$dir/$src"
  done
  cd "$(dirname "$src")" && pwd
}
SCRIPT_DIR="$(_resolve_self)"
# AGENT_TEAM_HOME 로 라이브러리/팀팩/지식 위치를 재정의 가능(설치 위치 등).
# 기본은 스크립트 폴더 → 폴더째 어디로 복사해도 그대로 동작.
AGENT_TEAM_HOME="${AGENT_TEAM_HOME:-$SCRIPT_DIR}"
LIB_DIR="$AGENT_TEAM_HOME/library"
TEAMS_DIR="$AGENT_TEAM_HOME/teams"
KNOW_DIR="$AGENT_TEAM_HOME/knowledge"

# ── 색상 ────────────────────────────────────────────────────────────
if [ -t 1 ]; then
  C_RESET='\033[0m'; C_BOLD='\033[1m'; C_DIM='\033[2m'
  C_GREEN='\033[32m'; C_YELLOW='\033[33m'; C_BLUE='\033[34m'; C_RED='\033[31m'; C_CYAN='\033[36m'
else
  C_RESET=''; C_BOLD=''; C_DIM=''; C_GREEN=''; C_YELLOW=''; C_BLUE=''; C_RED=''; C_CYAN=''
fi

log()  { printf "%b\n" "$*"; }
info() { printf "%b\n" "${C_BLUE}▸${C_RESET} $*"; }
ok()   { printf "%b\n" "${C_GREEN}✔${C_RESET} $*"; }
warn() { printf "%b\n" "${C_YELLOW}⚠${C_RESET} $*" >&2; }
err()  { printf "%b\n" "${C_RED}x${C_RESET} $*" >&2; }
die()  { err "$*"; exit 1; }

# ── 기본 소스 폴더 ───────────────────────────────────────────────────
default_sources() {
  if [ -n "${AGENT_TEAM_SOURCES:-}" ]; then
    printf "%s\n" "$AGENT_TEAM_SOURCES" | tr ':' '\n'
  else
    printf "%s\n" \
      "$HOME/Tattoo/.claude/agents" \
      "$HOME/.claude/agents" \
      "$HOME/rakwan/.claude/agents"
  fi
}

# ── 경로 절대화 (macOS realpath 부재 대비) ───────────────────────────
abspath() {
  local p="$1"
  if [ -d "$p" ]; then ( cd "$p" && pwd ); else
    local d b; d=$(dirname "$p"); b=$(basename "$p")
    if [ -d "$d" ]; then printf "%s/%s" "$(cd "$d" && pwd)" "$b"; else printf "%s" "$p"; fi
  fi
}

# ── git 자동 커밋·푸시 (AGENT_TEAM_HOME 이 git 리포일 때만) ──────────
_autopush() {  # $1=commit message
  [ -d "$AGENT_TEAM_HOME/.git" ] || return 0
  ( cd "$AGENT_TEAM_HOME" || exit 0
    git add library teams 2>/dev/null || exit 0
    git diff --cached --quiet 2>/dev/null && exit 0
    git commit -q -m "${1:-chore: update agents}" 2>/dev/null || exit 0
    git push -q 2>/dev/null || true
  ) || true
}

# ── 프로젝트 실행 상태 기록/조회 ─────────────────────────────────────
_proj_status_write() {  # $1=projdir $2=state(running|done) $3=pid
  printf '{"state":"%s","pid":%s,"ts":"%s"}\n' "$2" "${3:-0}" "$(date +%Y%m%d-%H%M%S)" \
    > "$1/.claude/status.json" 2>/dev/null || true
}
# 프로젝트 상태 → working | done | idle 로 정규화
_proj_state() {  # $1=projdir
  local sf="$1/.claude/status.json"
  [ -f "$sf" ] || { echo idle; return; }
  local st pid
  st=$(grep -o '"state"[^,]*' "$sf" 2>/dev/null | sed 's/.*: *"//;s/"//' | head -1)
  pid=$(grep -o '"pid"[^,}]*' "$sf" 2>/dev/null | sed 's/.*: *//;s/[^0-9]//g' | head -1)
  if [ "$st" = "running" ]; then
    if [ -n "$pid" ] && [ "$pid" != "0" ] && kill -0 "$pid" 2>/dev/null; then echo working
    else echo done; fi   # running 인데 프로세스 죽음 → 완료(중단) 처리
  elif [ "$st" = "done" ]; then echo done
  else echo idle; fi
}

# ── 프론트매터 필드 추출 (name/description/model) ─────────────────────
# 첫 --- ... --- 블록에서 `key: value` 파싱. BSD/GNU awk 호환.
front_field() {
  local file="$1" key="$2"
  awk -v key="$key" '
    NR==1 && $0 !~ /^---[[:space:]]*$/ { exit }      # 프론트매터 없음
    NR==1 { infm=1; next }
    infm && /^---[[:space:]]*$/ { exit }
    infm {
      line=$0
      # "key: value" 매칭
      if (match(line, "^[[:space:]]*" key "[[:space:]]*:")) {
        sub("^[[:space:]]*" key "[[:space:]]*:[[:space:]]*", "", line)
        gsub(/^["\x27]|["\x27][[:space:]]*$/, "", line)   # 따옴표 제거
        gsub(/[[:space:]]+$/, "", line)
        print line
        exit
      }
    }
  ' "$file"
}

# ── 앱 폴더 유효성 ───────────────────────────────────────────────────
require_app_dir() {
  local app="$1"
  [ -n "$app" ] || die "APP_DIR 를 지정하세요."
  [ -d "$app" ] || die "폴더 없음: $app  (먼저 'init' 실행)"
  [ -d "$app/.claude/agents" ] || die "$app 는 에이전트 팀 앱이 아닙니다 (.claude/agents 없음). 'init' 먼저."
}

# ══════════════════════════════════════════════════════════════════════
# init — 앱 폴더 스캐폴딩
# ══════════════════════════════════════════════════════════════════════
cmd_init() {
  local app="${1:-}"
  [ -n "$app" ] || die "사용법: agent-team.sh init <APP_DIR>"
  mkdir -p "$app/.claude/agents" "$app/.claude/skills" "$app/logs"
  app=$(abspath "$app")

  if [ ! -f "$app/.claude/settings.json" ]; then
    cat > "$app/.claude/settings.json" <<'JSON'
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "permissions": {
    "defaultMode": "acceptEdits"
  }
}
JSON
  fi

  if [ ! -f "$app/CLAUDE.md" ]; then
    cat > "$app/CLAUDE.md" <<'MD'
# App Workspace — Agent Team

이 폴더는 Claude Code 에이전트 팀이 앱을 제작하는 작업 공간입니다.
`.claude/agents/` 에 팀 멤버(서브에이전트) 정의가 있습니다.

## 운영 원칙
- 복잡한 작업은 적절한 서브에이전트에게 위임(Agent 도구)해 병렬 처리한다.
- **모든 에이전트는 작업에 필요한 스킬을 자동으로 활용한다.** 사용 가능한 스킬(Skill 도구)이
  작업에 맞으면 직접 구현하기 전에 먼저 그 스킬을 사용한다. 프로젝트 스킬은 `.claude/skills/`,
  전역 스킬도 함께 노출된다.
- 팀에 필요한 전문가가 없으면 새 서브에이전트를 `.claude/agents/<역할>.md` 로 만들어 습득 후 위임한다.
- 팀 로스터는 `agent-team.sh list <이 폴더>` 로 확인. 실행 로그는 `logs/` 에 남는다.
MD
  fi

  cat > "$app/.claude/agent-team.json" <<JSON
{
  "created_at": "$(date +%Y-%m-%dT%H:%M:%S%z)",
  "app_dir": "$app",
  "sources": [],
  "imported": 0,
  "last_run": null
}
JSON

  ok "앱 폴더 준비 완료: ${C_BOLD}$app${C_RESET}"
  log "   ${C_DIM}다음: agent-team.sh import \"$app\"${C_RESET}"
}

# ══════════════════════════════════════════════════════════════════════
# import — 소스 폴더에서 에이전트 .md 를 app/.claude/agents 로 수집
# ══════════════════════════════════════════════════════════════════════
cmd_import() {
  local app="" force=0 move=0 backup=""
  local -a srcs=()
  while [ $# -gt 0 ]; do
    case "$1" in
      --from) shift; [ $# -gt 0 ] || die "--from 뒤에 폴더 필요"; srcs+=("$1") ;;
      --force) force=1 ;;
      --move) move=1 ;;
      --backup) shift; [ $# -gt 0 ] || die "--backup 뒤에 폴더 필요"; backup="$1" ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) [ -z "$app" ] && app="$1" || die "인자 과다: $1" ;;
    esac
    shift
  done
  require_app_dir "$app"
  app=$(abspath "$app")
  local dest="$app/.claude/agents"

  if [ ${#srcs[@]} -eq 0 ]; then
    while IFS= read -r line; do [ -n "$line" ] && srcs+=("$line"); done < <(default_sources)
  fi

  # --move: 원본을 소스에서 제거해 'app 폴더에서만' 사용되도록 함. 삭제 전 백업.
  if [ "$move" -eq 1 ]; then
    [ -n "$backup" ] || backup="$HOME/.agent-team-backups/$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$backup"
    backup=$(abspath "$backup")
    warn "이동 모드: 소스에서 원본을 제거합니다 (전역/타 폴더에서 더 이상 사용 불가)"
    info "삭제 전 백업 위치: $backup"
  fi

  if [ "$move" -eq 1 ]; then
    info "소스 폴더 ${#srcs[@]}개에서 에이전트 이동(move) → $dest"
  else
    info "소스 폴더 ${#srcs[@]}개에서 에이전트 복사(copy) → $dest"
  fi
  local total=0 copied=0 skipped=0 missing=0 deglob=0
  local -a used_sources=()

  for src in "${srcs[@]}"; do
    if [ ! -d "$src" ]; then
      warn "소스 없음(건너뜀): $src"; missing=$((missing+1)); continue
    fi
    used_sources+=("$src")

    # 이동 모드: 이 소스 폴더 전체를 백업
    if [ "$move" -eq 1 ]; then
      local safe; safe=$(printf "%s" "$src" | tr '/ ' '__')
      cp -R "$src" "$backup/$safe" 2>/dev/null || true
    fi

    local found=0
    while IFS= read -r -d '' f; do
      found=$((found+1)); total=$((total+1))
      local base; base=$(basename "$f")
      local target="$dest/$base"
      if [ -e "$target" ] && [ "$force" -ne 1 ]; then
        skipped=$((skipped+1))
        if [ "$move" -eq 1 ]; then
          # app 버전 유지 + 소스 중복본 제거(백업됨) → 전역 잔존 방지
          rm -f "$f"; deglob=$((deglob+1))
          warn "중복(app버전 유지, 소스 제거): $base"
        else
          warn "중복(유지): $base  ${C_DIM}(--force 로 덮어쓰기)${C_RESET}"
        fi
        continue
      fi
      if [ "$move" -eq 1 ]; then
        mv -f "$f" "$target"
      else
        cp "$f" "$target"
      fi
      copied=$((copied+1))
    done < <(find "$src" -maxdepth 1 -type f -name '*.md' -print0 2>/dev/null)
    log "   ${C_DIM}$src → ${found}개 발견${C_RESET}"
  done

  # 메타데이터 갱신
  local roster_count; roster_count=$(find "$dest" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  local src_json=""
  for s in "${used_sources[@]}"; do
    src_json="$src_json${src_json:+,}\"$s\""
  done
  cat > "$app/.claude/agent-team.json" <<JSON
{
  "updated_at": "$(date +%Y-%m-%dT%H:%M:%S%z)",
  "app_dir": "$app",
  "sources": [$src_json],
  "imported": $roster_count,
  "mode": "$([ "$move" -eq 1 ] && echo move || echo copy)",
  "scoped_only": $([ "$move" -eq 1 ] && echo true || echo false),
  "backup": "$([ "$move" -eq 1 ] && printf "%s" "$backup")",
  "last_run": null
}
JSON

  log ""
  if [ "$move" -eq 1 ]; then
    ok "이동 완료: 신규 ${C_GREEN}$copied${C_RESET} · 중복정리 $deglob · 소스없음 $missing"
    ok "이 팀은 이제 ${C_BOLD}$app${C_RESET} 안에서만 사용됩니다 (전역/타 폴더에서 제거됨)"
    log "   ${C_DIM}백업: $backup${C_RESET}"
    log "   ${C_DIM}확인: agent-team.sh scope \"$app\"${C_RESET}"
  else
    ok "수집 완료: 신규 ${C_GREEN}$copied${C_RESET} · 중복유지 $skipped · 소스없음 $missing"
    warn "복사 모드입니다 — 원본이 소스에 남아 다른 폴더에서도 사용될 수 있습니다."
    log "   ${C_DIM}'app 폴더에서만' 쓰려면: agent-team.sh import \"$app\" --move${C_RESET}"
  fi
  ok "현재 팀 규모: ${C_BOLD}${roster_count}명${C_RESET}  ($dest)"
  log "   ${C_DIM}다음: agent-team.sh list \"$app\"${C_RESET}"
}

# ══════════════════════════════════════════════════════════════════════
# scope — 이 앱의 에이전트가 app 폴더 밖(전역/소스)에도 남아있는지 검사
# ══════════════════════════════════════════════════════════════════════
cmd_scope() {
  local app="${1:-}"
  require_app_dir "$app"
  app=$(abspath "$app")
  local dest="$app/.claude/agents"

  # 검사 대상: 기본 소스 + $HOME/.claude/agents (전역)
  local -a checks=()
  while IFS= read -r line; do [ -n "$line" ] && checks+=("$line"); done < <(default_sources)
  local global="$HOME/.claude/agents"
  local seen=0
  for c in "${checks[@]}"; do [ "$c" = "$global" ] && seen=1; done
  [ "$seen" -eq 1 ] || checks+=("$global")

  log "${C_BOLD}── 스코프 검사 (app 폴더 전용 여부) ──────────────${C_RESET}"
  log " 앱 에이전트: $dest"
  local leaks=0
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    local base; base=$(basename "$f")
    for c in "${checks[@]}"; do
      # app 폴더 자신은 제외
      [ "$(abspath "$c" 2>/dev/null)" = "$dest" ] && continue
      if [ -e "$c/$base" ]; then
        warn "전역/외부 잔존: $base  ←  $c"
        leaks=$((leaks+1))
      fi
    done
  done < <(find "$dest" -maxdepth 1 -type f -name '*.md' 2>/dev/null | sort)

  if [ "$leaks" -eq 0 ]; then
    ok "이 팀은 ${C_BOLD}$app${C_RESET} 안에서만 사용됩니다 (외부 잔존 없음)"
  else
    err "외부 잔존 ${leaks}건 — 'import \"$app\" --move --force' 로 정리하세요"
    return 1
  fi
}

# ══════════════════════════════════════════════════════════════════════
# list — 로스터 출력 + TEAM.md 생성
# ══════════════════════════════════════════════════════════════════════
cmd_list() {
  local app="${1:-}"
  require_app_dir "$app"
  app=$(abspath "$app")
  local dest="$app/.claude/agents"
  local team_md="$app/TEAM.md"

  local count; count=$(find "$dest" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  log ""
  log "${C_BOLD}════════════════════════════════════════════════════════════════${C_RESET}"
  log "${C_BOLD} 에이전트 팀 로스터 — $app  (총 ${count}명)${C_RESET}"
  log "${C_BOLD}════════════════════════════════════════════════════════════════${C_RESET}"

  {
    echo "# 에이전트 팀 로스터"
    echo ""
    echo "> 생성: \`agent-team.sh list\` · 앱: \`$app\` · 총 ${count}명"
    echo ""
    echo "| 에이전트 | 모델 | 설명 |"
    echo "|---|---|---|"
  } > "$team_md"

  # 이름순 정렬 출력
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    local base name model desc
    base=$(basename "$f" .md)
    name=$(front_field "$f" "name"); [ -n "$name" ] || name="$base"
    model=$(front_field "$f" "model"); [ -n "$model" ] || model="-"
    desc=$(front_field "$f" "description"); [ -n "$desc" ] || desc="(설명 없음)"
    # 콘솔 출력 (설명 80자 자름)
    local short="$desc"
    if [ ${#short} -gt 80 ]; then short="${short:0:77}..."; fi
    printf "  ${C_CYAN}%-24s${C_RESET} ${C_DIM}%-8s${C_RESET} %s\n" "$name" "$model" "$short"
    # TEAM.md (파이프 이스케이프)
    local md_desc; md_desc=$(printf "%s" "$desc" | sed 's/|/\\|/g')
    echo "| \`$name\` | $model | $md_desc |" >> "$team_md"
  done < <(find "$dest" -maxdepth 1 -type f -name '*.md' | sort)

  log "${C_BOLD}════════════════════════════════════════════════════════════════${C_RESET}"
  ok "로스터 문서 갱신: $team_md"
}

# ══════════════════════════════════════════════════════════════════════
# run — 팀 오케스트레이션 (Claude Code 로 팀을 호출해 앱 제작)
# ══════════════════════════════════════════════════════════════════════
cmd_run() {
  local app="" task="" interactive=0 model="" dry=0 workdir=""
  while [ $# -gt 0 ]; do
    case "$1" in
      --interactive|-i) interactive=1 ;;
      --model) shift; [ $# -gt 0 ] || die "--model 뒤에 값 필요"; model="$1" ;;
      --workdir) shift; [ $# -gt 0 ] || die "--workdir 뒤에 폴더 필요"; workdir="$1" ;;
      --dry-run) dry=1 ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) if [ -z "$app" ]; then app="$1"; elif [ -z "$task" ]; then task="$1"; else die "인자 과다: $1"; fi ;;
    esac
    shift
  done
  [ -n "$app" ] || die "사용법: run <PROJECT_DIR> \"<task>\""
  # 어떤 프로젝트든 실행 가능하도록: 팀 미구성/비어있으면 기본팀 자동 구성(없는 폴더도 생성)
  local have=0
  [ -d "$app/.claude/agents" ] && \
    have=$(find "$app/.claude/agents" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  if [ "${have:-0}" -eq 0 ]; then
    warn "팀 미구성 → 기본팀(${AGENT_TEAM_DEFAULT:-core}) 자동 구성"
    cmd_provision "$app" --team "${AGENT_TEAM_DEFAULT:-core}" >/dev/null
  fi
  require_app_dir "$app"
  app=$(abspath "$app")

  local count; count=$(find "$app/.claude/agents" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  if [ "$count" -eq 0 ]; then
    die "팀 구성 실패"
    count=$(find "$app/.claude/agents" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  fi

  if ! command -v claude >/dev/null 2>&1; then
    die "claude CLI 를 찾을 수 없습니다. Claude Code 설치 후 다시 실행하세요."
  fi

  # --workdir: 하위 프로젝트 폴더에서 실행하되 부모(app)의 팀을 --add-dir 로 포함
  local rundir="$app"
  local -a cli=(claude)
  if [ -n "$workdir" ]; then
    [ -d "$workdir" ] || die "작업 폴더 없음: $workdir"
    workdir=$(abspath "$workdir")
    rundir="$workdir"
    cli+=(--add-dir "$app")   # 팀 루트를 추가 작업 폴더로 포함
  fi

  local ts logf
  ts=$(date +%Y%m%d-%H%M%S)
  logf="$app/logs/run-$ts.log"

  info "팀 규모 ${C_BOLD}${count}명${C_RESET} · 팀루트 $app"
  [ -n "$workdir" ] && info "작업 폴더 $rundir  ${C_DIM}(--add-dir $app 로 팀 포함)${C_RESET}"
  info "로그: $logf"

  [ -n "$model" ] && cli+=(--model "$model")

  if [ "$interactive" -eq 1 ]; then
    # 대화형: 작업 폴더에서 Claude Code 세션 시작
    info "대화형 세션 시작 (종료: /exit). 작업 지시를 입력하세요."
    [ -n "$task" ] && info "초기 작업: $task"
    _proj_status_write "$app" running "$$"
    ( cd "$rundir" && exec "${cli[@]}" ${task:+"$task"} )
  else
    [ -n "$task" ] || die "헤드리스 실행에는 작업 지시가 필요합니다: run <APP_DIR> \"<task>\""
    local prompt
    prompt="너는 에이전트 팀(.claude/agents 의 ${count}명)을 지휘하는 오케스트레이터다. \
독립적인 하위 작업은 Agent 도구로 적합한 서브에이전트에게 병렬 위임해 처리하라. \
각 팀원은 작업에 맞는 사용 가능한 스킬(Skill 도구)이 있으면 직접 구현 전에 먼저 그 스킬을 활용하라. \
만약 이 작업에 필요한 전문가가 팀에 없으면, 그 역할의 새 서브에이전트를 \
.claude/agents/<역할>.md 로 직접 만들어(프론트매터 name/description/model 포함) 습득한 뒤 위임하라. \
작업 지시: ${task}"
    if [ "$dry" -eq 1 ]; then
      warn "[dry-run] 실행하지 않음. 명령 미리보기:"
      log "   ${C_DIM}cd $rundir && ${cli[*]} -p \"<orchestration prompt>\"${C_RESET}"
      log "   ${C_DIM}프롬프트: $prompt${C_RESET}"
      return 0
    fi
    info "헤드리스 오케스트레이션 실행..."
    _proj_status_write "$app" running "$$"
    ( cd "$rundir" && "${cli[@]}" -p "$prompt" ) 2>&1 | tee "$logf"
    _proj_status_write "$app" done 0
    ok "실행 종료. 로그: $logf"
  fi

  # last_run 기록 (best-effort)
  if [ -f "$app/.claude/agent-team.json" ]; then
    local tmp="$app/.claude/agent-team.json.tmp"
    sed "s|\"last_run\": [^,}]*|\"last_run\": \"$ts\"|" "$app/.claude/agent-team.json" > "$tmp" 2>/dev/null && mv "$tmp" "$app/.claude/agent-team.json" || rm -f "$tmp"
  fi
}

# ══════════════════════════════════════════════════════════════════════
# console — 팀 상태 + 최근 실행 로그 관찰 (라이브 콘솔)
# ══════════════════════════════════════════════════════════════════════
cmd_console() {
  local app="${1:-}"
  require_app_dir "$app"
  app=$(abspath "$app")
  local count; count=$(find "$app/.claude/agents" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  local latest
  latest=$(find "$app/logs" -maxdepth 1 -type f -name 'run-*.log' 2>/dev/null | sort | tail -1 || true)

  log "${C_BOLD}── 에이전트 팀 콘솔 ─────────────────────────────${C_RESET}"
  log " 앱      : $app"
  log " 팀 규모 : ${C_GREEN}${count}명${C_RESET}"
  log " 최근로그: ${latest:-없음}"
  log "${C_BOLD}─────────────────────────────────────────────────${C_RESET}"
  if [ -n "$latest" ]; then
    info "최근 실행 로그 실시간 관찰 (Ctrl-C 종료)"
    tail -n 40 -f "$latest"
  else
    warn "실행 로그 없음. 'run' 으로 팀을 먼저 가동하세요."
  fi
}

# ══════════════════════════════════════════════════════════════════════
# doctor — 환경 점검
# ══════════════════════════════════════════════════════════════════════
cmd_doctor() {
  log "${C_BOLD}환경 점검${C_RESET}"
  if command -v claude >/dev/null 2>&1; then
    ok "claude CLI: $(command -v claude)"
  else
    warn "claude CLI 미설치 — 오케스트레이션(run) 불가"
  fi
  log ""
  log "기본 소스 폴더:"
  while IFS= read -r s; do
    [ -n "$s" ] || continue
    if [ -d "$s" ]; then
      local n; n=$(find "$s" -maxdepth 1 -type f -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
      ok "$s  (${n}개)"
    else
      warn "$s  (없음)"
    fi
  done < <(default_sources)
}

# ══════════════════════════════════════════════════════════════════════
# alias — 하위 폴더에서 claude 실행 시 팀을 자동 포함하는 zsh 함수 설치
#   (--add-dir <APP_DIR> 를 매번 안 쳐도 되게 함)
# ══════════════════════════════════════════════════════════════════════
cmd_alias() {
  local app="" install=0 rc="$HOME/.zshrc"
  while [ $# -gt 0 ]; do
    case "$1" in
      --install) install=1 ;;
      --rc) shift; [ $# -gt 0 ] || die "--rc 뒤에 파일 필요"; rc="$1" ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) [ -z "$app" ] && app="$1" || die "인자 과다: $1" ;;
    esac
    shift
  done
  require_app_dir "$app"
  app=$(abspath "$app")

  # cwd 가 팀 루트($app) 하위일 때만 --add-dir 를 자동으로 붙이는 래퍼 함수.
  # 그 외 위치에서는 평범한 claude 로 동작 → 다른 작업에 영향 없음.
  # (주의: bash 3.2 는 $(cat <<HEREDOC) 안에 case/;; 가 있으면 파싱 실패하므로
  #  명령치환 대신 임시파일에 직접 리다이렉트로 생성한다.)
  local marker="# >>> agent-team (auto --add-dir) >>>"
  local endmk="# <<< agent-team (auto --add-dir) <<<"
  local blockfile="${TMPDIR:-/tmp}/agent-team-block.$$"
  cat > "$blockfile" <<FUNC
$marker
# ${app} 하위에서 claude 실행 시 팀(.claude/agents)을 자동 포함
claude() {
  local _team_root="${app}"
  case "\$PWD/" in
    "\$_team_root"/*) command claude --add-dir "\$_team_root" "\$@" ;;
    *)               command claude "\$@" ;;
  esac
}
$endmk
FUNC

  if [ "$install" -eq 1 ]; then
    touch "$rc"
    # 기존 블록 제거 후 재삽입 (idempotent)
    if grep -qF "$marker" "$rc"; then
      local tmp="$rc.agent-team.tmp"
      awk -v s="$marker" -v e="$endmk" '
        $0==s {skip=1} skip && $0==e {skip=0; next} !skip {print}
      ' "$rc" > "$tmp" && mv "$tmp" "$rc"
    fi
    printf "\n" >> "$rc"; cat "$blockfile" >> "$rc"
    ok "zsh 함수 설치: $rc"
    log "   ${C_DIM}적용: source $rc  (또는 새 터미널)${C_RESET}"
    log "   이제 ${C_BOLD}$app${C_RESET} 하위에서 그냥 ${C_BOLD}claude${C_RESET} 만 쳐도 팀이 자동 포함됩니다."
  else
    log "${C_DIM}# 아래를 ~/.zshrc 에 추가하거나, --install 로 자동 설치하세요.${C_RESET}"
    cat "$blockfile"
    log ""
    log "${C_DIM}# 자동 설치: agent-team.sh alias \"$app\" --install${C_RESET}"
  fi
  rm -f "$blockfile"
}

# ══════════════════════════════════════════════════════════════════════
# teams — 사용 가능한 팀팩 목록
# ══════════════════════════════════════════════════════════════════════
cmd_teams() {
  [ -d "$TEAMS_DIR" ] || die "팀팩 폴더 없음: $TEAMS_DIR"
  log "${C_BOLD}사용 가능한 팀팩 (teams/)${C_RESET}"
  local found=0
  while IFS= read -r tf; do
    [ -n "$tf" ] || continue
    found=1
    local name; name=$(basename "$tf" .team)
    local desc; desc=$(grep -m1 '^#' "$tf" 2>/dev/null | sed 's/^#[[:space:]]*//')
    local n; n=$(grep -vE '^[[:space:]]*(#|$)' "$tf" | wc -l | tr -d ' ')
    printf "  ${C_CYAN}%-12s${C_RESET} ${C_DIM}%2s명${C_RESET}  %s\n" "$name" "$n" "$desc"
  done < <(find "$TEAMS_DIR" -maxdepth 1 -type f -name '*.team' | sort)
  [ "$found" -eq 1 ] || warn "팀팩이 없습니다."
  log "   ${C_DIM}적용: agent-team.sh scaffold <PROJECT_DIR> --team <이름>${C_RESET}"
}

# ══════════════════════════════════════════════════════════════════════
# library — 라이브러리 에이전트 목록
# ══════════════════════════════════════════════════════════════════════
cmd_library() {
  [ -d "$LIB_DIR" ] || die "라이브러리 폴더 없음: $LIB_DIR"
  local count; count=$(find "$LIB_DIR" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  log "${C_BOLD}에이전트 라이브러리 (library/) — ${count}명${C_RESET}"
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    local name model desc
    name=$(front_field "$f" "name"); [ -n "$name" ] || name=$(basename "$f" .md)
    model=$(front_field "$f" "model"); [ -n "$model" ] || model="-"
    desc=$(front_field "$f" "description")
    local short="$desc"; [ ${#short} -gt 66 ] && short="${short:0:63}..."
    printf "  ${C_CYAN}%-20s${C_RESET} ${C_DIM}%-7s${C_RESET} %s\n" "$name" "$model" "$short"
  done < <(find "$LIB_DIR" -maxdepth 1 -type f -name '*.md' | sort)
}

# ══════════════════════════════════════════════════════════════════════
# scaffold — 라이브러리에서 팀을 골라 프로젝트 폴더에 전용 팀 구성
#   (프로젝트마다 자기 팀 → 여러 프로젝트 동시 진행 가능)
# ══════════════════════════════════════════════════════════════════════
cmd_scaffold() {
  local proj="" team="" force=0
  local -a adds=()
  while [ $# -gt 0 ]; do
    case "$1" in
      --team) shift; [ $# -gt 0 ] || die "--team 뒤에 이름 필요"; team="$1" ;;
      --add) shift; [ $# -gt 0 ] || die "--add 뒤에 에이전트 필요"; adds+=("$1") ;;
      --force) force=1 ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) [ -z "$proj" ] && proj="$1" || die "인자 과다: $1" ;;
    esac
    shift
  done
  [ -n "$proj" ] || die "사용법: scaffold <PROJECT_DIR> --team <이름> [--add NAME]..."
  [ -n "$team" ] || die "--team <이름> 필요 (목록: agent-team.sh teams)"
  local tf="$TEAMS_DIR/$team.team"
  [ -f "$tf" ] || die "팀팩 없음: $team  (목록: agent-team.sh teams)"

  # 프로젝트 폴더 준비 (init 재사용)
  if [ ! -d "$proj/.claude/agents" ]; then
    cmd_init "$proj" >/dev/null
  fi
  proj=$(abspath "$proj")
  local dest="$proj/.claude/agents"

  # 구성원 목록 = 팀팩 + --add
  local -a members=()
  while IFS= read -r line; do
    line="${line%%#*}"; line="$(printf "%s" "$line" | tr -d '[:space:]')"
    [ -n "$line" ] && members+=("$line")
  done < "$tf"
  members+=("${adds[@]}")

  info "팀팩 '${C_BOLD}$team${C_RESET}' → $dest"
  local copied=0 skipped=0 missing=0
  for m in "${members[@]}"; do
    local src="$LIB_DIR/$m.md"
    if [ ! -f "$src" ]; then
      warn "라이브러리에 없음: $m"; missing=$((missing+1)); continue
    fi
    local target="$dest/$m.md"
    if [ -e "$target" ] && [ "$force" -ne 1 ]; then
      skipped=$((skipped+1)); continue
    fi
    cp "$src" "$target"; copied=$((copied+1))
  done

  local total; total=$(find "$dest" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  # 메타 기록
  cat > "$proj/.claude/agent-team.json" <<JSON
{
  "updated_at": "$(date +%Y-%m-%dT%H:%M:%S%z)",
  "app_dir": "$proj",
  "team_pack": "$team",
  "imported": $total,
  "scoped_only": true,
  "last_run": null
}
JSON
  log ""
  ok "구성 완료: 신규 ${C_GREEN}$copied${C_RESET} · 기존유지 $skipped · 누락 $missing"
  ok "프로젝트 전용 팀 ${C_BOLD}${total}명${C_RESET}  ($proj)"
  log "   ${C_DIM}로스터: agent-team.sh list \"$proj\"${C_RESET}"
  log "   ${C_DIM}가동:   agent-team.sh run  \"$proj\" \"<작업>\"${C_RESET}"
  log "   ${C_DIM}이 폴더는 독립 팀이라 다른 프로젝트와 동시에 돌릴 수 있습니다.${C_RESET}"
}

# ══════════════════════════════════════════════════════════════════════
# _new_agent_template — 라이브러리에 없는 역할을 자동 생성(습득)
#   $1=name(kebab)  $2=설명(옵션)  → library/<name>.md 생성, 경로 echo
# ══════════════════════════════════════════════════════════════════════
_new_agent_template() {
  local name="$1" desc="${2:-}"
  mkdir -p "$LIB_DIR"
  [ -n "$desc" ] || desc="${name} 역할 전문가. (자동 생성됨 — 세부 역할·모델·도구를 필요에 맞게 다듬어 쓰세요.)"
  local title; title=$(printf "%s" "$name" | tr '_-' '  ')
  cat > "$LIB_DIR/$name.md" <<MD
---
name: ${name}
description: ${desc}
model: sonnet
tools: Read, Edit, Write, Bash, Grep, Glob
---

너는 '${title}' 역할의 전문가다. (이 정의는 자동 생성되었다 — 필요 시 다듬어라.)

책임:
- 이 역할에 해당하는 작업을 맡아 처리한다: ${desc}
- 자신의 전문 영역에 집중하고, 범위를 벗어나면 총괄에게 알린다.
- 산출물은 다음 팀원이 바로 이어받을 수 있게 명확히 남긴다.

원칙:
- 작업에 맞는 사용 가능한 스킬(Skill 도구)이 있으면 직접 구현 전에 먼저 활용한다.
- 주변 코드·문서의 컨벤션을 따른다.
- 결과를 실제로 확인(빌드/실행/검증)한 뒤 완료로 보고한다.
MD
  printf "%s" "$LIB_DIR/$name.md"
}

# ══════════════════════════════════════════════════════════════════════
# provision — 어떤 프로젝트든 팀을 보장:
#   있는 에이전트는 배정, 없는 역할은 자동 생성·습득 후 배정
# ══════════════════════════════════════════════════════════════════════
cmd_provision() {
  local proj="" team="" force=0
  local -a needs=()
  while [ $# -gt 0 ]; do
    case "$1" in
      --team) shift; [ $# -gt 0 ] || die "--team 뒤에 이름 필요"; team="$1" ;;
      --need) shift; [ $# -gt 0 ] || die "--need 뒤에 역할 필요"; needs+=("$1") ;;
      --force) force=1 ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) [ -z "$proj" ] && proj="$1" || die "인자 과다: $1" ;;
    esac
    shift
  done
  [ -n "$proj" ] || die "사용법: provision <PROJECT_DIR> [--team PACK] [--need 역할[=설명]]..."

  if [ ! -d "$proj/.claude/agents" ]; then cmd_init "$proj" >/dev/null; fi
  proj=$(abspath "$proj")
  local dest="$proj/.claude/agents"

  # 배정 대상 목록 구성: 팀팩(있으면) + --need 들. 아무것도 없으면 core 기본팀.
  local -a wanted=()
  local -a wanted_desc=()
  if [ -n "$team" ]; then
    local tf="$TEAMS_DIR/$team.team"
    [ -f "$tf" ] || die "팀팩 없음: $team  (목록: agent-team.sh teams)"
    while IFS= read -r line; do
      line="${line%%#*}"; line="$(printf "%s" "$line" | tr -d '[:space:]')"
      [ -n "$line" ] && { wanted+=("$line"); wanted_desc+=(""); }
    done < "$tf"
  fi
  for n in "${needs[@]}"; do
    local nm="${n%%=*}" ds=""
    [ "$n" != "$nm" ] && ds="${n#*=}"
    wanted+=("$nm"); wanted_desc+=("$ds")
  done
  if [ ${#wanted[@]} -eq 0 ]; then
    team="core"
    while IFS= read -r line; do
      line="${line%%#*}"; line="$(printf "%s" "$line" | tr -d '[:space:]')"
      [ -n "$line" ] && { wanted+=("$line"); wanted_desc+=(""); }
    done < "$TEAMS_DIR/core.team"
    info "요청 없음 → 기본팀(core) 배정"
  fi

  info "프로젝트 팀 보장 → $dest"
  local assigned=0 created=0 kept=0
  local i=0
  for name in "${wanted[@]}"; do
    local desc="${wanted_desc[$i]}"; i=$((i+1))
    local libf="$LIB_DIR/$name.md"
    if [ ! -f "$libf" ]; then
      _new_agent_template "$name" "$desc" >/dev/null
      created=$((created+1))
      ok "신규 생성·습득: ${C_BOLD}$name${C_RESET}  ${C_DIM}→ library/${name}.md${C_RESET}"
    fi
    local target="$dest/$name.md"
    if [ -e "$target" ] && [ "$force" -ne 1 ]; then
      kept=$((kept+1))
    else
      cp "$libf" "$target"; assigned=$((assigned+1))
    fi
  done

  local total; total=$(find "$dest" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  cat > "$proj/.claude/agent-team.json" <<JSON
{
  "updated_at": "$(date +%Y-%m-%dT%H:%M:%S%z)",
  "app_dir": "$proj",
  "team_pack": "${team:-custom}",
  "imported": $total,
  "scoped_only": true,
  "last_run": null
}
JSON
  log ""
  ok "배정 ${C_GREEN}$assigned${C_RESET} · 신규습득 ${C_YELLOW}$created${C_RESET} · 기존유지 $kept"
  ok "프로젝트 전용 팀 ${C_BOLD}${total}명${C_RESET}  ($proj)"
  if [ "$created" -gt 0 ]; then
    log "   ${C_DIM}새로 만든 에이전트는 라이브러리에 저장돼 다음 프로젝트에서도 재사용됩니다.${C_RESET}"
    if [ "${AGENT_TEAM_AUTOPUSH:-}" = "1" ]; then
      if [ -d "$AGENT_TEAM_HOME/.git" ]; then
        _autopush "chore: add ${created} agent(s) via provision"
        ok "새 에이전트 git 자동 push 완료"
      else
        warn "AGENT_TEAM_AUTOPUSH=1 이지만 홈이 git 리포가 아님 → push 생략 (agent-team sync 사용)"
      fi
    fi
  fi
  log "   ${C_DIM}가동: agent-team.sh run \"$proj\" \"<작업>\"${C_RESET}"
}

# ══════════════════════════════════════════════════════════════════════
# status — 여러 프로젝트 상태를 한 번에 (단일 본부/대시보드용)
#   ROOT 하위의 각 프로젝트(.claude/agent-team.json)를 스캔해 JSON 출력
# ══════════════════════════════════════════════════════════════════════
cmd_status() {
  local root="${1:-$HOME/Documents/app}" json=0
  [ "${2:-}" = "--json" ] && json=1
  [ "${1:-}" = "--json" ] && { json=1; root="$HOME/Documents/app"; }
  root=$(abspath "$root")

  # 프로젝트 = .claude/agents 를 가진 하위 폴더
  local -a rows=()
  while IFS= read -r agents_dir; do
    [ -n "$agents_dir" ] || continue
    local pdir; pdir=$(dirname "$(dirname "$agents_dir")")
    local n; n=$(find "$agents_dir" -maxdepth 1 -type f -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
    local pack="-" last="-"
    local meta="$pdir/.claude/agent-team.json"
    if [ -f "$meta" ]; then
      pack=$(grep -o '"team_pack"[^,]*' "$meta" 2>/dev/null | sed 's/.*: *"//;s/"//' || echo "-")
      last=$(grep -o '"last_run"[^,}]*' "$meta" 2>/dev/null | sed 's/.*: *//;s/"//g' || echo "-")
    fi
    local latest running="idle"
    latest=$(find "$pdir/logs" -maxdepth 1 -type f -name 'run-*.log' 2>/dev/null | sort | tail -1 || true)
    rows+=("$pdir|$n|$pack|$last|${latest:-}")
  done < <(find "$root" -maxdepth 3 -type d -name agents -path '*/.claude/agents' 2>/dev/null | sort)

  if [ "$json" -eq 1 ]; then
    printf '{\n  "root": "%s",\n  "projects": [\n' "$root"
    local first=1
    for r in "${rows[@]}"; do
      IFS='|' read -r p n pk lr lg <<< "$r"
      [ "$first" -eq 1 ] || printf ',\n'; first=0
      printf '    {"path":"%s","agents":%s,"team_pack":"%s","last_run":"%s","log":"%s"}' \
        "$p" "$n" "$pk" "$lr" "$lg"
    done
    printf '\n  ]\n}\n'
  else
    log "${C_BOLD}본부 — 프로젝트 현황 ($root)${C_RESET}"
    log "${C_DIM}$(printf '%-34s %5s %-9s %s' 프로젝트 인원 팀팩 최근실행)${C_RESET}"
    if [ ${#rows[@]} -eq 0 ]; then warn "프로젝트 없음 ($root 하위에 .claude/agents 폴더 없음)"; return 0; fi
    for r in "${rows[@]}"; do
      IFS='|' read -r p n pk lr lg <<< "$r"
      printf "  ${C_CYAN}%-32s${C_RESET} %4s명 %-9s %s\n" "$(basename "$p")" "$n" "$pk" "$lr"
    done
  fi
}

# ══════════════════════════════════════════════════════════════════════
# install — git과 무관하게 Mac 홈(~/.agent-team)에 독립 설치
# ══════════════════════════════════════════════════════════════════════
cmd_install() {
  local dest=""
  local -a seeds=()
  while [ $# -gt 0 ]; do
    case "$1" in
      --seed) shift; [ $# -gt 0 ] || die "--seed 뒤에 폴더 필요"; seeds+=("$1") ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) [ -z "$dest" ] && dest="$1" || die "인자 과다: $1" ;;
    esac
    shift
  done
  [ -n "$dest" ] || dest="$HOME/.agent-team"
  dest="${dest/#\~/$HOME}"
  info "Mac 독립 설치 → $dest  ${C_DIM}(git 없이 동작)${C_RESET}"
  mkdir -p "$dest/library" "$dest/teams" "$dest/knowledge" "$dest/logs"

  cp "$SCRIPT_DIR/agent-team.sh" "$dest/agent-team.sh"
  chmod +x "$dest/agent-team.sh"
  # 라이브러리/팀팩 복사 (기존 지식/커스텀 에이전트는 덮어쓰지 않음)
  local c=0
  if [ -d "$LIB_DIR" ]; then
    for f in "$LIB_DIR"/*.md; do [ -f "$f" ] || continue
      local b; b=$(basename "$f"); [ -e "$dest/library/$b" ] || { cp "$f" "$dest/library/$b"; c=$((c+1)); }
    done
  fi
  [ -d "$TEAMS_DIR" ] && cp "$TEAMS_DIR"/*.team "$dest/teams/" 2>/dev/null || true

  # --seed: 사장님 기존 Mac 팀을 라이브러리로 흡수 (provision/scaffold 가 실제 팀을 사용)
  local seeded=0
  for s in "${seeds[@]}"; do
    s="${s/#\~/$HOME}"
    [ -d "$s" ] || { warn "seed 없음(건너뜀): $s"; continue; }
    while IFS= read -r -d '' f; do
      local b; b=$(basename "$f")
      cp "$f" "$dest/library/$b"; seeded=$((seeded+1))
    done < <(find "$s" -maxdepth 1 -type f -name '*.md' -print0 2>/dev/null)
    log "   ${C_DIM}흡수: $s${C_RESET}"
  done

  dest=$(abspath "$dest")

  # PATH 에 심링크 (가능한 위치 탐색)
  local linkdir=""
  for d in "$HOME/.local/bin" "/usr/local/bin" "$HOME/bin"; do
    if [ -d "$d" ] && [ -w "$d" ]; then linkdir="$d"; break; fi
  done
  [ -z "$linkdir" ] && { mkdir -p "$HOME/.local/bin" && linkdir="$HOME/.local/bin"; }
  ln -sf "$dest/agent-team.sh" "$linkdir/agent-team" 2>/dev/null || true

  local libtotal; libtotal=$(find "$dest/library" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  ok "설치 완료: 기본 라이브러리 ${c}개 + 흡수 ${seeded}개 → 총 ${C_BOLD}${libtotal}명${C_RESET} · 팀팩 $(ls "$dest/teams" 2>/dev/null | wc -l | tr -d ' ')개"
  ok "실행 파일: ${C_BOLD}$dest/agent-team.sh${C_RESET}"
  if [ -L "$linkdir/agent-team" ]; then
    ok "PATH 링크: $linkdir/agent-team  ${C_DIM}→ 어디서든 'agent-team' 로 실행${C_RESET}"
    case ":$PATH:" in *":$linkdir:"*) : ;; *) warn "$linkdir 가 PATH에 없음 → ~/.zshrc 에 'export PATH=\"$linkdir:\$PATH\"' 추가";; esac
  fi
  log "   ${C_DIM}이제 리포(git) 없이도 동작합니다. 라이브러리/지식은 $dest 에 존재.${C_RESET}"
  log "   ${C_DIM}예: agent-team provision ~/Documents/app/proj1 --team webapp${C_RESET}"
}

# 지식 블록 교체 (마커 사이를 새 내용으로) — $1=md파일 $2=내용파일
_set_knowledge_block() {
  local md="$1" cfile="$2"
  local S='<!-- KNOWLEDGE:START -->' E='<!-- KNOWLEDGE:END -->'
  local tmp="$md.kb.tmp"
  awk -v s="$S" -v e="$E" '
    $0==s {skip=1} skip && $0==e {skip=0; next} !skip {print}
  ' "$md" > "$tmp" && mv "$tmp" "$md"
  { printf "\n%s\n" "$S"; cat "$cfile"; printf "%s\n" "$E"; } >> "$md"
}

# ══════════════════════════════════════════════════════════════════════
# learn — 매일 1회: 모든 에이전트가 자기 분야 최신 지식을 서치·습득
#   claude 로 웹 리서치 → 각 .md 의 지식 블록 갱신 + knowledge/ 아카이브
# ══════════════════════════════════════════════════════════════════════
cmd_learn() {
  local target="" dry=0 limit=0 model=""
  while [ $# -gt 0 ]; do
    case "$1" in
      --dry-run) dry=1 ;;
      --limit) shift; limit="${1:-0}" ;;
      --model) shift; model="${1:-}" ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) [ -z "$target" ] && target="$1" || die "인자 과다: $1" ;;
    esac
    shift
  done

  # 대상 디렉터리 결정:
  #   1) <target>/.claude/agents 있으면 그 프로젝트 팀
  #   2) <target> 자체가 .md 를 담은 에이전트 폴더면 그대로 (예: ~/.claude/agents)
  #   3) 없으면 라이브러리 전체
  local dir
  if [ -n "$target" ] && [ -d "$target/.claude/agents" ]; then
    dir="$(abspath "$target")/.claude/agents"
  elif [ -n "$target" ] && [ -d "$target" ] && \
       [ -n "$(find "$target" -maxdepth 1 -type f -name '*.md' 2>/dev/null | head -1)" ]; then
    dir="$(abspath "$target")"
  else
    dir="$LIB_DIR"
  fi
  [ -d "$dir" ] || die "대상 없음: $dir"
  mkdir -p "$KNOW_DIR"

  if [ "$dry" -ne 1 ] && ! command -v claude >/dev/null 2>&1; then
    die "claude CLI 필요 (지식 리서치용). --dry-run 으로 미리보기 가능."
  fi

  local date; date=$(date +%Y-%m-%d)
  local total; total=$(find "$dir" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  info "지식 습득 대상: ${C_BOLD}${total}명${C_RESET}  ($dir)"
  [ "$limit" -gt 0 ] && info "이번 실행 제한: 최대 ${limit}명"

  local done=0 updated=0
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    [ "$limit" -gt 0 ] && [ "$done" -ge "$limit" ] && break
    done=$((done+1))
    local name desc
    name=$(front_field "$f" "name"); [ -n "$name" ] || name=$(basename "$f" .md)
    desc=$(front_field "$f" "description")
    local prompt="너는 '${name}' 역할 전문가다(${desc}). 오늘(${date}) 기준으로 이 역할의 분야에서 \
새로 알아야 할 최신 동향·도구·베스트프랙티스를 웹에서 조사하라. 서론/맺음말 없이 핵심만 \
4~6개 불릿(각 한 줄, 가능하면 출처 도메인 표기)으로 한국어로 출력하라."
    if [ "$dry" -eq 1 ]; then
      log "  ${C_DIM}[dry] $name ← 리서치 예정${C_RESET}"
      continue
    fi
    printf "  ${C_BLUE}▸${C_RESET} %-22s 리서치…" "$name"
    local out; out=$(cd "$(dirname "$dir")" && claude ${AGENT_TEAM_LEARN_FLAGS:-} -p "$prompt" 2>/dev/null || true)
    if [ -z "$out" ]; then printf " ${C_YELLOW}건너뜀(응답없음)${C_RESET}\n"; continue; fi
    local arch="$KNOW_DIR/${name}-${date}.md"
    { echo "# ${name} — ${date} 지식 업데이트"; echo; printf "%s\n" "$out"; } > "$arch"
    local cfile="$arch.block"
    { echo "## 최신 지식 (${date})"; printf "%s\n" "$out"; } > "$cfile"
    _set_knowledge_block "$f" "$cfile"; rm -f "$cfile"
    updated=$((updated+1))
    printf " ${C_GREEN}습득✔${C_RESET}\n"
  done < <(find "$dir" -maxdepth 1 -type f -name '*.md' | sort)

  log ""
  if [ "$dry" -eq 1 ]; then
    ok "[dry-run] ${done}명 리서치 예정 (실제 실행: --dry-run 제거)"
  else
    ok "지식 습득 완료: ${C_GREEN}${updated}${C_RESET}/${done}명 갱신 · 아카이브: $KNOW_DIR"
  fi
}

# ══════════════════════════════════════════════════════════════════════
# schedule — 매일 자동 learn (macOS launchd)
# ══════════════════════════════════════════════════════════════════════
cmd_schedule() {
  local action="show" time="06:00" target=""
  while [ $# -gt 0 ]; do
    case "$1" in
      --install) action="install" ;;
      --uninstall) action="uninstall" ;;
      --time) shift; time="${1:-06:00}" ;;
      --target) shift; target="${1:-}" ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) [ -z "$target" ] && target="$1" || die "인자 과다: $1" ;;
    esac
    shift
  done
  local label="com.agentteam.dailylearn"
  local plist="$HOME/Library/LaunchAgents/$label.plist"
  local hh="${time%%:*}" mm="${time##*:}"
  local selfsh="$SCRIPT_DIR/agent-team.sh"
  local logf="$AGENT_TEAM_HOME/logs/learn.log"
  mkdir -p "$AGENT_TEAM_HOME/logs"

  case "$action" in
    uninstall)
      launchctl unload "$plist" 2>/dev/null || true
      rm -f "$plist"
      ok "스케줄 제거: $plist"
      ;;
    install)
      mkdir -p "$HOME/Library/LaunchAgents"
      cat > "$plist" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>$label</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/bash</string>
    <string>$selfsh</string>
    <string>learn</string>$( [ -n "$target" ] && printf "\n    <string>%s</string>" "$target" )
  </array>
  <key>EnvironmentVariables</key>
  <dict><key>AGENT_TEAM_HOME</key><string>$AGENT_TEAM_HOME</string></dict>
  <key>StartCalendarInterval</key>
  <dict><key>Hour</key><integer>$((10#$hh))</integer><key>Minute</key><integer>$((10#$mm))</integer></dict>
  <key>StandardOutPath</key><string>$logf</string>
  <key>StandardErrorPath</key><string>$logf</string>
  <key>RunAtLoad</key><false/>
</dict>
</plist>
PLIST
      launchctl unload "$plist" 2>/dev/null || true
      if launchctl load "$plist" 2>/dev/null; then
        ok "매일 ${time} 자동 지식 습득 등록: $plist"
      else
        warn "plist 생성됨(로드 실패 가능): $plist  ${C_DIM}→ 수동: launchctl load $plist${C_RESET}"
      fi
      log "   ${C_DIM}대상: ${target:-라이브러리 전체} · 로그: $logf${C_RESET}"
      ;;
    *)
      if [ -f "$plist" ]; then
        ok "스케줄 있음: $plist"; log "   ${C_DIM}제거: agent-team.sh schedule --uninstall${C_RESET}"
      else
        warn "스케줄 없음. 설치: agent-team.sh schedule --install [--time HH:MM] [--target PROJECT]"
      fi
      ;;
  esac
}

# ══════════════════════════════════════════════════════════════════════
# ══════════════════════════════════════════════════════════════════════
# board — 회사 조직도 대시보드(본부)
#   본부(부서별 대기 팀원) + 프로젝트별 투입 팀원 을 한 화면에.
#   서버 불필요. 자체완결 HTML 을 만들고 macOS 에서 열어준다.
# ══════════════════════════════════════════════════════════════════════
_html_esc() { printf '%s' "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g'; }

# 에이전트 이름/설명 → 부서 분류 (첫 매치 우선)
_dept_of() {
  local n; n=$(printf '%s' "$1" | tr 'A-Z' 'a-z')
  case "$n" in
    orchestrator|*coordinator*|cto|pmo|architect|*tech-lead*|ai-lead) echo "리드·총괄" ;;
    ai-*|ai|*-ai|*mlops*|ml-*|*-ml|*generative*|*llm*)                 echo "AI·ML" ;;
    *design*|*uiux|*ux-writer*|*visual*|*designer*|*-ux|ux-*)          echo "디자인" ;;
    *qa*|*test*|*review*)                                              echo "QA·품질" ;;
    *security*|*privacy*|*legal*|*compliance*|*safety*)                echo "보안·법무" ;;
    *fintech*|*trader*|*trading*|*invest*|*asset*|*finance*|*payment*|*broker*|*exchange*|*wallet*|*defi*) echo "금융·투자" ;;
    *quant*|*math*|*analyst*|*research*|*news*|*harvest*|*data*)      echo "데이터·리서치" ;;
    *pm*|*planner*|*product*|*plan)                                    echo "기획·PM" ;;
    *market*|*brand*|*growth*|*biz*|*sales*)                           echo "마케팅·사업" ;;
    *devops*|*-ops|*ops|*sre*|*release*|*support*|*doc*|*writer*|*l10n*|*localization*) echo "운영·문서" ;;
    *dev*|*frontend*|*backend*|*server*|*fullstack*|*mobile*|*flutter*|*supabase*|*integrator*|*engineer*|*web*) echo "개발" ;;
    *) echo "기타" ;;
  esac
}

# 부서 표시 순서
_DEPT_ORDER="리드·총괄|기획·PM|디자인|개발|AI·ML|데이터·리서치|QA·품질|보안·법무|마케팅·사업|금융·투자|운영·문서|기타"

cmd_board() {
  local out="" open=1 refresh=""
  local -a hqdirs=()
  while [ $# -gt 0 ]; do
    case "$1" in
      --out) shift; out="${1:-}" ;;
      --no-open) open=0 ;;
      --refresh) shift; refresh="${1:-}" ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) hqdirs+=("$1") ;;
    esac
    shift
  done
  local refreshmeta=""
  [ -n "$refresh" ] && refreshmeta="<meta http-equiv=\"refresh\" content=\"$refresh\">"
  [ -n "$out" ] || out="$AGENT_TEAM_HOME/dashboard.html"
  mkdir -p "$(dirname "$out")"
  # 프로젝트 스캔 루트: 기본 ~/Documents/app + AGENT_TEAM_PROJECTS(콜론 구분) 추가
  local -a proots=("$HOME/Documents/app")
  if [ -n "${AGENT_TEAM_PROJECTS:-}" ]; then
    local _r; while IFS= read -r _r; do [ -n "$_r" ] && proots+=("$_r"); done \
      < <(printf '%s\n' "$AGENT_TEAM_PROJECTS" | tr ':' '\n')
  fi

  # 본부 로스터 소스(기본): 전역 팀 + 라이브러리
  if [ ${#hqdirs[@]} -eq 0 ]; then hqdirs=("$HOME/.claude/agents" "$LIB_DIR"); fi

  local now; now=$(date "+%Y-%m-%d %H:%M"); local today; today=$(date "+%Y-%m-%d")
  local tmp="$out.tmp.d"; mkdir -p "$tmp"
  local projmap="$tmp/projmap"; : > "$projmap"     # name<TAB>project
  local projstate="$tmp/projstate"; : > "$projstate" # project<TAB>state
  local hq="$tmp/hq"; : > "$hq"

  # 1) 프로젝트 → 투입 팀원 맵 + 실행 상태
  local pcount=0
  local -a plist=()
  local pseen="$tmp/pseen"; : > "$pseen"
  for proot in "${proots[@]}"; do
    [ -d "$proot" ] || continue
    while IFS= read -r ad; do
      [ -n "$ad" ] || continue
      local pdir pbase; pdir=$(dirname "$(dirname "$ad")"); pbase=$(basename "$pdir")
      # AGENT_TEAM_IGNORE(콜론구분)에 있는 프로젝트는 숨김
      case ":${AGENT_TEAM_IGNORE:-}:" in *":$pbase:"*) continue ;; esac
      # 같은 이름의 프로젝트가 여러 경로에 있어도 하나만 표시(rakwan 중복 방지)
      grep -qxF "$pbase" "$pseen" && continue
      echo "$pbase" >> "$pseen"
      plist+=("$pdir"); pcount=$((pcount+1))
      printf '%s\t%s\n' "$pbase" "$(_proj_state "$pdir")" >> "$projstate"
      while IFS= read -r pf; do
        [ -n "$pf" ] || continue
        local pn; pn=$(front_field "$pf" "name"); [ -n "$pn" ] || pn=$(basename "$pf" .md)
        printf '%s\t%s\n' "$pn" "$pbase" >> "$projmap"
      done < <(find "$ad" -maxdepth 1 -type f -name '*.md' | sort)
    done < <(find "$proot" -maxdepth 3 -type d -path '*/.claude/agents' 2>/dev/null | sort)
  done

  # 2) 본부 로스터 수집 (이름 중복 제거, 지식날짜 있는 쪽 우선)
  local seen="$tmp/seen"; : > "$seen"
  local total=0 learned=0 deployed=0 workcnt=0 donecnt=0
  for d in "${hqdirs[@]}"; do
    [ -d "$d" ] || continue
    while IFS= read -r f; do
      [ -n "$f" ] || continue
      local name; name=$(front_field "$f" "name"); [ -n "$name" ] || name=$(basename "$f" .md)
      grep -qxF "$name" "$seen" && continue
      echo "$name" >> "$seen"
      local model desc kdate dept dep pstate
      model=$(front_field "$f" "model"); [ -n "$model" ] || model="-"
      desc=$(front_field "$f" "description"); [ -n "$desc" ] || desc="(설명 없음)"
      desc=$(printf '%s' "$desc" | tr '\t' ' ')
      kdate=$(grep -m1 -oE '최신 지식 \([0-9]{4}-[0-9]{2}-[0-9]{2}\)' "$f" 2>/dev/null | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' || true)
      dept=$(_dept_of "$name")
      dep=$(grep -F "$(printf '%s\t' "$name")" "$projmap" 2>/dev/null | head -1 | cut -f2 || true)
      pstate=""
      [ -n "$dep" ] && pstate=$(grep -F "$(printf '%s\t' "$dep")" "$projstate" 2>/dev/null | head -1 | cut -f2 || true)
      total=$((total+1))
      [ -n "$kdate" ] && learned=$((learned+1))
      if [ -n "$dep" ]; then
        deployed=$((deployed+1))
        if [ "$pstate" = "working" ]; then workcnt=$((workcnt+1))
        elif [ "$pstate" = "done" ]; then donecnt=$((donecnt+1)); fi
      fi
      printf '%s\037%s\037%s\037%s\037%s\037%s\037%s\n' "$dept" "$name" "$model" "$kdate" "$desc" "$dep" "$pstate" >> "$hq"
    done < <(find "$d" -maxdepth 1 -type f -name '*.md' | sort)
  done
  local bench=$((total-deployed))
  local waitcnt=$((total-workcnt-donecnt))

  # 부서 → 이모지 / 색상
  _dept_emoji() { case "$1" in
    리드·총괄) echo 👑;; 기획·PM) echo 📋;; 디자인) echo 🎨;; 개발) echo 💻;;
    AI·ML) echo 🤖;; 데이터·리서치) echo 📊;; QA·품질) echo 🧪;; 보안·법무) echo 🛡️;;
    마케팅·사업) echo 📈;; 금융·투자) echo 💰;; 운영·문서) echo 📦;; *) echo ⭐;; esac; }
  _dept_color() { case "$1" in
    리드·총괄) echo '#d2a8ff';; 기획·PM) echo '#79c0ff';; 디자인) echo '#f778ba';; 개발) echo '#58a6ff';;
    AI·ML) echo '#a5d6ff';; 데이터·리서치) echo '#7ee787';; QA·품질) echo '#ffa657';; 보안·법무) echo '#ff7b72';;
    마케팅·사업) echo '#ffd33d';; 금융·투자) echo '#3fb950';; 운영·문서) echo '#8b949e';; *) echo '#8b949e';; esac; }

  # 아바타 칩 (마우스오버 툴팁 포함): name model kdate desc dep pstate dept
  _chip() {
    local nm="$1" md="$2" kd="$3" ds="$4" dp="$5" ps="$6" dept="$7"
    local emo; emo=$(_dept_emoji "$dept")
    local scls slabel
    if [ -n "$dp" ]; then
      if [ "$ps" = "working" ]; then scls="a-work"; slabel="🟢 작업중 · $(_html_esc "$dp")"
      elif [ "$ps" = "done" ]; then scls="a-done"; slabel="✔ 완료 · $(_html_esc "$dp")"
      else scls="a-wait"; slabel="⏳ 대기 · $(_html_esc "$dp")"; fi
    else scls="a-bench"; slabel="🏢 본부 대기"; fi
    local kstat
    if [ -n "$kd" ]; then
      if [ "$kd" = "$today" ]; then kstat="오늘 습득 · $kd"; else kstat="습득 · $kd"; fi
    else kstat="미습득"; fi
    printf '<div class="agent %s" tabindex="0"><div class="ava">%s</div><div class="nm">%s</div><div class="tip"><div class="tth"><b>%s</b> <span class="mb m-%s">%s</span></div><div class="ttd">%s</div><div class="ttr">%s %s</div><div class="ttr">%s</div><div class="ttr">📚 %s</div></div></div>\n' \
      "$scls" "$emo" "$(_html_esc "$nm")" "$(_html_esc "$nm")" "$(_html_esc "$md")" "$(_html_esc "$md")" "$(_html_esc "$ds")" "$emo" "$(_html_esc "$dept")" "$slabel" "$kstat"
  }

  # 3) HTML 조립 (게임형 조직도 맵)
  {
    cat <<HTMLHEAD
<!doctype html><html lang="ko"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
${refreshmeta}
<title>에이전트 본부 — Company HQ</title>
<style>
:root{--bg:#0b0f16;--card:#161b22;--bd:#30363d;--fg:#e6edf3;--dim:#8b949e;--acc:#58a6ff}
*{box-sizing:border-box}
body{margin:0;background:radial-gradient(1200px 500px at 20% -5%,#1b2a4a55,transparent),radial-gradient(1000px 500px at 90% 0%,#3b1b4a44,transparent),var(--bg);color:var(--fg);font:14px/1.5 -apple-system,BlinkMacSystemFont,"Apple SD Gothic Neo",sans-serif}
.wrap{max-width:1280px;margin:0 auto;padding:20px}
h1{font-size:22px;margin:0}
.hud{position:sticky;top:0;z-index:30;display:flex;gap:10px;flex-wrap:wrap;align-items:center;background:rgba(11,15,22,.82);backdrop-filter:blur(8px);padding:12px 0;margin-bottom:14px;border-bottom:1px solid #ffffff10}
.hud h1{margin-right:8px}.sub{color:var(--dim);font-size:12px;width:100%}
.tile{background:#161b2288;border:1px solid var(--bd);border-radius:12px;padding:8px 14px;min-width:96px}
.tile .n{font-size:22px;font-weight:800;line-height:1}.tile .l{color:var(--dim);font-size:11px;margin-top:2px}
.tile.g .n{color:#3fb950}.tile.b .n{color:var(--acc)}.tile.w .n{color:#d29922}.tile.p .n{color:#d2a8ff}
.section{margin:24px 0 10px;font-size:15px;font-weight:800;letter-spacing:.3px}
.map{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:16px}
.room{--dc:#8b949e;background:linear-gradient(180deg,#1b222d,#141922);border:1px solid var(--bd);border-top:3px solid var(--dc);border-radius:16px;padding:12px 12px 14px;box-shadow:0 10px 30px #0005}
.room.working{box-shadow:0 0 0 1px #3fb95066,0 10px 30px #0006}
.rh{display:flex;align-items:center;gap:8px;font-weight:800;margin-bottom:12px}
.re{font-size:20px;filter:drop-shadow(0 0 6px var(--dc))}
.rc{margin-left:auto;font-size:11px;color:var(--dim);background:#0007;border:1px solid var(--bd);border-radius:20px;padding:1px 9px}
.agents{display:flex;flex-wrap:wrap;gap:12px}
.agent{position:relative;width:74px;text-align:center}
.ava{width:52px;height:52px;margin:0 auto;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:25px;background:#0d1117;border:2px solid var(--bd);transition:transform .1s}
.agent:hover .ava{transform:translateY(-3px) scale(1.06)}
.nm{font-size:10.5px;margin-top:5px;color:var(--fg);overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
.a-work .ava{border-color:#3fb950;box-shadow:0 0 0 3px #3fb95033;animation:glow 1.5s infinite}
.a-done .ava{border-color:#1f6feb;box-shadow:0 0 0 3px #1f6feb22}
.a-wait .ava{border-color:#9e6a03}
.a-bench .ava{opacity:.6}
@keyframes glow{0%,100%{box-shadow:0 0 0 3px #3fb95022}50%{box-shadow:0 0 0 7px #3fb95044}}
.tip{display:none;position:absolute;top:calc(100% + 8px);left:50%;transform:translateX(-50%);width:236px;text-align:left;background:#0f1620;border:1px solid #3a4658;border-radius:12px;padding:11px;z-index:80;box-shadow:0 14px 40px #000a}
.agent:hover .tip,.agent:focus .tip{display:block}
.tth{font-size:13px;margin-bottom:5px;display:flex;align-items:center;gap:6px;flex-wrap:wrap}
.ttd{font-size:11px;color:var(--dim);margin-bottom:7px;line-height:1.45}
.ttr{font-size:11.5px;margin-top:3px}
.mb{font-size:9px;padding:1px 6px;border-radius:20px;border:1px solid var(--bd)}
.m-opus{color:#d2a8ff;border-color:#8957e5}.m-sonnet{color:#79c0ff;border-color:#1f6feb}.m-haiku{color:#7ee787;border-color:#238636}
.empty{color:var(--dim);font-size:13px;padding:10px 0}
.foot{color:var(--dim);font-size:12px;margin:30px 0 4px;text-align:center}
</style></head><body><div class="wrap">
<div class="hud">
<h1>🏛 에이전트 본부</h1>
<div class="tile b"><div class="n">${total}</div><div class="l">전체 팀원</div></div>
<div class="tile g"><div class="n">${workcnt}</div><div class="l">🟢 작업 중</div></div>
<div class="tile"><div class="n">${donecnt}</div><div class="l">✔ 완료</div></div>
<div class="tile w"><div class="n">${waitcnt}</div><div class="l">⏳ 대기</div></div>
<div class="tile p"><div class="n">${pcount}</div><div class="l">🎯 프로젝트</div></div>
<div class="sub">생성 ${now} · 아바타에 마우스를 올리면 상세정보 · 새로고침 자동</div>
</div>
<div class="section">🏢 본부 — 부서별 배치도</div>
<div class="map">
HTMLHEAD

    # 부서별 방(room) 렌더
    OLDIFS="$IFS"; IFS='|'
    for dept in $_DEPT_ORDER; do
      IFS="$OLDIFS"
      local cnt=0
      while IFS=$'\037' read -r dp _rest; do [ "$dp" = "$dept" ] && cnt=$((cnt+1)); done < "$hq"
      [ "$cnt" -eq 0 ] && { IFS='|'; continue; }
      printf '<div class="room" style="--dc:%s"><div class="rh"><span class="re">%s</span> %s <span class="rc">%s명</span></div><div class="agents">\n' \
        "$(_dept_color "$dept")" "$(_dept_emoji "$dept")" "$(_html_esc "$dept")" "$cnt"
      while IFS=$'\037' read -r dp nm md kd ds dep ps; do
        [ "$dp" = "$dept" ] || continue
        _chip "$nm" "$md" "$kd" "$ds" "$dep" "$ps" "$dept"
      done < "$hq"
      printf '</div></div>\n'
      IFS='|'
    done
    IFS="$OLDIFS"
    echo '</div>'

    # 프로젝트 미션 룸
    echo '<div class="section">🎯 프로젝트 미션 — 투입 팀원</div>'
    if [ "$pcount" -eq 0 ]; then
      echo '<div class="empty">진행 중인 프로젝트가 없습니다. (agent-team provision 으로 팀 투입)</div>'
    else
      echo '<div class="map">'
      local i=0
      while [ $i -lt ${#plist[@]} ]; do
        local pdir="${plist[$i]}"; i=$((i+1))
        local pbase; pbase=$(basename "$pdir")
        local ad="$pdir/.claude/agents"
        local pst; pst=$(_proj_state "$pdir")
        local dc="#8b949e" stlabel rcls=""
        if [ "$pst" = "working" ]; then dc="#3fb950"; stlabel="🟢 작업 중"; rcls="working"
        elif [ "$pst" = "done" ]; then dc="#1f6feb"; stlabel="✔ 완료"
        else dc="#d29922"; stlabel="⏳ 대기"; fi
        printf '<div class="room %s" style="--dc:%s"><div class="rh"><span class="re">🎯</span> %s <span class="rc">%s</span></div><div class="agents">\n' \
          "$rcls" "$dc" "$(_html_esc "$pbase")" "$stlabel"
        while IFS= read -r pf; do
          [ -n "$pf" ] || continue
          local nm md ds kd dpt
          nm=$(front_field "$pf" "name"); [ -n "$nm" ] || nm=$(basename "$pf" .md)
          md=$(front_field "$pf" "model"); [ -n "$md" ] || md="-"
          ds=$(front_field "$pf" "description"); [ -n "$ds" ] || ds=""
          ds=$(printf '%s' "$ds" | tr '\t' ' ')
          kd=$(grep -m1 -oE '최신 지식 \([0-9]{4}-[0-9]{2}-[0-9]{2}\)' "$pf" 2>/dev/null | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' || true)
          dpt=$(_dept_of "$nm")
          _chip "$nm" "$md" "$kd" "$ds" "$pbase" "$pst" "$dpt"
        done < <(find "$ad" -maxdepth 1 -type f -name '*.md' | sort)
        printf '</div></div>\n'
      done
      echo '</div>'
    fi
    echo '<div class="foot">agent-team board · 본부→부서→팀원 조직 배치도 · 마우스오버 상세 · git 없이 ~/.agent-team</div></div></body></html>'
  } > "$out"
  rm -rf "$tmp"

  ok "본부 대시보드 생성: ${C_BOLD}$out${C_RESET}"
  ok "팀원 ${C_BOLD}${total}명${C_RESET} (투입 ${deployed} · 대기 ${bench} · 지식습득 ${learned}) · 프로젝트 ${pcount}개"
  if [ "$open" -eq 1 ] && command -v open >/dev/null 2>&1; then
    open "$out" && log "   ${C_DIM}브라우저로 열었습니다.${C_RESET}"
  else
    log "   ${C_DIM}열기: open \"$out\"${C_RESET}"
  fi
}

# ══════════════════════════════════════════════════════════════════════
# serve — 라이브 본부 서버 (localhost:PORT). 자동 갱신 + 자동 새로고침.
#   7777 같은 상시 화면. python3 내장 http 서버 사용.
# ══════════════════════════════════════════════════════════════════════
cmd_serve() {
  local port=7788 interval=15
  local -a hqdirs=()
  while [ $# -gt 0 ]; do
    case "$1" in
      --port) shift; port="${1:-7788}" ;;
      --interval) shift; interval="${1:-15}" ;;
      -*) die "알 수 없는 옵션: $1" ;;
      *) hqdirs+=("$1") ;;
    esac
    shift
  done
  local py=""
  command -v python3 >/dev/null 2>&1 && py=python3
  [ -z "$py" ] && command -v python >/dev/null 2>&1 && py=python
  [ -n "$py" ] || die "python3 필요 (라이브 서버용). 없으면 'agent-team board' 로 정적 파일 사용."

  # 요청 포트가 이미 사용 중이면(다른 서버가 점유) 빈 포트를 자동 탐색
  _port_free() {
    "$py" - "$1" <<'PY' 2>/dev/null
import socket,sys
s=socket.socket()
try:
    s.bind(("127.0.0.1", int(sys.argv[1]))); s.close()
except OSError:
    sys.exit(1)
PY
  }
  local tries=0
  while ! _port_free "$port"; do
    warn "포트 ${port} 사용 중(다른 서버 점유) → 다음 포트 시도"
    port=$((port+1)); tries=$((tries+1))
    [ "$tries" -ge 30 ] && die "빈 포트를 못 찾음"
  done

  local servedir="$AGENT_TEAM_HOME/hq"
  mkdir -p "$servedir"

  # 최초 생성
  cmd_board "${hqdirs[@]}" --out "$servedir/index.html" --refresh "$interval" --no-open >/dev/null

  # 백그라운드 주기 재생성
  ( while true; do
      sleep "$interval"
      cmd_board "${hqdirs[@]}" --out "$servedir/index.html" --refresh "$interval" --no-open >/dev/null 2>&1 || true
    done ) &
  local regen_pid=$!
  trap 'kill '"$regen_pid"' 2>/dev/null; exit 0' INT TERM EXIT

  ok "라이브 본부 서버 시작: ${C_BOLD}http://localhost:${port}${C_RESET}"
  log "   ${C_DIM}${interval}초마다 자동 갱신 · 종료: Ctrl-C${C_RESET}"
  ( sleep 1; command -v open >/dev/null 2>&1 && open "http://localhost:${port}" ) >/dev/null 2>&1 &

  # 포그라운드: http 서버 (index.html 을 루트로 서빙)
  ( cd "$servedir" && exec "$py" -m http.server "$port" --bind 127.0.0.1 )
}

# ══════════════════════════════════════════════════════════════════════
# sync — 로컬 라이브러리/팀팩 변경(새 에이전트)을 git 리포로 push
# ══════════════════════════════════════════════════════════════════════
cmd_sync() {
  if [ ! -d "$AGENT_TEAM_HOME/.git" ]; then
    warn "홈이 git 리포가 아닙니다: $AGENT_TEAM_HOME"
    log "   자동 push 하려면 클론을 홈으로 지정해 실행하세요:"
    log "   ${C_DIM}AGENT_TEAM_HOME=~/agent-team agent-team provision ...  (그리고 sync)${C_RESET}"
    log "   또는 수동: ${C_DIM}cd ~/agent-team && git add library teams && git commit -m '...' && git push${C_RESET}"
    return 1
  fi
  ( cd "$AGENT_TEAM_HOME" || exit 1
    git add library teams
    if git diff --cached --quiet; then
      ok "변경 없음 (push 생략)"
    else
      git commit -q -m "chore: sync agents ($(date +%Y-%m-%d))"
      if git push; then ok "리포에 push 완료"; else err "push 실패 (원격/권한 확인)"; exit 1; fi
    fi )
}

# ══════════════════════════════════════════════════════════════════════
usage() {
  cat <<USAGE
${C_BOLD}agent-team.sh${C_RESET} — Claude Code 에이전트 팀 운영/오케스트레이션 (macOS)

명령:
  init     <APP_DIR>                         앱 폴더 스캐폴딩(.claude/agents 생성)
  teams                                      사용 가능한 팀팩 목록
  library                                    라이브러리 에이전트 목록
  scaffold <PROJECT_DIR> --team <이름> [--add NAME]... [--force]
                                             라이브러리에서 팀을 골라 프로젝트 전용
                                             팀 구성(여러 프로젝트 동시 진행용)
  provision <PROJECT_DIR> [--team PACK] [--need 역할[=설명]]...
                                             팀 보장: 있는 에이전트는 배정, 없는 역할은
                                             자동 생성·습득 후 배정(요청 없으면 기본팀)
  status  [ROOT] [--json]                    한 본부에서 여러 프로젝트 현황 스캔
                                             (기본 ROOT=~/Documents/app)
  board   [DIR]... [--out FILE] [--no-open]  회사 조직도(부서별 팀원+프로젝트 투입)를
                                             HTML 로 생성해 열기
  serve   [DIR]... [--port 7788] [--interval 15]
                                             라이브 본부 서버(localhost) — 자동 갱신
                                             되는 상시 화면 (7777 같은 구성)
  install [DEST] [--seed DIR]...             git 없이 Mac 홈(~/.agent-team)에 독립 설치.
                                             --seed 로 기존 팀(~/.claude/agents 등) 흡수
  sync                                       새 에이전트/팀팩 변경을 git 리포로 push
                                             (홈이 클론일 때. AGENT_TEAM_AUTOPUSH=1 로 자동)
  learn   [DIR|PROJECT] [--dry-run] [--limit N]
                                             모든 에이전트가 최신 지식 서치·습득. 대상은
                                             프로젝트/에이전트폴더 모두 가능(없으면 라이브러리)
  schedule [--install|--uninstall] [--time HH:MM] [--target PROJECT]
                                             매일 자동 learn (macOS launchd)
  import   <APP_DIR> [--from DIR]... [--move] [--force] [--backup DIR]
                                             소스에서 에이전트 수집. --move 는 원본을
                                             제거해 'app 폴더에서만' 사용되게 함(백업 후)
  scope   <APP_DIR>                          팀이 app 폴더 밖(전역)에 남아있는지 검사
  list    <APP_DIR>                          팀 로스터 출력 + TEAM.md 생성
  run     <APP_DIR> "<task>" [--workdir DIR] [--interactive] [--model M] [--dry-run]
                                             팀을 호출해 앱 제작(오케스트레이션).
                                             --workdir 는 하위 폴더에서 실행하되
                                             --add-dir 로 부모(팀루트)를 포함
  alias   <APP_DIR> [--install] [--rc FILE]  하위 폴더에서 claude 실행 시 팀을
                                             자동 포함하는 zsh 함수 출력/설치
  console <APP_DIR>                          팀 상태 + 실행 로그 라이브 관찰
  doctor                                     환경/소스 폴더 점검

예시:
  ./agent-team.sh init   ~/app                     # 팀 루트(부모)
  ./agent-team.sh import ~/app --move              # 전역에서 빼내 ~/app 전용으로
  ./agent-team.sh alias  ~/app --install           # 하위 폴더에서 claude 자동 팀포함
  # 이후 ~/app/proj1 등에서 그냥 'claude' 만 쳐도 팀 사용
  ./agent-team.sh run    ~/app "랜딩페이지 만들어라" --workdir ~/app/proj1

소스 폴더 기본값: \$HOME/Tattoo/.claude/agents, \$HOME/.claude/agents, \$HOME/rakwan/.claude/agents
  (AGENT_TEAM_SOURCES="dir1:dir2" 로 재정의)
USAGE
}

main() {
  local cmd="${1:-}"; shift || true
  case "$cmd" in
    init)     cmd_init "$@" ;;
    import)   cmd_import "$@" ;;
    teams)    cmd_teams "$@" ;;
    library)  cmd_library "$@" ;;
    scaffold) cmd_scaffold "$@" ;;
    provision) cmd_provision "$@" ;;
    status)   cmd_status "$@" ;;
    board)    cmd_board "$@" ;;
    serve)    cmd_serve "$@" ;;
    sync)     cmd_sync "$@" ;;
    install)  cmd_install "$@" ;;
    learn)    cmd_learn "$@" ;;
    schedule) cmd_schedule "$@" ;;
    scope)    cmd_scope "$@" ;;
    list)    cmd_list "$@" ;;
    run)     cmd_run "$@" ;;
    alias)   cmd_alias "$@" ;;
    console) cmd_console "$@" ;;
    doctor)  cmd_doctor "$@" ;;
    ""|-h|--help|help) usage ;;
    *) err "알 수 없는 명령: $cmd"; usage; exit 1 ;;
  esac
}

main "$@"
