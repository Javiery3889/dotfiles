# setup prompt
setopt HIST_IGNORE_ALL_DUPS 
setopt SHARE_HISTORY
setopt ALWAYS_TO_END

# configure history file
export HISTFILE=~/.zsh_history
export HISTSIZE=1000  
export SAVEHIST=1000

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
# zinit light-mode for \
    # zdharma-continuum/zinit-annex-as-monitor \
    # zdharma-continuum/zinit-annex-bin-gem-node \
    # zdharma-continuum/zinit-annex-patch-dl \
    # zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

# vi mode
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# pure theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# tries first to complete the current word exactly as its written, before trying case-insensitive or other matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# highlight the current option in the menu list instead of filling it in the prompt
zstyle ':completion:*' menu select

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# set up aliases
alias ls='exa'
alias ll='ls -al'
alias cat='bat'
alias vim='nvim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f "/Users/javier/.ghcup/env" ] && source "/Users/javier/.ghcup/env" # ghcup-env
