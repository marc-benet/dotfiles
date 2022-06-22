# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/opt/python/libexec/bin:$HOME/bin:/usr/local/bin:$HOME/.poetry/bin:$PATH
# For a full list of active aliases, run `alias`.

# Editors Alias
alias vim="nvim"

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias zshconfig="vim ~/.zshrc"
alias bashconfig="vim ~/.bash_profile"

# git aliases
alias gitrm="git fetch upstream && git rebase upstream/master && git push --set-upstream origin master"
alias gitrmn="git fetch upstream && git rebase upstream/main && git push --set-upstream origin main"
alias gitrd="git fetch upstream && git rebase upstream/develop && git push --set-upstream origin develop"
alias gits="git status"
alias gitgr="git log --oneline --decorate --all --graph"

# EXA alias
alias exal="exa --long --git --header"

# Utils
alias home="cd ~/"
alias sites="cd ~/Sites"
alias copyssh="pbcopy < ~/.ssh/id_rsa.pub"
alias venv="source venv/bin/activate"
alias .venv="source .venv/bin/activate"
alias publicip="curl ifconfig.co"
alias raspip="sudo sh ~/.discover-raspi.sh"
alias weather="curl wttr.in/barcelona && curl v2.wttr.in/barcelona"

# Docker
alias docker-image-clean="docker images -aq | xargs docker rmi"
alias docker-containers-stop="echo '🛑 stopping'  && docker ps -asq | xargs docker stop"
alias docker-containers-rm="docker-containers-stop && echo '🧹 removing' && docker ps -asq | xargs docker rm"
alias docker-locura="docker-containers-rm && echo '♽ removing volumes' && docker volume prune && echo '🧻 wipping all images' && docker-image-clean"

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# KUBECONFIG PATH
export KUBECONFIG="_LIST_OF_KUBECONFIG_FILES"

# KUBECTX & KUBENS
export KUBECTX_CURRENT_FGCOLOR=$(tput setaf 0) # black text
export KUBECTX_CURRENT_BGCOLOR=$(tput setab 7) # white background
export KUBENS_CURRENT_FGCOLOR=$(tput setaf 0) # black text
export KUBENS_CURRENT_BGCOLOR=$(tput setab 7) # white background

