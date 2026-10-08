# Agent-Free Quality Check (Reusable Skill)

Use this for ANY GitHub repo to enforce pure, raw, human-written code with zero agent/subagent footprints.

## Apply to a repo

1. Copy `.github/workflows/check-agent-free.yml` into your repo's `.github/workflows/`
2. Copy `.github/AGENT_FREE.md` into your repo's `.github/`
3. Add pre-commit hook (`.git/hooks/pre-commit`) locally:
```sh
#!/bin/sh
if grep -rni -E 'subagent_|deleg_|agent_|hermes-|claude-|opencode-|automated-|machine-generated|llm-|subagent-id|delegation-' . --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=.github; then
  echo "Agent footprint detected. Commit blocked."
  exit 1
fi
```
4. Ensure commit author is clean: only allow `- the-jodingo` or a clean human name.
5. Ensure no agent references in commit messages or code comments.

## Enforcement layers

- **Local**: `.git/hooks/pre-commit` (blocks dirty commits)
- **Remote (push)**: `.github/workflows/check-agent-free.yml` scans source, commit author, and commit messages on every push/PR.
- **Human audit**: Commit messages must read as single-developer work.

## Blocked patterns (non-exhaustive)

`subagent_`, `deleg_`, `agent_`, `hermes-`, `claude-`, `opencode-`, `automated-`, `machine-generated`, `generated-by`, `subagent-id`, `delegation-`, `ai-`, `llm-`, `codex-`, `agent-native`

## Author requirement

Only push as `- the-jodingo` (or a clean human identity). No bot/agent/delegation identity markers in git config or commit metadata.
