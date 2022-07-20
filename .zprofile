# -U: keep only the first occurrence of each duplicated value
# http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html#index-typeset
typeset -U PATH path FPATH fpath MANPATH manpath INFOPATH infopath

# homebrew
# export HOMEBREW_PREFIX="/opt/homebrew";
# export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
# export HOMEBREW_REPOSITORY="/opt/homebrew";
# export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
# export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
# export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting $PATH for zsh on macOS
# https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
# echo $PATH | tr ':' '\n'
path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /opt/homebrew/opt/curl/bin
  /opt/homebrew/opt/sqlite/bin
  /opt/homebrew/opt/texinfo/bin
  /opt/homebrew/opt/openssl@1.1/bin
  /opt/homebrew/opt/llvm/bin
  /opt/homebrew/opt/expat/bin
  /opt/homebrew/opt/libiconv/bin
  /opt/homebrew/opt/coreutils/libexec/gnubin
  /opt/homebrew/opt/findutils/libexec/gnubin
  /opt/homebrew/opt/libtool/libexec/gnubin
  /opt/homebrew/opt/gnu-tar/libexec/gnubin
  /opt/homebrew/opt/gnu-sed/libexec/gnubin
  /opt/homebrew/opt/gawk/libexec/gnubin
  /opt/homebrew/opt/gnu-indent/libexec/gnubin
  /opt/homebrew/opt/grep/libexec/gnubin
  ~/.local/bin
  ${path}
)

# https://github.com/zimfw/completion
# echo $fpath | tr ' ' '\n'
fpath=(
  /opt/homebrew/share/zsh/site-functions
  /opt/homebrew/opt/curl/share/zsh/site-functions
  # ~/.zfunc
  ${fpath}
)
