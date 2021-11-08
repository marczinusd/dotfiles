export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_COMMAND='fd --type f' # do not show hidden files
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git' # show hidden filles
export FZF_DEFAULT_OPTS="-m --preview 'bat --style=numbers --color=always --line-range :500 {}' --bind 'f1:execute(nvim {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"

export FZF_ALT_C_COMMAND="fd --type d"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export FZF_CTRL_R_OPTS="--preview ''"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
  cd) fzf "$@" --preview 'tree -C {} | head -200' ;;
  export | unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
  ssh) fzf "$@" --preview 'dig {}' ;;
  *) fzf "$@" --preview '' ;;
  esac
}
