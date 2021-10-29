ZSH_THEME="awesomepanda"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

export ZSH="/home/marczinusd/.oh-my-zsh"
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export PATH=$PATH:$HOME/.dotnet/tools
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.tools
export PATH=$PATH:$HOME/.ghcup/bin
export EDITOR=code
export GDK_SCALE=1.50
export NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview'
export NNN_FIFO='/tmp/nnn.fifo'
export TERMINAL=tmux
export BAT_THEME="OneHalfDark"

plugins=(
    gitfast
    docker
    dotnet
    npm
    stack
    ubuntu
    python
    cargo
    zoxide
    httpie
    ripgrep
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/marczinusd/Tools/miniconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/marczinusd/Tools/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/marczinusd/Tools/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/marczinusd/Tools/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(mcfly init zsh)"
[ -f "/home/marczinusd/.ghcup/env" ] && source "/home/marczinusd/.ghcup/env" # ghcup-env

source .welcome.zsh
source .aliases.zsh
