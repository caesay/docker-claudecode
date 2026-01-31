# Claude Code Docker

A Docker container for running Claude Code _dangerously_ with .NET 10 SDK and common development tools pre-installed.

## Included Tools

- .NET 10 SDK
- Node.js 22.x + npm
- Python 3 + pip
- git, curl, wget, jq
- vim, nano
- ripgrep, fd-find, tree, htop
- unzip, zip
- openssh-client

## Usage

The container runs `claude --dangerously-skip-permissions` as its entrypoint. Mount your project directory to `/workspace`.

### PowerShell

```powershell
docker run -it --rm -e ANTHROPIC_API_KEY=$env:ANTHROPIC_API_KEY -v ${PWD}:/workspace caesay/claude-code
```

### Command Prompt (cmd)

```cmd
docker run -it --rm -e ANTHROPIC_API_KEY=%ANTHROPIC_API_KEY% -v %cd%:/workspace caesay/claude-code
```

### Linux / macOS / Git Bash / WSL

```bash
docker run -it --rm -e ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY -v $(pwd):/workspace caesay/claude-code
```

## Flags Explained

| Flag | Description |
|------|-------------|
| `-it` | Interactive terminal |
| `--rm` | Remove container when it exits |
| `-e ANTHROPIC_API_KEY=...` | Pass your Anthropic API key |
| `-v ...:/workspace` | Mount current directory into the container |
