# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.poetry/bin:$PATH

# For a full list of active aliases, run `alias`.

# Editors Alias
alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"

# git aliases
alias gitrm="git fetch upstream && git rebase upstream/master && git push --set-upstream origin master"
alias gitrd="git fetch upstream && git rebase upstream/develop && git push --set-upstream origin develop"
alias gits="git status"
alias gitgr="git log --oneline --decorate --all --graph"

# Python alias
alias switch-py37="brew switch python 3.7.6_1"
alias switch-py38="brew switch python 3.8.1_1"

# EXA alias
alias exal="exa --long --git --header"

# SublimeText alias
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Utils
alias pybase64enc="python3 ~/.scripts/base64enc.py"
alias pybase64dec="python3 ~/.scripts/base64dec.py"

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GO config
export GOPATH=~/go
