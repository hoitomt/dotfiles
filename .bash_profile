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
export PATH="$PATH:$HOME/.local/bin"

PS1="$GREEN\$(parse_git_branch) $NO_COLOUR\W $ "
export PS1="\$(dev_info)$PS1"

# iTerm2 Set the tab title
export PROMPT_COMMAND='echo -ne "\\033]0;${PWD/#$HOME/~}\\007"'

# sbin for nginx
export PATH=$PATH:/usr/local/sbin

export PATH="$PATH:/usr/local/git/bin"

# local bin dir
export PATH="$PATH:$HOME/bin"

# Binstubs
export PATH="$PATH:$HOME/.bundle/binstubs"

# Homebrew Paths
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/michaelhoitomt/.bash_profile
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# autoenv by homebrew
source /opt/homebrew/opt/autoenv/activate.sh

# Added by Homebrew
export PATH="$PATH:/usr/local/sbin"

# Java Home
export JAVA_HOME=$(/usr/libexec/java_home)

# pyenv
eval "$(pyenv init -)"

# pyenv virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Homebrew autocompletions
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"
