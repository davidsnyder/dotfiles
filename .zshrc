export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.jetbrains:$PATH
export PATH=$PATH:/Users/davidsnyder/Development/jask/nebula/scripts
export PATH=$PATH:/Users/davidsnyder/Development/jask/bulkhead/scripts
export PATH="$PATH:/Users/davidsnyder/Library/Application Support/Coursier/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export ZSH="${HOME}/.oh-my-zsh"

source ~/.artifactory_creds.sh

#load RBenv
eval "$(rbenv init -)"

#load python binaries
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Go development
export GOPATH="${HOME}/.go"
export PATH="$PATH:${GOPATH}/bin:usr/local/go/bin"

test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.c"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# User configuration

# Preferred editor for local and remote sessions
export EDITOR='TERM=xterm-256color /usr/local/bin/emacs -nw'
alias emacs='TERM=xterm-256color /usr/local/bin/emacs -nw'

#ssh-agent -s
#ssh-add -l

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

source $ZSH/oh-my-zsh.sh
source /dev/stdin <<< "$(/Users/davidsnyder/.devcli/dev --init)"
