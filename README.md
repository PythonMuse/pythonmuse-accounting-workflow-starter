# PythonMuse Accounting Workflow Starter

A ready-to-use scaffold for onboarding AI into your first accounting workflow using the **PythonMuse ONBOARD checklist** — Organize, Name, Brief, Obtain, Allow, Review, Document.

Read the full methodology first: [Don't Just Prompt AI. ONBOARD It.](https://github.com/PythonMuse/ai-ledger/tree/main/articles/35-onboard-ai-workflows) (part of the [PythonMuse](https://github.com/PythonMuse/ai-ledger) series). This repo is that article made runnable — clone it, and the seven ONBOARD prompts are ready to fire in order.

---

## Use This Template

On GitHub, click **"Use this template"** to create your own copy. Or clone it directly:

**Windows (PowerShell) — standard:**
```powershell
git clone https://github.com/PythonMuse/pythonmuse-accounting-workflow-starter.git ~\Documents\my-workflow
cd ~\Documents\my-workflow
code .
```

**Windows (PowerShell) — OneDrive users:** if your Documents folder is synced via OneDrive, use the full path:
```powershell
git clone https://github.com/PythonMuse/pythonmuse-accounting-workflow-starter.git "$env:USERPROFILE\OneDrive\Documents\my-workflow"
cd "$env:USERPROFILE\OneDrive\Documents\my-workflow"
code .
```

**Mac / Linux / Git Bash:**
```bash
git clone https://github.com/PythonMuse/pythonmuse-accounting-workflow-starter.git ~/Documents/my-workflow
cd ~/Documents/my-workflow
code .
```

---

## Running the ONBOARD Prompts

Every prompt in `prompts/` is plain, tool-agnostic Markdown — open the file and paste the prompt into whatever AI tool you use (ChatGPT, Gemini, Copilot Chat, Claude.ai). Run them roughly in order; each one names the ONBOARD step it belongs to and a completion check before you move to the next.

**If you're using Claude Code specifically**, the same nine prompts are also wired up as slash commands in `.claude/commands/` — type `/onboard-organize-workspace`, `/onboard-draft-agent-file`, and so on, and Claude Code reads the matching file in `prompts/` for you. Both point at the same source text, so there's nothing to keep in sync.

| # | Prompt file | Claude Code command | ONBOARD step |
|---|---|---|---|
| 01 | `prompts/01-organize-create-workspace.md` | `/onboard-organize-workspace` | O — Organize |
| 02 | `prompts/02-organize-draft-agent-file.md` | `/onboard-draft-agent-file` | O — Organize |
| 03 | `prompts/03-organize-apply-agent-file.md` | `/onboard-apply-agent-file` | O — Organize |
| 04 | `prompts/04-name-the-assignment.md` | `/onboard-name-assignment` | N — Name |
| 05 | `prompts/05-brief-interview-me.md` | `/onboard-brief-interview` | B — Brief |
| 06 | `prompts/06-obtain-execution-plan.md` | `/onboard-execution-plan` | O — Obtain |
| 07 | `prompts/07-allow-controlled-test.md` | `/onboard-controlled-test` | A — Allow |
| 08 | `prompts/08-review-package.md` | `/onboard-review-package` | R — Review |
| 09 | `prompts/09-document-update-instructions.md` | `/onboard-document-learnings` | D — Document |

---

## What Is Inside

```text
pythonmuse-accounting-workflow-starter/
  AGENTS.md                    AI instructions — the single source of truth
  CLAUDE.md                    pointer to AGENTS.md, for Claude Code
  GEMINI.md                    pointer to AGENTS.md, for Gemini
  .github/copilot-instructions.md   pointer to AGENTS.md, for GitHub Copilot
  .claude/commands/            /onboard-... slash commands (Claude Code only)

  plan.md                      assignment, business context, execution plan (fill in via prompts 04-06)
  status_update.md             rolling session tracker
  backlog.md                   recommended controls, open questions, deferred scope

  data/
    raw/                       original source files — read-only
    processed/                 cleaned / transformed data

  scripts/                     reviewed, reusable processing logic
  prompts/                     the 9 ONBOARD prompts, tool-agnostic
  outputs/                     generated reports and deliverables
  evidence/                    tie-outs, control totals, validation logs
  skills/                      reusable procedures (SKILL.md per subfolder)
  docs/                        supporting documentation, model-notes.md
```

Every folder has its own short `README.md` explaining what belongs there and what doesn't — read those before dropping in real data.

## Why Four Agent-Instruction Files?

Different AI tools look for different filenames automatically. Rather than writing the same rules four times and letting them drift apart, this repo keeps one real file (`AGENTS.md`) and points every tool-specific filename back to it. See [docs/model-notes.md](docs/model-notes.md) for the full reasoning and which tool reads which file.

## License

MIT — see [LICENSE](LICENSE).

---

*Built by [PythonMuse LLC](https://github.com/PythonMuse/ai-ledger), the companion starter kit to [Don't Just Prompt AI. ONBOARD It.](https://github.com/PythonMuse/ai-ledger/tree/main/articles/35-onboard-ai-workflows)*
