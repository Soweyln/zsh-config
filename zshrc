# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="gentoo"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github git-flow cap gem lol zsh-syntax-highlighting bundler heroku vim zsh-autosuggestions)

export UNBUNDLED_COMMANDS=ruby

source /etc/profile
source $ZSH/oh-my-zsh.sh

unsetopt nomatch
unsetopt correctall

# Customize to your needs...
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

#bindkey "\e[H" beginning-of-line
#bindkey "\e[F" end-of-line
#bindkey "\e[1;5D" backward-word
#bindkey "\e[1;5C" forward-word
#bindkey "^[OD" backward-word
#bindkey "^[OC" forward-word
bindkey ^l end-of-line

alias noh="unsetopt sharehistory"

unsetopt auto_name_dirs # rvm_rvmrc_cwd fix
unset RUBYOPT

alias nogit="disable_git_prompt_info; compdef -d git"
alias nog="nogit"
alias npm_bin="PATH=`pwd`/node_modules/.bin:$PATH; rehash"

PATH=~/bin/:~/node_modules/.bin/:$PATH
export EDITOR=vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
cd . # to rvm reload

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PROMPT="%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n:%{$fg_bold[blue]%}%c %# %{$reset_color%}"

# Do not show hidden files in the list
set match-hidden-files off
 
# Auto complete ignoring case
set show-all-if-ambiguous on
set completion-ignore-case on

# Hostname
HOSTNAME=Bin

# Android path
export PATH=/srv/profiler/current/opt/android-sdk-linux/platform-tools:$PATH

export PATH=~/Dev/env/adt/sdk/tools/:~/Dev/env/adt/sdk/platform-tools/:~/Dev/env/adt/ndk/:~/Dev/env/adt/sdk/build-tools/21.1.2/:$PATH

export M2_HOME=~/Dev/env/maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2:$PATH
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
export PATH=$JAVA_HOME/bin:$PATH

export PATH=/usr/local/mysql/bin:$PATH

export XAUTHORITY=~/.Xauthority

export ANDROID_HOME=~/Dev/env/adt/sdk

export ANDROID_VIEW_CLIENT_HOME=~/AndroidViewClient-master/src

export PATH=/usr/local/bin:$PATH

alias nd1='ssh ec2-user@nat.nimbledroid.com'
alias nd2='ssh ec2-user@52.8.52.214'
alias nd3='ssh ec2-user@52.3.158.229'
alias tmux='tmux -2'
alias vpn1='sudo openvpn /home/shenbin/nimbledroid/nimbleweb-kitchen/vpn-client-conf/anonymous-ubuntu.ovpn'
alias vpn2='sudo openvpn /home/shenbin/nimbledroid/nimbleweb-kitchen/vpn-client-conf/staging-ubuntu.ovpn'
alias vpn3='sudo openvpn /home/shenbin/nimbledroid/nimbleweb-kitchen/vpn-client-conf/testing-ubuntu.ovpn'

alias jstags='find -E . -type f -regex ".*.(js|jsx)" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'

export NVM_DIR="/Users/shenb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
