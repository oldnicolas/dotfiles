# echo zshenv loaded

# Refs
# https://scriptingosx.com/2019/06/moving-to-zsh-part-2-configuration-files/
# https://qiita.com/eumesy/items/3bb39fc783c8d4863c5f

# Ignore /etc/zprofile, /etc/zshrc, /etc/zlogin, and /etc/zlogout
# ref. http://zsh.sourceforge.net/Doc/Release/Files.html
# ref. http://zsh.sourceforge.net/Doc/Release/Options.html#index-GLOBALRCS
# unsetopt GLOBAL_RCS

# curl
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"

# readline
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/readline/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /opt/homebrew/opt/readline/lib/pkgconfig"

# libxml2
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/libxml2/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/libxml2/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /opt/homebrew/opt/libxml2/lib/pkgconfig"

# zlib
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/zlib/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /opt/homebrew/opt/zlib/lib/pkgconfig"

# sqlite3
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/sqlite/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /opt/homebrew/opt/sqlite/lib/pkgconfig"

# openssl@1.1
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /opt/homebrew/opt/openssl@1.1/lib/pkgconfig"

# expat
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/expat/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/expat/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /opt/homebrew/opt/expat/lib/pkgconfig"

# libiconv
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/libiconv/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/libiconv/include"

# llvm
export LDFLAGS="${LDFLAGS} -L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="${CPPFLAGS} -I/opt/homebrew/opt/llvm/include"

# tj/n
# export N_PREFIX=$HOME/.n

## SDKMAN
# https://sdkman.io
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
