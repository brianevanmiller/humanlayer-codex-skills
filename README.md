# HumanLayer Codex Skills

This repo packages the core HumanLayer **research → plan → implement → commit → PR** workflow
as Codex Skills that install into `~/.codex` and are available in any project on your machine.

These skills are near‑literal ports of the Claude Code `/cl:*` commands used in HumanLayer:

- `/cl:research_codebase`
- `/cl:create_plan`
- `/cl:implement_plan`
- `/commit`
- `/describe_pr`

## What this installs

### Skills (user-global)

Installed into: `~/.codex/skills`

- `research-codebase` – deep, read-only research of the current codebase, writing a
  `thoughts/shared/research/...` doc.

- `create-plan` – creates a detailed implementation plan (phases, success criteria)
  under `thoughts/shared/plans/...`.

- `implement-plan` – implements a plan phase-by-phase, runs checks, and pauses for
  manual verification.

- `commit-changes` – proposes commit grouping and messages, then creates commits with
  user approval.

- `describe-pr` – reads a GitHub PR via `gh`, fills out a PR description template,
  syncs to `thoughts/`, and updates the PR body.

### Command docs (reference)

Installed into: `~/.codex/commands`

Core command markdown files mirrored from the original HumanLayer Claude setup:

- `research_codebase.md`
- `create_plan.md`
- `implement_plan.md`
- `commit.md`
- `describe_pr.md`

These are not executable by Codex directly, but serve as reference material the skills
(and humans) can read to stay aligned with the original command semantics.

> Optionally, you can also add `linear.md`, `ralph_*.md`, `create_worktree.md`,
> `create_handoff.md`, `resume_handoff.md`, `oneshot*.md` if you want the
> higher-level “oneshot” / “ralph_*” flows to live in the same repo.

## Requirements

- Codex CLI installed and authenticated.
- `git` and `gh` installed and configured.
- For the full HumanLayer experience:
  - HumanLayer CLI + thoughts repo set up (so `humanlayer thoughts sync` and
    `thoughts/...` paths work).
  - Linear MCP server + `linear` CLI configured if you plan to use Linear-flavored workflows.

## Installation

```bash
git clone https://github.com/YOUR_ORG/humanlayer-codex-skills.git
cd humanlayer-codex-skills
chmod +x install.sh
./install.sh

# By default this installs into `~/.codex`. You can override the target by setting CODEX_HOME:
# CODEX_HOME=/some/other/path ./install.sh
```

After installation, restart Codex (TUI or editor integration) so it picks up the new skills.

## Uninstall

To remove the installed skills and command docs:
```bash
rm -rf ~/.codex/skills/research-codebase \
       ~/.codex/skills/create-plan \
       ~/.codex/skills/implement-plan \
       ~/.codex/skills/commit-changes \
       ~/.codex/skills/describe-pr

rm -f ~/.codex/commands/research_codebase.md \
      ~/.codex/commands/create_plan.md \
      ~/.codex/commands/implement_plan.md \
      ~/.codex/commands/commit.md \
      ~/.codex/commands/describe_pr.md
```
(Adjust if you add the optional linear / ralph_* / handoff / oneshot commands.)

## Usage

Once installed, these are skills, not new Codex slash commands. You invoke them by intent:

•  Research:

  > “Use the research-codebase skill to research how the messaging pipeline works
  > and write a research doc under thoughts/shared/research.”

•  Plan:

  > “Use the create-plan skill to write an implementation plan for ENG-1234 using
  > the research at thoughts/shared/research/2025-01-08-ENG-1234-...md.”

•  Implement:

  > “Use the implement-plan skill to implement Phase 1 of
  > thoughts/shared/plans/2025-01-08-ENG-1234-...md and run the checks in the plan.”

•  Commit:

  > “Use the commit-changes skill to propose commits for the current diff and create them
  > after I approve.”

•  PR description:

  > “Use the describe-pr skill to generate a PR description for the PR associated with
  > this branch, based on thoughts/shared/pr_description.md.”

Codex will route to the appropriate skill based on your request.

### Notes

•  These skills are opinionated toward the HumanLayer + thoughts + Linear ecosystem.
•  They intentionally preserve the original file naming conventions and flows so that
  existing HumanLayer users can move between Claude Code and Codex with minimal friction.


