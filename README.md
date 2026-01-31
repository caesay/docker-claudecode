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
docker run -it --rm --pull always -v ${HOME}/.claude:/home/.claude -v ${PWD}:/workspace caesay/claude-code
```

### Command Prompt (cmd)

```cmd
docker run -it --rm --pull always -v %USERPROFILE%\.claude:/home/.claude -v %cd%:/workspace caesay/claude-code
```

### Linux / macOS / Git Bash / WSL

```bash
docker run -it --rm --pull always -v ~/.claude:/home/.claude -v $(pwd):/workspace caesay/claude-code
```

## Flags Explained

| Flag | Description |
|------|-------------|
| `-it` | Interactive terminal |
| `--rm` | Remove container when it exits |
| `--pull always` | Always pull the latest image before running |
| `-v ~/.claude:/home/.claude` | Persist Claude auth tokens and settings |
| `-v ...:/workspace` | Mount current directory into the container |

## Authentication

The first time you run the container, Claude will prompt you to authenticate. Your login token is persisted to `~/.claude` on your host machine, so you only need to log in once.
