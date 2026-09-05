export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fino-time"

plugins=(
  z
  docker
  sudo
  history
  python
  pip
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Historique Zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt correct

# Complétion intelligente
autoload -Uz compinit
compinit

## Alias
alias docker=podman

## Misc
export PATH="$PATH:$HOME/.local/bin"
