# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/rust:0-${VARIANT}

# Include lld linker to improve build times either by using environment variable
# RUSTFLAGS="-C link-arg=-fuse-ld=lld" or with Cargo's configuration file (i.e see .cargo/config.toml).
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
   && apt-get -y install curl clang lld postgresql-client \
   && apt-get autoremove -y && apt-get clean -y

# Install node
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - 
RUN apt-get install -y nodejs
RUN node --version
RUN npm --version

# Install cargo-watch and sqlx-cli
RUN cargo install cargo-watch
RUN cargo install sqlx-cli

# Install bunyan
RUN npm install -g bunyan

# Install Lazygit
ADD https://github.com/jesseduffield/lazygit/releases/download/v0.32.2/lazygit_0.32.2_Linux_x86_64.tar.gz /tmp/lazygit.tar.gz
RUN cd /tmp && tar -xzf ./lazygit.tar.gz
RUN cp /tmp/lazygit /usr/bin/lazygit
RUN rm /tmp/lazygit*
