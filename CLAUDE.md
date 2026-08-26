# CLAUDE.md

This file provides context for working on the **picc** project — a reference for the user's personal pi coding agent setup.
picc's goal is to port Claude Code's harness into pi, providing an out of box experience for users switching from Claude Code to open source alternatives, and is also a good starting point to customize their own pi setup.

## What This Repo Is

This is a project for developing and documenting picc extensions and configuration. The actual pi agent config lives at `~/.pi/agent/` on the user's machine. This repo serves as the working directory for plugin development and will be published on GitHub as a demonstration of the pi setup.

## Pi Config Reference

The live pi agent config is at `~/.pi/agent/`. Key files:

- **`settings.json`** — pi core config: default model, mode, theme, package list, compaction settings. Edit `defaultModel` to change the primary model. Add/remove packages in the `packages` array.
- **`models.json`** — LLM provider config. Uses env-var interpolation (`$ANTHROPIC_AUTH_TOKEN` for the API key). Edit `baseUrl` and `models` array to point at your provider. Model IDs here must match `model-profiles.json`.
- **`model-profiles.json`** — Maps modes (`default`, `plan`, `ask`, `auto`) to model IDs. IDs must exist in `models.json`.

## Environment Variables

- **`ANTHROPIC_AUTH_TOKEN`** — Required. API key for the LLM provider, referenced by `models.json` and the auto-mode classifier.

## Custom Extensions

Extensions in `~/.pi/agent/extensions/` are junction paths pointing to the folders under `../`.

> In Windows, make sure to create junctions via PowerShell commands instead of `ln -s`.

| Extension | Purpose |
|---|---|
| `picc-bash` | Bash tool with background command support |
| `picc-claude-shim` | Translation layer for Claude Code SDK |
| `picc-exit-command` | `/exit` command like Claude Code |
| `picc-goal` | Claude Code style long-running goal supervisor |
| `picc-init` | `/init` command like Claude Code |
| `picc-loop` | `/loop` command like Claude Code |
| `picc-memory` | Claude Code style memory persistence |
| `picc-permission-modes` | Claude Code style permission modes: default, acceptEdits, plan, bypass, auto; user defined permission rules |
| `picc-subagents` | Claude Code style sub-agents|
| `picc-tasks` | Task tracking tools |
| `picc-working-spinner` | Claude Code style working indicator |

### npm-installed extensions

Extensions installed via `pi install npm:...` live in `~/.pi/agent/npm/node_modules/`. Their source code, docs, and schemas are available there. Config files still go in `~/.pi/agent/extensions/<package>/config.json`.

### Commands (for `picc-subagents` and similar TypeScript extensions)

```bash
npm run lint        # biome check
npm run lint:fix    # biome check --fix (auto-fix most issues)
npm run typecheck   # tsc --noEmit
npm run test        # vitest run (full suite including e2e)
npm run build       # tsc (compile)
```

To iterate on a single test: `npx vitest run test/<file>.test.ts`.

### Code Rules

- **No `any`** unless absolutely necessary.
- **Top-level imports only** — no dynamic `import()` or inline type imports.
- **Biome** enforces formatting and linting. Match the surrounding code style.
- **Strict TypeScript** (`tsconfig.json`: ES2022 target, bundler module resolution).
- Read files in full before making wide-ranging changes.
- Always ask before removing functionality or code that appears intentional.
- After code changes, run `npm run lint && npm run typecheck && npm run test` and fix all errors.
