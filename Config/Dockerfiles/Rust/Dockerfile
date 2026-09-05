FROM docker.io/library/rust:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=fr_FR.UTF-8
ENV TERM=xterm
ENV COLORTERM=truecolor

RUN apt-get update && apt-get install -y \
    locales gnupg2 ca-certificates curl wget git unzip \
    zsh man-db sudo \
    python3 python3-pip python3-dev build-essential \
    pkg-config libssl-dev \
    ripgrep fd-find nodejs npm \
    && ln -s /usr/bin/fdfind /usr/local/bin/fd \
    && echo "fr_FR.UTF-8 UTF-8" > /etc/locale.gen && locale-gen fr_FR.UTF-8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
    && tar -xzf nvim-linux-x86_64.tar.gz -C /usr/local --strip-components=1 \
    && rm nvim-linux-x86_64.tar.gz

RUN LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest \
        | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/') \
    && curl -Lo lazygit.tar.gz \
        "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
    && tar -xf lazygit.tar.gz lazygit \
    && install lazygit /usr/local/bin \
    && rm lazygit lazygit.tar.gz

RUN rustup toolchain install stable \
    && rustup default stable \
    && rustup component add rustfmt clippy rust-analyzer \
    && cargo install cargo-watch

RUN useradd -m -s /bin/zsh -G sudo rustdev \
    && echo "rustdev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && chown -R rustdev:rustdev /usr/local/cargo /usr/local/rustup

USER rustdev

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim \
    && rm -rf ~/.config/nvim/.git \
    && nvim --headless +"Lazy! sync" +qa 2>/dev/null || true

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
    && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

COPY --chown=rustdev:rustdev .zshrc /home/rustdev/.zshrc

WORKDIR /home/rustdev/project

CMD ["zsh"]
