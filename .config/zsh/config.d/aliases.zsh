# Aliases

alias initdocker="sudo dockerd &> /dev/null &"
alias exer="exercism.exe"
alias ghc="stack ghc"
alias ghci="stack ghci"
alias st='git status'
alias efzf='code $(fzf)'
alias nn='nnn -eDU -P p'
alias gconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias restart='shutdowm -r'
alias sleepSystem='systemctl suspend'
alias lg='lazygit'
alias ldock='lazydocker'
alias lazyconfig='lazygit --git-dir=$HOME/.cfg  --work-tree=$HOME'
alias fz="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias encryptSSH="7z a -mhe=on .ssh.7z .ssh/"
alias decryptSSH="7z x -mhe=on .ssh.7z .ssh/"

# !! Dangerous aliases

alias cat='bat'
alias diff='delta'
alias top='btop'
alias ls='exa'
alias gs='git status'
alias git='hub'

# !! oh-my-zsh overrides

alias l='exa -Fh --git-ignore --icons'
alias ll='exa -lFh --git-ignore --icons'
alias la='exa -lah --icons'
alias lt='ll --tree --level=2'

# !! end overrides
