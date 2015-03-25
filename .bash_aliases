alias c="clear"

alias ip="ifconfig | grep -oE 'inet (.*) netmask .* broadcast' | awk '{print $2}'"

# Code
alias cdc="cd ~/code"

# Otozip
alias cdo="cd ~/Code/Otozip/otozip"

# Primedia Source
alias cds="cd ~/source"

# Nginx Paths
alias ngp="nginxp.sh"

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

# Git
alias g="git"
alias gc="g checkout"
alias gcd="gc dev"
alias glg="g lg"
