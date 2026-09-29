#!/usr/bin/env bash
set -euo pipefail

if ! command -v pi >/dev/null 2>&1; then
  printf '%s\n' "Error: 'pi' was not found. Install the pi coding agent first: https://pi.dev/docs/latest/quickstart" >&2
  exit 1
fi

packages=(
  @ladbabynpm/picc-claude-shim
  @ladbabynpm/picc-permission-modes
  @ladbabynpm/picc-memory
  @ladbabynpm/picc-subagents
  @ladbabynpm/picc-tasks
  @ladbabynpm/picc-bash
  @ladbabynpm/picc-glob
  @ladbabynpm/picc-grep
  @ladbabynpm/picc-read
  @ladbabynpm/picc-write
  @ladbabynpm/picc-edit
  @ladbabynpm/picc-ask-user-question
  @ladbabynpm/picc-command-alias
  @ladbabynpm/picc-loop
  @ladbabynpm/picc-init
  @ladbabynpm/picc-recap
  @ladbabynpm/picc-working-spinner
)

for package in "${packages[@]}"; do
  pi install "npm:${package}"
done

printf '%s\n' 'All picc extensions installed.'
