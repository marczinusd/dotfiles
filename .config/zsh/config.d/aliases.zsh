# Aliases

alias initdocker="sudo dockerd &> /dev/null &"
alias exer="exercism.exe"
alias ghc="stack ghc"
alias ghci="stack ghci"
alias st='git status'
# alias fd='fdfind' # use soft link instead?
alias efzf='code $(fzf)'
alias nn='nnn -eDU -P p'
alias gconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias restart='shutdowm -r'
alias sleepSystem='systemctl suspend'
alias lg='lazygit'
alias lazyconfig='lazygit --git-dir=$HOME/.cfg  --work-tree=$HOME'

# !! Dangerous aliases

alias cat='bat'
alias diff='delta'
alias top='btop'
alias ls='exa'
alias gs='git status'

# !! oh-my-zsh overrides

alias l='ls -lFh'
alias ll='exa -lah'

# !! end overrides
