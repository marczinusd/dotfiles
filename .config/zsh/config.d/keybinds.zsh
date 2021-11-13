bindkey -s '\ez' 'zi^M' # zoxide interactive

# credit to https://stackoverflow.com/a/61494171 for the original implementation
__edit() (
  setopt localoptions pipefail no_aliases 2> /dev/null
  local file=$(eval "${FZF_DEFAULT_COMMAND}" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS --preview 'bat --style=numbers --color=always --line-range :500 {}'" $(__fzfcmd) -m "$@" | while read item; do
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
bindkey '\ee' __edit-widget

# Credit goes to https://github.com/junegunn/fzf/issues/1750#issuecomment-671197158 for this absolute banger of a command, slightly modified and uglified by me
RG_PREFIX='rg --line-number --column --no-heading --color=always --smart-case '
INITIAL_QUERY=''
#FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY' $HOME"

__fif() {
  fzf --height 40% --layout reverse --bind "change:reload:$RG_PREFIX {q} . || true" --ansi --phony --query "$INITIAL_QUERY" --preview 'bat --style=numbers --color=always -r $(($(echo {} | cut -d ":" -f2) - 1)):$(($(echo {} | cut -d ":" -f2) + 1)) --highlight-line $(echo {} | cut -d ":" -f2)  $(echo {} | cut -d ":" -f1)' | cut -d ':' -f1,2,3 | xargs --no-run-if-empty $EDITOR
}

find-in-files() {
  LBUFFER="${LBUFFER}$(__fif)"
  local ret=$?
  zle reset-prompt
  return $ret
}

zle -N find-in-files
bindkey '^f' find-in-files

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
