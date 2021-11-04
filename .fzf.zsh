# Setup fzf
# ---------
if [[ ! "$PATH" == */home/marczinusd/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/marczinusd/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/marczinusd/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/marczinusd/.fzf/shell/key-bindings.zsh"
