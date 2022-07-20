# ----------------------------------------------------------------------
# FZF
# https://github.com/junegunn/fzf
# https://github.com/junegunn/fzf#environment-variables
# https://github.com/zimfw/fzf/blob/master/init.zsh
#
# brew install fzf
# To install useful key bindings and fuzzy completion:
#   $(brew --prefix)/opt/fzf/install
#
# Tips: https://github.com/junegunn/fzf#key-bindings-for-command-line
# CTRL-T - Paste the selected files and directories onto the command-line
# CTRL-R - Paste the selected command from history onto the command-line
# ALT-C - cd into the selected directory
# bindkey '^T' transpose-chars
# ----------------------------------------------------------------------

# PATH
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Settings
export FZF_DEFAULT_OPTS="--border --info=inline"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
