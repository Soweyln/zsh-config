export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="gentoo"

plugins=(git gitfast vi-mode zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

source $ZSH/oh-my-zsh.sh

unsetopt nomatch
unsetopt correctall
unsetopt auto_name_dirs

# General
export DISABLE_AUTO_UPDATE=true
export EDITOR=vim

# Autosuggest
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=15

# Styles
export PROMPT="%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n:%{$fg_bold[blue]%}%c %# %{$reset_color%}"

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
bindkey ^l end-of-line
bindkey ^r history-incremental-pattern-search-backward
bindkey ^p history-search-backward
bindkey ^n history-search-forward

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

lpyenv() {
  eval "$(pyenv init -)"
  pyenv virtualenvwrapper
}

ldocker() {
  eval "$(docker-machine env)"
}

# Nvim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Alias
alias workon='lpyenv && workon'
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# Local
include $HOME/.zshrc.local

lnvm
