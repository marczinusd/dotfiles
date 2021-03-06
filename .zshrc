ZSH_THEME=""
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export ZSH="$HOME/.oh-my-zsh"
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
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

plugins=(
    gitfast
    github
    docker
    docker-compose
    dotnet
    npm
    stack
    python
    zoxide
    httpie
    ripgrep
    redis-cli
    # custom plugins
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    zsh-nvm
    fzf-tab
    forgit
)

source $ZSH/oh-my-zsh.sh

[ -f "$HOME/.config/broot/launcher/bash/br" ] && source $HOME/.config/broot/launcher/bash/br
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
    source "${conf}"
done
unset conf

# Pure
export PURE_CMD_MAX_EXEC_TIME=1

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
