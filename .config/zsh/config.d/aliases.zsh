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
alias encryptSSH="7z a -mhe=on .ssh.7z .ssh/ -p"
alias decryptSSH="7z x -mhe=on .ssh.7z .ssh/ -p"

# !! Dangerous aliases

alias cat='bat'
alias diff='delta'
alias top='btop'
alias ls='exa -F --git-ignore --icons'
alias gs='git status'
alias git='hub'

# !! oh-my-zsh overrides

alias l='exa -lFh --git-ignore --icons'
alias ll='exa -lFh --all --git-ignore --icons'
alias la='exa -lFah --icons'
alias lt='ll --tree --level=2'

# !! end overrides

# gitignore.io
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
