---
name: career-ops
description: >-
  AI job search command center (santifer/career-ops) -- evaluate job offers/JDs,
  tailor CVs & generate PDF, scan job portals, track applications, prep interviews,
  draft outreach/emails. Use when the user pastes a job URL or JD, asks to scan
  portals, generate a CV/PDF, track applications, prepare for interviews, draft
  outreach, or names any career-ops mode. 채용공고·이력서·지원 추적·면접 준비 요청에도 사용.
argument-hint: "[scan | discover | deep | pdf | text | latex | cover | email | add | expand | apply | batch | tracker | pipeline | interview-prep | interview | patterns | offer-prep | titles | upskill | followup | outcome | update]"
license: MIT
---

# career-ops (agent-team wrapper)

This is a thin router to the upstream **career-ops** checkout. The real skill,
modes, scripts and personal data (cv.md, config/, data/) live in that checkout —
never inside this folder.

## 1. Resolve PROJECT_ROOT

```
PROJECT_ROOT = $CAREER_OPS_HOME   (if the env var is set)
             = ~/career-ops       (default)
```

Verify `PROJECT_ROOT/AGENTS.md` and `PROJECT_ROOT/modes/` both exist.

If they do **not** exist, bootstrap once, then continue:

```bash
git clone https://github.com/santifer/career-ops.git ~/career-ops
cd ~/career-ops && npm install
npx playwright install chromium   # only needed for PDF generation / apply mode
```

(`agent-team skill-install` performs the clone automatically; `npm install` is left to the user.)

## 2. Delegate to the upstream router

Read `PROJECT_ROOT/.claude/skills/career-ops/SKILL.md` and follow it exactly,
with these overrides:

- Treat `PROJECT_ROOT` resolved above as the project root. Ignore the upstream
  "walk upward from this SKILL.md" rule — this wrapper file is not inside the checkout.
- Resolve every relative path in the upstream router (`modes/`, `config/`,
  `data/`, `*.mjs` scripts, templates, output paths) against `PROJECT_ROOT`,
  never against the current working directory.
- `$mode` = the arguments the user passed to this skill (`$ARGUMENTS`). Empty →
  discovery menu; JD text or URL → `auto-pipeline`, exactly as upstream specifies.
- Run node scripts from `PROJECT_ROOT` (`cd "$PROJECT_ROOT" && node …`).

## 3. Updating

Run `/career-ops update` (upstream's own diff-preview updater) or
`cd ~/career-ops && git pull && npm install`. Nothing in this wrapper needs to change.
