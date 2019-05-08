. ~/.bash_aliases

# Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

# Command Prompt
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
function dev_info {
  echo "[$(ruby -e 'print RUBY_VERSION')]"
}

# Go Env setup - https://github.com/Lookingglass/scoutvision/wiki/Golang
function cdgo () {
    echo "Run CD"
    builtin cd "$@"
    if [ -f ".go" ] ; then
        echo "Update the GOPATH to ${PWD}"
        export GOPATH=${PWD}
    fi
}

# Git Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

PS1="$GREEN\$(parse_git_branch) $NO_COLOUR\W $ "
export PS1="\$(dev_info)$PS1"

# iTerm2 Set the tab title
export PROMPT_COMMAND='echo -ne "\\033]0;${PWD/#$HOME/~}\\007"'

# sbin for nginx
# export PATH=$PATH:/usr/local/sbin

export PATH="$PATH:/usr/local/git/bin"

# local bin dir
export PATH="$PATH:/Users/mhoitomt/bin"

# Dropbox
export PATH="$PATH:/Users/mhoitomt/Dropbox/bin"

# Binstubs
export PATH="$PATH:$HOME/.bundle/binstubs"

# Go by Homebrew
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# RabbitMQ by Homebrew
export PATH="$PATH:/usr/local/opt/rabbitmq/sbin"

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"
source /usr/local/opt/autoenv/activate.sh

# Added by Homebrew
export PATH="$PATH:/usr/local/sbin"

# Java Home
export JAVA_HOME=$(/usr/libexec/java_home)

# NiFi Repo
export NIFI_REPO_PATH="/Users/mhoitomt/Code/cip-nifi"

# Postgres
export PATH="$PATH:/usr/local/opt/postgresql@9.4/bin"
export PATH="$PATH:/usr/local/opt/postgresql@9.4/include"

# Fix Postgres for hummingbird (C-compilers)
export LDFLAGS="-L/usr/local/opt/postgresql@9.4/lib"
export CPPFLAGS="-I/usr/local/opt/postgresql@9.4/include"
export PKG_CONFIG_PATH="/usr/local/opt/postgresql@9.4/lib/pkgconfig"
export NIFI_HOME="/Users/mhoitomt/Code/nifi-1.4.0"
