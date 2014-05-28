. ~/.bash_aliases

PATH="/usr/local/bin:$PATH"
PATH="/Users/hoitomt/Dropbox/bin:$PATH"

function parse_git_branch () {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

# Command Prompt
function dev_info {
  echo "[$(ruby -e 'print RUBY_VERSION')]"
}
PS1="$RED\$(parse_git_branch) $NO_COLOUR\W $ "
export PS1="\$(dev_info)$PS1"

# iTerm2 Set the tab title
export PROMPT_COMMAND='echo -ne "\\033]0;${PWD/#$HOME/~}\\007"'

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
if [ -f /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh ]; then
    . /opt/local/share/doc/git-core/contrib/completion/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

if [ -f ~/git-completion.bash ]; then
  . ~/git-completion.bash
fi

# Play
PLAY_HOME=/usr/local/bin/play
PATH=$PATH:$PLAY_HOME

# Scala
SCALA_HOME=/usr/bin/scala/bin
PATH=$PATH:$SCALA_HOME

# sbin for nginx
PATH=$PATH:/usr/local/sbin

# Mysql
PATH=$PATH:/usr/local/mysql/bin

# Node
PATH=$PATH:/usr/local/share/npm/bin

# Android
PATH=$PATH:$HOME/bin/android/sdk/tools

#JBoss
JBOSS_HOME=/Users/hoitomt/local/vendor/jboss-as-7.1.1.Final

export PLAY_HOME CLASSPATH PATH

# local bin dir
export PATH="/Users/hoitomt/bin:$PATH"

# Binstubs
export PATH=./.bundle/binstubs:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# rbenv
eval "$(rbenv init -)"