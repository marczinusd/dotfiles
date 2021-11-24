ZSH_THEME="kafeitu"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export ZSH="/home/marczinusd/.oh-my-zsh"
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
export _ZO_FZF_OPTS="--height=40% --reverse --preview 'tree -C {2} | head -200'"
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

plugins=(
    gitfast
    github
    docker
    dotnet
    npm
    stack
    python
    zoxide
    httpie
    ripgrep
    # custom plugins
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    zsh-nvm
    fzf-tab
    forgit
)

source $ZSH/oh-my-zsh.sh
source /home/marczinusd/.config/broot/launcher/bash/br

[ -f "/home/marczinusd/.ghcup/env" ] && source "/home/marczinusd/.ghcup/env"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
    source "${conf}"
done
unset conf
