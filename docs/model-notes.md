# Why This Repo Has Multiple Agent Files

Different AI coding tools look for their own filename before they'll pick up project instructions automatically. Rather than maintaining the same rules in several places — and letting them quietly drift apart — this project keeps **one real file** and points every tool at it.

| File | Read by | Role |
|---|---|---|
| `AGENTS.md` | Claude Code, GitHub Copilot, Cursor, OpenAI Codex, Gemini CLI, Windsurf, Amazon Q, and most other agentic coding tools (as a fallback when their own filename is absent) | **Source of truth.** All real rules live here. |
| `CLAUDE.md` | Claude Code (checked before `AGENTS.md`) | Pointer only — one line to `AGENTS.md`. |
| `.github/copilot-instructions.md` | GitHub Copilot specifically | Pointer only — one line to `AGENTS.md`. |
| `GEMINI.md` | Gemini CLI / Gemini Code Assist | Pointer only — one line to `AGENTS.md`. |

**Why not just write four separate files?** Because the moment a rule changes in one and not the others, the project has four sources of truth and no way to tell which one an AI actually read before it acted. A one-line pointer can't drift.

**Why not delete the pointer files and rely on `AGENTS.md` alone?** You can, if every tool your team uses reads `AGENTS.md` natively. Keep the pointer files if your organization standardizes on a tool that specifically checks for its own filename first (Claude Code and GitHub Copilot both do).

If you add support for another tool, add a one-line pointer file for it here and a row to the table above — don't copy the rules into it.
