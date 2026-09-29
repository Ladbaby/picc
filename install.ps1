$ErrorActionPreference = 'Stop'

if (-not (Get-Command pi -ErrorAction SilentlyContinue)) {
    Write-Error "'pi' was not found. Install the pi coding agent first: https://pi.dev/docs/latest/quickstart"
    exit 1
}

$packages = @(
    '@ladbabynpm/picc-claude-shim'
    '@ladbabynpm/picc-permission-modes'
    '@ladbabynpm/picc-memory'
    '@ladbabynpm/picc-subagents'
    '@ladbabynpm/picc-tasks'
    '@ladbabynpm/picc-bash'
    '@ladbabynpm/picc-glob'
    '@ladbabynpm/picc-grep'
    '@ladbabynpm/picc-read'
    '@ladbabynpm/picc-write'
    '@ladbabynpm/picc-edit'
    '@ladbabynpm/picc-ask-user-question'
    '@ladbabynpm/picc-command-alias'
    '@ladbabynpm/picc-loop'
    '@ladbabynpm/picc-init'
    '@ladbabynpm/picc-recap'
    '@ladbabynpm/picc-working-spinner'
)

foreach ($package in $packages) {
    & pi install "npm:$package"
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to install npm:$package (exit code $LASTEXITCODE)."
    }
}

Write-Output 'All picc extensions installed.'
