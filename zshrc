# Function
include () {
  [[ -f "$1" ]] && source "$1"
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

plugins=(git gitfast vi-mode zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

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
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=15

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
bindkey ^b backward-word
bindkey ^w forward-word
bindkey ^a beginning-of-line
bindkey ^e end-of-line
bindkey ^h beginning-of-line
bindkey ^l end-of-line
bindkey ^u backward-kill-line
bindkey ^k kill-line
bindkey ^r history-incremental-pattern-search-backward
bindkey ^p history-beginning-search-backward
bindkey ^n history-beginning-search-forward

# Path
export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/icu4c/include"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH
export PATH=$HOME/.fastlane/bin:$PATH
export PATH=/usr/local/opt/mysql/bin:$PATH
export PATH=/usr/local/opt/icu4c/bin:$PATH
export PATH=/usr/local/opt/imagemagick@6/bin:$PATH

export NVM_DIR="$HOME/.nvm"
export WORKON_HOME=$HOME/.virtualenvs
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"
export ANDROID_HOME=$HOME/Library/Android/sdk/

include /usr/local/bin/virtualenvwrapper_lazy.sh
include $HOME/google-cloud-sdk/path.zsh.inc
include $HOME/google-cloud-sdk/completion.zsh.inc
include $HOME/.fzf.zsh

# Alias
if type nvim > /dev/null 2>&1; then
  alias vim=nvim
  alias v=nvim
fi

alias ta='tmux a'
alias tls='tmux ls'
alias ts='tmuxinator start'
alias te='tmuxinator edit'

alias pg_start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias pg_stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
