# Determine current IP address
alias ip="ifconfig | grep -oE 'inet (.*) netmask .* broadcast' | awk '{print $2}'"
alias ll="ls -la"

# Code
alias cdc="cd ~/Code"
alias cdg="cd ~/golang/src/github.com/Lookingglass"

# Start Memcached
alias memcached_start="/usr/local/opt/memcached/bin/memcached"

# Bundler
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

# Bundler Rails
alias bails="be rails"
alias bake="be rake"
alias bspec="be rspec"

# Git
alias g="git"
alias gc="g checkout"
alias gcm="gc master"
alias gcd="gc develop"
alias glg="g lg"

# Docker
alias dc="docker-compose"
alias dce="dc exec"
alias dcew="dce web"
alias dcbe="dcew bundle exec"
alias dake="dcew bundle exec rake"
alias dails="dcew bundle exec rails"
