if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="yyyy-mm-dd"
export TPU_NAME=

VSCODE=code

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  zsh-interactive-cd
  per-directory-history
  tmux
  fasd
  # zsh-z
)

source $ZSH/oh-my-zsh.sh
export LC_ALL=ko_KR.UTF-8

ZSH_DISABLE_COMPFIX="true"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LS_COLORS="$LS_COLORS:ow=01;34"

if [ -f ~/.zcompdump ]; then
    rm ~/.zcompdump*
fi

setopt NO_NOMATCH

# TPU
export TCMALLOC_LARGE_ALLOC_REPORT_THRESHOLD=11228800000
export XRT_TPU_CONFIG="localservice;0;localhost:51011"
alias kill-tpu="pkill python; lsof -w /lib/libtpu.so | grep 'python' | awk '{print $2}' | xargs -r kill -9"
