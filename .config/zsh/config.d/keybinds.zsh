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
