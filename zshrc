export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="gentoo"
export DISABLE_AUTO_UPDATE="true"
# export CASE_SENSITIVE="true"

plugins=(git github git-flow cap gem lol zsh-syntax-highlighting bundler heroku vim zsh-autosuggestions)

export UNBUNDLED_COMMANDS=ruby

source /etc/profile
source $ZSH/oh-my-zsh.sh

unsetopt nomatch
unsetopt correctall

LS_COLORS='no=00;32:fi=00:di=00;34:ln=01;36:pi=04;33:so=01;35:bd=33;04:cd=33;04:or=31;01:ex=00;32:*.rtf=00;33:*.txt=00;33:*.html=00;33:*.doc=00;33:*.pdf=00;33:*.ps=00;33:*.sit=00;31:*.hqx=00;31:*.bin=00;31:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.deb=00;31:*.dmg=00;36:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.mpg=00;37:*.avi=00;37:*.gl=00;37:*.dl=00;37:*.mov=00;37:*.mp3=00;35:'
export LS_COLORS;
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

alias noh="unsetopt sharehistory"

unsetopt auto_name_dirs # rvm_rvmrc_cwd fix
unset RUBYOPT

alias nogit="disable_git_prompt_info; compdef -d git"
alias nog="nogit"
alias npm_bin="PATH=`pwd`/node_modules/.bin:$PATH; rehash"

export PROMPT="%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n:%{$fg_bold[blue]%}%c %# %{$reset_color%}"

# Do not show hidden files in the list
set match-hidden-files off
 
# Auto complete ignoring case
set show-all-if-ambiguous on
set completion-ignore-case on

HOSTNAME=Bin

export NVM_DIR="/Users/bin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
cd . # to rvm reload
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PIP_INDEX_URL=https://devpi.hioscar.com/root/oscar/+simple/

export WORKON_HOME=$HOME/.virtualenvs

export PATH=/usr/local/bin:$PATH
export DYLD_FORCE_FLAT_NAMESPACE=1

export PATH="/usr/local/opt/mysql/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/icu4c/include"

# export PATH=/srv/profiler/current/opt/android-sdk-linux/platform-tools:$PATH
# export PATH=~/Dev/env/adt/sdk/tools/:~/Dev/env/adt/sdk/platform-tools/:~/Dev/env/adt/ndk/:~/Dev/env/adt/sdk/build-tools/21.1.2/:$PATH
# export ANDROID_HOME=~/Dev/env/adt/sdk
# export ANDROID_VIEW_CLIENT_HOME=~/AndroidViewClient-master/src

export EDITOR=vim
export GIT_EDITOR='/usr/local/bin/vim'

alias tmux='tmux -2'
alias vim='/usr/local/bin/vim'
alias jstags='find . -type f -iregex .*\.js$ -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'

eval "$(pyenv init -)"
pyenv virtualenvwrapper
