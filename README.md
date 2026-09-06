<div align="center">

# picc

> **A tracker-free drop-in replacement for Claude Code**

**Starting point for building your own harness**

<img src="images/logo.png" height=200>

</div>

A set of open source plugins built upon the [pi coding agent](https://pi.dev).

If you've used [Claude Code](https://www.anthropic.com/claude-code) and want to switch to a fully open-source stack, picc faithfully ports Claude Code's harness into pi so it feels familiar out of the box: the same tools, the same commands, the same permission modes, the same UI touches.

Moreover, it's also a good starting point for building your own harness upon pi.
Everyone knows Claude Code has (almost) the best harness, but no set of plugins faithfully replicates its harness.

> DISCLAIMER: Codes are highly vibe-coded, but based on solid references. The author uses [Tresor](https://github.com/Ladbaby/Tresor) to inspect pi's traffic during debugging, in order to make sure the extensions work as expected, instead of reading the source code directly.

## What you get

### Drop-in replacement for Claude Code CLI

[UNDER TESTING] [pi-claude-shim](https://github.com/Ladbaby/picc-claude-shim) is a drop-in replacement for the Claude Code CLI, powered by pi. Third-party tools that spawn `claude` and speak the JSON-lines protocol (such as [hapi](https://github.com/tiann/hapi)) can drive a pi session with zero changes.

### Claude Code's core capabilities

| Extension | What it does |
|---|---|
| [picc-permission-modes](https://github.com/Ladbaby/picc-permission-modes) | Ports Claude Code's permission system to pi: the `default`, `acceptEdits`, `plan`, `bypass`, and `auto` modes, plus user-defined permission rules. |
| [picc-memory](https://github.com/Ladbaby/picc-memory) | Persistent, file-based memory system that survives across conversations |
| [picc-subagents](https://github.com/Ladbaby/picc-subagents) | The `Agent` tool — sub-agents with foreground/background runs, custom agent types, a live widget, and FleetView |

### Tools

| Extension | What it does |
|---|---|
| [picc-tasks](https://github.com/Ladbaby/picc-tasks) | Claude Code style task tracking: `TaskCreate`, `TaskGet`, `TaskList`, `TaskUpdate` |
| [picc-bash](https://github.com/Ladbaby/picc-bash) | Claude Code style `Bash` tool with background command support, plus `TaskStop` (overrides pi's built-in `bash`) |
| [picc-glob](https://github.com/Ladbaby/picc-glob) | Claude Code style `Glob` file finder, backed by ripgrep |
| [picc-grep](https://github.com/Ladbaby/picc-grep) | Claude Code style `Grep` content search, backed by ripgrep (overrides pi's built-in `grep`) |
| [picc-read](https://github.com/Ladbaby/picc-read) | Claude Code style `Read` tool (overrides pi's built-in `read`) |
| [picc-write](https://github.com/Ladbaby/picc-write) | Claude Code style `Write` tool (overrides pi's built-in `write`) |
| [picc-edit](https://github.com/Ladbaby/picc-edit) | Claude Code style `Edit` tool (overrides pi's built-in `edit`) |
| [picc-ask-user-question](https://github.com/Ladbaby/picc-ask-user-question) | `AskUserQuestion` tool — structured multiple-choice questions mid-task |

### Commands

<!-- | [picc-exit-command](https://github.com/Ladbaby/picc-exit-command) | `/exit` — quits pi, same as `/quit` | -->
<!-- | [picc-goal](https://github.com/Ladbaby/picc-goal) | Long-running `/goal` supervisor for multi-step work | -->
| Extension | What it does |
|---|---|
| [picc-loop](https://github.com/Ladbaby/picc-loop) | `/loop` — Claude Code style cron scheduling for recurring or one-shot jobs |
| [picc-init](https://github.com/Ladbaby/picc-init) | `/init` — generates a project context file for the agent |

### Nice-to-have

| Extension | What it does |
|---|---|
| [picc-recap](https://github.com/Ladbaby/picc-recap) | Away summary — a recap of what happened after you've stepped away |
| [picc-working-spinner](https://github.com/Ladbaby/picc-working-spinner) | Claude Code style working indicator: spinner glyphs, shimmer, mode-aware status line, token counter |

## Installation

Everything is installable from npm:

```bash
pi install npm:@ladbabynpm/picc-read
pi install npm:@ladbabynpm/picc-write
pi install npm:@ladbabynpm/picc-edit
pi install npm:@ladbabynpm/picc-glob
pi install npm:@ladbabynpm/picc-grep
pi install npm:@ladbabynpm/picc-bash
pi install npm:@ladbabynpm/picc-ask-user-question
pi install npm:@ladbabynpm/picc-tasks
pi install npm:@ladbabynpm/picc-subagents
pi install npm:@ladbabynpm/picc-memory
pi install npm:@ladbabynpm/picc-recap
pi install npm:@ladbabynpm/picc-working-spinner
pi install npm:@ladbabynpm/picc-init
pi install npm:@ladbabynpm/picc-loop
pi install npm:@ladbabynpm/picc-permission-modes
pi install npm:@ladbabynpm/picc-claude-shim
```

Install any subset — each extension is independent and only overrides what it's designed to override.

## Making it yours

picc is intended as a starting point, not a fixed bundle:

- **Change your model** — edit `defaultModel` in `~/.pi/agent/settings.json`; point `~/.pi/agent/models.json` at any provider.
- **Permission rules** — configure per-tool, per-pattern rules in `picc-permission-modes`' config.
- **Customize** — every extension is a small, readable TypeScript file. Fork it, tweak it, `pi install` your own.

## Links

- [pi documentation](https://pi.dev)
- [pi source](https://github.com/earendil-works/pi)
- [npm: @ladbabynpm](https://www.npmjs.com/~ladbabynpm) — all picc packages
