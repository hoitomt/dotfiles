source ~/.bash_aliases

[ -r ~/.bashrc ] && source ~/.bashrc

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

# OSX Catalina shows a message about zsh being the default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

# Created by `userpath` on 2019-12-05 16:37:12
export PATH="$PATH:/Users/mhoitomt/.local/bin"

PS1="$GREEN\$(parse_git_branch) $NO_COLOUR\W $ "
export PS1="\$(dev_info)$PS1"

# iTerm2 Set the tab title
export PROMPT_COMMAND='echo -ne "\\033]0;${PWD/#$HOME/~}\\007"'

# sbin for nginx
export PATH=$PATH:/usr/local/sbin

export PATH="$PATH:/usr/local/git/bin"

# local bin dir
export PATH="$PATH:/Users/mhoitomt/bin"

# Binstubs
export PATH="$PATH:$HOME/.bundle/binstubs"

# Go by Homebrew
export GOPATH=$HOME/golang
# export GOROOT=/usr/local/bin/go
export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

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

# pyenv
eval "$(pyenv init -)"

# pyenv virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Used by ruby build to keep up to date with ssl
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"

# Initialize Node and NVM in every directory
export NVM_DIR="/Users/mhoitomt/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Run nvm use every time we enter a directory.
enter_directory() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  PREV_PWD=$PWD
  [[ -f ".nvmrc" ]] && nvm use
}

export PROMPT_COMMAND=enter_directory
