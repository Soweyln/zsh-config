export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="gentoo"
export DISABLE_AUTO_UPDATE=true

plugins=(git gitfast vi-mode zsh-syntax-highlighting zsh-autosuggestions) # bundler github git-flow cap gem lol heroku

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=15

unsetopt nomatch
unsetopt correctall
unsetopt auto_name_dirs

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

bindkey ^l end-of-line
bindkey ^r history-incremental-pattern-search-backward
bindkey ^p history-search-backward
bindkey ^n history-search-forward

export DYLD_FORCE_FLAT_NAMESPACE=1
export EDITOR=vim
export GIT_EDITOR='/usr/local/bin/vim'
export NVM_DIR="/Users/bin/.nvm"
export PIP_INDEX_URL=https://devpi.hioscar.com/root/oscar/+simple/
# export PYTHONPATH=$PYTHONPATH:/Users/bin/dev/oscar/python/
# export PYTHONPATH=$PYTHONPATH:/Users/bin/dev/oscar/python/batmobile
export PROMPT="%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n:%{$fg_bold[blue]%}%c %# %{$reset_color%}"
export WORKON_HOME=$HOME/.virtualenvs

export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/icu4c/include"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH
export PATH=$HOME/.fastlane/bin:$PATH
export PATH=/usr/local/opt/mysql/bin:$PATH
export PATH=/usr/local/opt/icu4c/bin:$PATH
export PATH=/usr/local/opt/imagemagick@6/bin:$PATH
export PATH=/Users/bin/Library/Android/sdk/platform-tools/:$PATH

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

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

alias jstags='find -E . -type f -iregex ".*\.jsx?$" -not -path "*node_modules*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
alias nog="nogit"
alias nogit="disable_git_prompt_info; compdef -d git"
alias npm_bin="PATH=`pwd`/node_modules/.bin:$PATH; rehash"
alias tmux='tmux -2'
alias workon='lpyenv && workon'

alias r_hippo='python python/hippo/run.py'
alias r_manhattan='python python/manhattan/run.py'
alias r_rosco='python internal-site/internal_site/run.py'
alias r_webpack_hippo='scripts/webpack_dev.js hippo'
alias r_webpack_manhattan='scripts/webpack_dev.js manhattan'
alias r_webpack_rosco='scripts/webpack_dev.js rosco'

alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

lnvm
