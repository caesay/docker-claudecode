FROM mcr.microsoft.com/dotnet/sdk:10.0

# Install common tools and dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    jq \
    unzip \
    zip \
    vim \
    nano \
    htop \
    tree \
    ripgrep \
    fd-find \
    python3 \
    python3-pip \
    openssh-client \
    ca-certificates \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Claude Code CLI globally
RUN npm install -g @anthropic-ai/claude-code

# Set HOME and create .claude directory with correct permissions
ENV HOME=/home
RUN mkdir -p /home/.claude && chown -R 1000:1000 /home/.claude

# Create a working directory
WORKDIR /workspace

# Switch to non-root user (claude cannot run as root with --dangerously-skip-permissions)
USER 1000:1000

# Set the entrypoint to run Claude Code
ENTRYPOINT ["claude", "--dangerously-skip-permissions"]
