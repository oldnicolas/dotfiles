[ -f ~/.zsh_options ] && source ~/.zsh_options

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit ice depth=1
zinit light romkatv/powerlevel10k

# https://github.com/zimfw/completion
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.cache/zsh/.zcompcache
zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit -C -d ~/.cache/zsh/.zcompdump

# fzf-tab needs to be loaded after compinit, but before plugins which 
# will wrap widgetssuch as zsh-autosuggestions or fast-syntax-highlighting!!
# https://github.com/Aloxaf/fzf-tab/issues/24
# https://github.com/yutkat/dotfiles/blob/main/.config/zsh/rc/completion.zsh
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

export _ZL_DATA=$HOME/.cache/zsh/.zlua
zinit ice atload"eval $(lua $HOME/.local/share/zinit/plugins/skywind3000---z.lua/z.lua --init zsh once enhanced fzf)"
zinit light skywind3000/z.lua

zinit wait'1' lucid for \
  OMZP::colored-man-pages \
  OMZP::gpg-agent \
  OMZP::extract

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
