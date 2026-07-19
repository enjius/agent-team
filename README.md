# 에이전트 팀 운영 (agent-team.sh)

Mac에 흩어진 Claude Code 서브에이전트(`.claude/agents/*.md`)를 **하나의 app 폴더로 꺼내와**
그 팀을 실제로 **호출·조율(오케스트레이션)** 해 앱을 만들게 하는 도구입니다.

> 이 스크립트는 **Mac 로컬**에서 실행하도록 만들어졌습니다.
> (Tattoo / `~/.claude/agents` / rakwan 폴더가 Mac에 있기 때문)
>
> **설치:** `git clone https://github.com/enjius/agent-team && cd agent-team && ./agent-team.sh install`
> → 이후 `~/.agent-team/` 에서 git 없이 동작합니다.

## 배경

| 구성 | 정체 |
|---|---|
| `Tattoo/.claude/agents` + `~/.claude/agents` (32명) | **에이전트 팀** (.md 정의) |
| `rakwan/.claude/agents` (13명) | 실제 앱 만드는 **별동대** |
| `.omc/live-console` | 팀을 지켜보는 화면 (팀 아님) |
| `index.html` | 펀트앱스 랜딩 (팀 아님) |

`agent-team.sh` 는 이 흩어진 팀 정의를 원하는 app 폴더의 `.claude/agents/` 로 모으고,
그 폴더에서 Claude Code 를 띄워 팀이 작업을 분담하도록 지휘합니다.

## 두 가지 사용 방식

1. **기존 팀 이동** (`import`) — Mac에 이미 있는 에이전트를 app 폴더로 모아 운영.
2. **새 팀 구성** (`scaffold`) — 이 리포에 내장된 **에이전트 라이브러리(25명)** 와
   **팀팩(webapp/mobile/ai-app/trading/growth)** 으로 프로젝트마다 전용 팀을 즉석 구성.
   각 프로젝트가 독립 팀을 가지므로 **여러 프로젝트를 동시에** 돌릴 수 있습니다.

## 여러 프로젝트 동시 진행 (scaffold)

```bash
# 프로젝트마다 전용 팀을 심는다 (각자 오케스트레이터 포함)
./agent-team.sh teams                                   # 팀팩 목록 보기
./agent-team.sh scaffold ~/Documents/app/projA --team webapp
./agent-team.sh scaffold ~/Documents/app/projB --team trading --add doc-writer

# 터미널 2개에서 각각 실행 → 두 프로젝트 동시 진행
#  (터미널 1)
cd ~/Documents/app/projA && claude "랜딩페이지 만들어라"
#  (터미널 2)
cd ~/Documents/app/projB && claude "백테스트 대시보드 만들어라"
```

각 프로젝트 폴더의 `.claude/agents/` 는 독립 복사본이라 서로 간섭하지 않습니다.
`--add NAME` 으로 라이브러리의 추가 에이전트를 팀에 더 넣을 수 있습니다.
새 에이전트를 만들려면 `library/<이름>.md` 를 추가하고 원하는 `teams/<팩>.team` 에 이름 한 줄 추가하면 됩니다.

## 자동 배정·습득 (provision) — "어떤 프로젝트든"

있는 에이전트는 배정하고, **없는 역할은 자동 생성해 라이브러리에 습득**한 뒤 배정합니다.

```bash
# 있는 역할은 배정, 없는 'payments-specialist' 는 새로 만들어 습득 후 배정
./agent-team.sh provision ~/Documents/app/projA \
  --team core --need "payments-specialist=결제(토스/스트라이프) 연동·정산"

# 요청 없이 그냥 보장만 → 기본팀(core) 자동 배정
./agent-team.sh provision ~/Documents/app/projB
```

- 새로 만든 에이전트는 `library/` 에 저장돼 **다음 프로젝트에서 재사용**됩니다(습득).
- `run` 은 팀이 없으면 기본팀을 **자동 구성 후 실행** → 빈 폴더에 바로 `run` 해도 됩니다.
- 실행 중 총괄이 필요한 전문가가 팀에 없으면 **직접 새 에이전트를 만들어(습득) 위임**하도록 프롬프트에 지시돼 있습니다.

## 하나의 본부로 여러 프로젝트 보기 (status)

프로젝트마다 본부를 따로 두지 말고 **본부 하나로** `~/Documents/app` 하위 전 프로젝트를 봅니다.
각 프로젝트가 `.claude/agent-team.json`(팀/최근실행) + `logs/` 를 표준 위치에 남기므로 본부가 긁어 모읍니다.

```bash
./agent-team.sh status                 # 표 형태 (기본 ROOT=~/Documents/app)
./agent-team.sh status ~/Documents/app --json   # 대시보드 연동용 JSON
```

## Mac 독립 설치 (git 없이 존재·동작)

툴킷 전체를 Mac 홈으로 설치해 **리포와 무관하게** 상주시킵니다.

```bash
# 리포에서 1회만 (또는 설치본에서 self-update)
./agent-team.sh install                 # → ~/.agent-team 에 설치 + PATH 링크
export PATH="$HOME/.local/bin:$PATH"     # (필요 시 ~/.zshrc 에 추가)

# 이후 어디서든 git 없이
agent-team provision ~/Documents/app/proj1 --team webapp
agent-team run ~/Documents/app/proj1 "..."
```

- 라이브러리·팀팩·습득 지식은 모두 `~/.agent-team/` 에 존재합니다(git 불필요).
- 위치를 바꾸려면 `AGENT_TEAM_HOME=/원하는/경로` 로 재정의.

### 기존 Mac 팀에 기능 얹기

이미 Mac에 만들어둔 팀(`~/.claude/agents` 32명, `rakwan-agent` 13명 등)을 그대로 활용합니다.

```bash
# 설치하면서 기존 팀을 라이브러리로 '흡수'
./agent-team.sh install --seed ~/.claude/agents --seed ~/Documents/app/rakwan-agent/.claude/agents

# 이후 provision/scaffold 가 사장님 실제 에이전트로 팀을 구성
agent-team provision ~/Documents/app/새프로젝트 --need cto --need dev-frontend

# 매일 지식습득은 기존 팀 폴더에 바로 적용 가능
agent-team learn ~/.claude/agents                 # 전역 팀 32명 습득
agent-team learn ~/Documents/app/rakwan-agent     # 프로젝트 팀 습득
agent-team schedule --install --time 06:30 --target ~/.claude/agents
```

## 매일 지식 습득 (learn + schedule)

모든 에이전트가 매일 자기 분야 최신 지식을 서치해 **습득**합니다(각 `.md` 의 지식 블록 갱신).

```bash
agent-team learn --dry-run              # 무엇을 리서치할지 미리보기
agent-team learn                        # 라이브러리 전체 습득(claude 필요)
agent-team learn ~/Documents/app/proj1  # 특정 프로젝트 팀만

# 매일 06:30 자동 실행 등록 (macOS launchd)
agent-team schedule --install --time 06:30
agent-team schedule --uninstall         # 해제
```

각 에이전트 `.md` 끝에 `<!-- KNOWLEDGE:START/END -->` 블록으로 최신 지식이 주입되어,
다음 작업 때 그 지식을 갖고 일합니다. 원본은 `knowledge/<이름>-<날짜>.md` 로 아카이브됩니다.

## 스킬 자동 사용

`init`/`provision` 이 만든 프로젝트의 `CLAUDE.md` 와 실행 프롬프트에
**"필요한 스킬(Skill 도구)을 직접 구현 전에 먼저 활용하라"** 지침이 들어갑니다.
프로젝트 스킬은 `.claude/skills/` 에 두면 팀 전원이 자동으로 씁니다.

## 빠른 시작

```bash
cd /path/to/agent-team    # 이 리포 클론 위치 (또는 install 후 PATH의 agent-team)

# 0) 환경/소스 폴더 점검
./agent-team.sh doctor

# 1) 팀 루트(부모) 폴더 준비 — 그 안에 프로젝트들이 각각 하위 폴더로 들어감
./agent-team.sh init ~/app

# 2) Tattoo/~/.claude/agents/rakwan 에서 에이전트를 ~/app 으로 '이동'
#    (--move: 전역/원본에서 빼내 여기서만 쓰이게 함, 삭제 전 자동 백업)
./agent-team.sh import ~/app --move

# 3) 전용인지 검사 + 로스터 확인
./agent-team.sh scope ~/app
./agent-team.sh list  ~/app

# 4) 하위 폴더에서 claude 실행 시 팀을 자동 포함하도록 zsh 함수 설치
./agent-team.sh alias ~/app --install
source ~/.zshrc

# 5) 이제 어느 하위 프로젝트에서든 그냥 claude 만 쳐도 팀 사용
cd ~/app/proj1
claude "랜딩페이지 만들어라"          # 자동으로 --add-dir ~/app 포함됨

# (선택) 스크립트로 특정 하위 폴더에 팀 태워 실행
./agent-team.sh run ~/app "랜딩페이지 만들어라" --workdir ~/app/proj1

# 실행 로그 라이브 관찰
./agent-team.sh console ~/app
```

## 팀 공유 방식 — `--add-dir` (권장)

`~/app` 아래 프로젝트들이 **각각 별도 폴더/리포**여도 하나의 팀을 공유하는 방법입니다.

- Claude Code 의 `.claude/agents` 탐색은 현재 폴더에서 위로 올라가되 **git 리포 경계(`.git`)에서 멈춥니다.**
  그래서 하위 프로젝트가 자기 리포이면 부모 `~/app/.claude/agents` 를 자동 상속하지 **못합니다.**
- `claude --add-dir ~/app` 로 실행하면 **팀 루트를 작업 폴더로 추가로 포함**해, 하위 어디서든 팀이 로드됩니다.
- 매번 플래그를 치지 않도록 `agent-team.sh alias ~/app --install` 이 **zsh 함수**를 깔아줍니다.
  이 함수는 **`~/app` 하위에 있을 때만** `--add-dir` 를 붙이고, 그 밖에서는 평범한 `claude` 로 동작합니다.

> **`--move` vs 복사**: 기본 `import` 는 **복사**라 원본이 `~/.claude/agents` 등에 남아 다른 폴더에서도
> 팀이 쓰입니다. `--move` 를 주면 원본을 (백업 후) 소스에서 제거해 **오직 `~/app` 을 통해서만** 쓰이게
> 만듭니다. `scope` 로 잔존 여부를 확인하세요.

## 명령

| 명령 | 설명 |
|---|---|
| `init <APP_DIR>` | 앱 폴더 스캐폴딩 — `.claude/agents/`, `.claude/settings.json`, `CLAUDE.md`, `logs/` 생성 |
| `teams` | 내장 팀팩 목록 (webapp/mobile/ai-app/trading/growth) |
| `library` | 내장 에이전트 라이브러리(25명) 목록 |
| `scaffold <PROJECT_DIR> --team <이름> [--add NAME]... [--force]` | 라이브러리에서 팀팩을 골라 프로젝트 전용 `.claude/agents/` 구성. `--add` 로 에이전트 추가. **프로젝트마다 독립 팀 → 동시 진행 가능** |
| `provision <PROJECT_DIR> [--team PACK] [--need 역할[=설명]]...` | 팀 보장: 있는 에이전트 배정, **없는 역할은 자동 생성·습득 후 배정**. 요청 없으면 기본팀(core) |
| `status [ROOT] [--json]` | 본부 하나에서 여러 프로젝트 현황 스캔(팀 인원·팩·최근실행). 기본 ROOT=`~/Documents/app` |
| `install [DEST]` | **git 없이** Mac 홈(`~/.agent-team`)에 스크립트·라이브러리·팀팩을 복사하고 `agent-team` 를 PATH에 링크 |
| `learn [PROJECT] [--dry-run] [--limit N]` | 모든 에이전트가 자기 분야 최신 지식을 웹서치해 **습득**(각 `.md` 지식 블록 갱신 + `knowledge/` 아카이브). 대상 없으면 라이브러리 전체 |
| `schedule [--install\|--uninstall] [--time HH:MM] [--target PROJECT]` | 매일 자동 `learn` (macOS launchd) |
| `import <APP_DIR> [--from DIR]... [--move] [--force] [--backup DIR]` | 소스 폴더에서 `*.md` 에이전트를 수집. 같은 파일명은 **먼저 온 소스 우선**(유지), `--force` 로 덮어쓰기. **`--move`** 는 원본을 소스에서 제거해 **이 app 폴더 전용**으로 만듦(삭제 전 `--backup DIR`, 기본 `~/.agent-team-backups/<시각>` 에 백업) |
| `scope <APP_DIR>` | 이 앱의 에이전트가 app 폴더 밖(기본 소스·`~/.claude/agents` 전역)에도 남아있는지 검사. 잔존 시 실패(exit 1) |
| `list <APP_DIR>` | 프론트매터(name/model/description)를 파싱해 로스터 출력 + `TEAM.md` 생성 |
| `run <APP_DIR> "<task>" [--workdir DIR] [--interactive] [--model M] [--dry-run]` | Claude Code 를 띄워 작업 지시. 기본은 헤드리스(`claude -p`), `--interactive` 는 대화형. **`--workdir DIR`** 는 하위 폴더 `DIR` 에서 실행하되 `--add-dir <APP_DIR>` 로 팀루트를 포함. `--dry-run` 은 명령만 미리보기 |
| `alias <APP_DIR> [--install] [--rc FILE]` | `<APP_DIR>` 하위에서 `claude` 실행 시 `--add-dir` 를 자동으로 붙이는 **zsh 함수**를 출력(기본)/설치(`--install`, 기본 `~/.zshrc`). 멱등 — 재설치해도 중복 안 됨 |
| `console <APP_DIR>` | 팀 규모 + 최근 실행 로그를 실시간(`tail -f`)으로 관찰 |
| `doctor` | `claude` CLI 설치 여부 + 기본 소스 폴더 존재/개수 점검 |

## 소스 폴더

기본값(우선순위 순):

1. `$HOME/Tattoo/.claude/agents`
2. `$HOME/.claude/agents`
3. `$HOME/rakwan/.claude/agents`

재정의:

```bash
# 콜론(:)으로 구분
AGENT_TEAM_SOURCES="$HOME/Tattoo/.claude/agents:$HOME/rakwan/.claude/agents" \
  ./agent-team.sh import ~/apps/funtapps

# 또는 개별 지정
./agent-team.sh import ~/apps/funtapps \
  --from ~/Tattoo/.claude/agents \
  --from ~/rakwan/.claude/agents
```

## 동작 방식 (오케스트레이션)

`run` 은 app 폴더로 이동해 `claude` 를 실행하며, 다음과 같은 지휘 프롬프트를 넘깁니다:

> "너는 이 폴더의 에이전트 팀(.claude/agents 의 N명)을 지휘하는 오케스트레이터다.
> 독립적인 하위 작업은 Agent 도구로 적합한 서브에이전트에게 병렬 위임해 처리하라.
> 작업 지시: …"

Claude Code 는 `.claude/agents/` 의 정의를 서브에이전트로 인식하므로,
메인 세션이 `Agent` 도구로 팀원에게 작업을 분배합니다.
로스터에 **오케스트레이터/총괄 에이전트**가 있으면 그 에이전트를 그대로 활용하도록
지시를 다듬어 쓰면 됩니다.

## 생성물 (app 폴더 구조)

```
<APP_DIR>/
├── CLAUDE.md                     # 작업 공간 운영 원칙
├── TEAM.md                       # 로스터 문서 (list 시 갱신)
├── .claude/
│   ├── agents/                   # 수집된 팀 멤버 .md
│   ├── settings.json             # acceptEdits 기본
│   └── agent-team.json           # 소스/수집수/최근실행 메타
└── logs/
    └── run-YYYYMMDD-HHMMSS.log   # 실행 로그
```

## 요구사항

- macOS (bash 3.2+ / zsh) — BSD `find/awk/sed` 호환
- [Claude Code](https://claude.com/claude-code) CLI (`claude`) — `run` 명령에 필요
