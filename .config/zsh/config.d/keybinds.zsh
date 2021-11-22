# zoxide interactive
bindkey -s '\ez' 'zi^M'

# credit to https://stackoverflow.com/a/61494171 for the original implementation
__edit() (
  setopt localoptions pipefail no_aliases 2> /dev/null
  local file=$(eval "${FZF_DEFAULT_COMMAND}" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS --preview 'bat --style=full --color=always --line-range :500 {}'" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item}"
  done)
  local ret=$?
  if [[ -n $file ]]; then
    $EDITOR $file
  fi
  return $ret
)

__edit-widget(){
  __edit
  local ret=$?
  zle reset-prompt
  return $ret
}

zle -N __edit-widget
bindkey '^e' __edit-widget

__edit-alt() (
  setopt localoptions pipefail no_aliases 2> /dev/null
  local file=$(eval "${FZF_DEFAULT_COMMAND}" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS --preview 'bat --style=full --color=always --line-range :500 {}'" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item}"
  done)
  local ret=$?
  if [[ -n $file ]]; then
    nvim $file
  fi
  return $ret
)

__edit-alt-widget(){
  __edit-alt
  local ret=$?
  zle reset-prompt
  return $ret
}

zle -N __edit-alt-widget
bindkey '\ee' __edit-alt-widget

# Credit goes to https://github.com/junegunn/fzf/issues/1750#issuecomment-671197158 for this absolute banger of a command, slightly modified and uglified by me
RG_PREFIX='rg --line-number --column --no-heading --color=always --smart-case -g "!OneDrive/Calibre Library/**" '
INITIAL_QUERY=''
#FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY' $HOME"

__fif() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local target=$(fzf --height 40% --layout reverse --bind "change:reload:$RG_PREFIX {q} . || true" --ansi --phony --query "$INITIAL_QUERY" --preview 'bat --style=full --color=always -r $(($(echo {} | cut -d ":" -f2) - 1)):$(($(echo {} | cut -d ":" -f2) + 40)) --highlight-line $(echo {} | cut -d ":" -f2) $(echo {} | cut -d ":" -f1)' | cut -d ':' -f1,2,3)
  local ret=$?
  local file=$(echo ${target} | cut -d ":" -f1)
  if [[ -n $file ]]; then
    $EDITOR --goto $target
  fi

  return $ret
}

find-in-files() {
  LBUFFER="${LBUFFER}$(__fif)"
  local ret=$?
  zle reset-prompt
  return $ret
}

zle -N find-in-files
bindkey '^f' find-in-files

__fif-alt() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local target=$(fzf --height 40% --layout reverse --bind "change:reload:$RG_PREFIX {q} . || true" --ansi --phony --query "$INITIAL_QUERY" --preview 'bat --style=full --color=always -r $(($(echo {} | cut -d ":" -f2) - 1)):$(($(echo {} | cut -d ":" -f2) + 40)) --highlight-line $(echo {} | cut -d ":" -f2) $(echo {} | cut -d ":" -f1)' | cut -d ':' -f1,2,3)
  local ret=$?
  echo $target # IHaveNoIdeaWhatImDoing.png
}

find-in-files-alt() {
  local res=$(__fif-alt)
  local file=$(echo ${res} | cut -d ":" -f1)
  if [[ -n $file ]]; then
    nvim $res
  fi
  local ret=$?
  zle reset-prompt
  return $ret
}

zle -N find-in-files-alt
bindkey '\ef' find-in-files-alt

# Ctrl-x (Kill Process)
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

zle -N fkill
bindkey '^x' fkill
