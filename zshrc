# Function
include () {
  [[ -f "$1" ]] && source "$1"
}

lpyenv() {
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}

lnvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

lrvm() {
  [ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"
}

ldocker() {
  eval "$(docker-machine env)"
}

# General
export DYLD_FORCE_FLAT_NAMESPACE=1
export DISABLE_AUTO_UPDATE=true
export EDITOR=vim
export ZSH=$HOME/.oh-my-zsh

unset ZSH_THEME

plugins=(
  git
  gitfast
  vi-mode
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  kubectl
  terraform
)

include $HOME/.fzf.zsh
include $HOME/.zshrc.local
include $ZSH/oh-my-zsh.sh
include $HOME/.zsh/completions/tmuxinator

if [ -z "$ZSH_THEME" ]; then
  export ZSH_THEME="gentoo"
  export PROMPT="%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n:%{$fg_bold[blue]%}%c %# %{$reset_color%}"
fi

unsetopt nomatch
unsetopt correctall
unsetopt auto_name_dirs

# Autosuggest
ZSH_AUTOSUGGEST_USE_ASYNC=1

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Styles
LS_COLORS='no=00;32:fi=00:di=00;34:ln=01;36:pi=04;33:so=01;35:bd=33;04:cd=33;04:or=31;01:ex=00;32:*.rtf=00;33:*.txt=00;33:*.html=00;33:*.doc=00;33:*.pdf=00;33:*.ps=00;33:*.sit=00;31:*.hqx=00;31:*.bin=00;31:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.deb=00;31:*.dmg=00;36:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.mpg=00;37:*.avi=00;37:*.gl=00;37:*.dl=00;37:*.mov=00;37:*.mp3=00;35:'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

ZSH_HIGHLIGHT_STYLES+=(
  default                       'none'
  unknown-token                 'fg=red,bold'
  reserved-word                 'fg=yellow'
  alias                         'fg=none,bold'
  builtin                       'fg=none,bold'
  function                      'fg=none,bold'
  command                       'fg=none,bold'
  hashed-command                'fg=none,bold'
  path                          'fg=cyan'
  globbing                      'fg=cyan'
  history-expansion             'fg=blue'
  single-hyphen-option          'fg=magenta'
  double-hyphen-option          'fg=magenta'
  back-quoted-argument          'fg=magenta,bold'
  single-quoted-argument        'fg=green'
  double-quoted-argument        'fg=green'
  dollar-double-quoted-argument 'fg=cyan'
  back-double-quoted-argument   'fg=cyan'
  assign                        'none'
)

# Mapping
bindkey ^a beginning-of-line
bindkey ^e end-of-line
bindkey ^h beginning-of-line
bindkey ^l end-of-line
bindkey ^u backward-kill-line
bindkey ^k kill-line
bindkey ^r history-incremental-pattern-search-backward
bindkey ^p history-beginning-search-backward
bindkey ^n history-beginning-search-forward
bindkey '^[^?' backward-kill-word

# Path
export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/icu4c/include"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH
export PATH=$HOME/.fastlane/bin:$PATH
export PATH=/usr/local/opt/mysql/bin:$PATH
export PATH=/usr/local/opt/icu4c/bin:$PATH
export PATH=/usr/local/opt/imagemagick@6/bin:$PATH
export PATH=$HOME/.virtualenvs/vim/bin:$PATH
export PATH=$HOME/.virtualenvs/vim3/bin:$PATH

export FPATH=$DATA_REPO/engshare/bin:$FPATH
export NVM_DIR="$HOME/.nvm"
export WORKON_HOME=$HOME/.virtualenvs
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"
export ANDROID_HOME=$HOME/Library/Android/sdk/
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

include /usr/local/bin/virtualenvwrapper_lazy.sh
include $HOME/google-cloud-sdk/path.zsh.inc
include $HOME/google-cloud-sdk/completion.zsh.inc
include $HOME/.fzf.zsh

export PYENV_ROOT=$HOME/.pyenv
export PATH=$HOME/.pyenv/bin:$PATH

# Alias
alias v=vim

alias ta='tmux a'
alias tls='tmux ls'
alias ts='tmuxinator start'
alias te='tmuxinator edit'

alias gb='git --no-pager branch'
alias gs='git show'
alias gshow='git show'
alias gsta='git stash'
alias gstaa='git stash -u'

alias pg_start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias pg_stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias toggle_wifi='sudo ifconfig en0 down && dscacheutil -flushcache && sudo killall -HUP mDNSResponder && sudo ifconfig en0 up'

autoload -U compinit
compinit
