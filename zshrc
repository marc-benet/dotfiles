# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/marc/.oh-my-zsh"
export EDITOR=nvim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  ansible
  git
  autojump
  command-not-found
  common-aliases
  compleat
  macos
  python
  docker
  docker-machine
  docker-compose
  iterm2
  npm
  nvm
  postgres
  python
  kubectl
  encode64
  jsontools
  pip
  poetry
  sudo
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Load Theme PowerLevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
source ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme

# Config Theme Powerlevel9k
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status time ssh dir dir_writable vcs virtualenv command_execution_time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_OK_BACKGROUND='darkgrey'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" $ "
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='darkgrey'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_VCS_GIT_ICON=""
#POWERLEVEL9K_PYENV_BACKGROUND='yellow'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='blue'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
POWERLEVEL9K_VIRTUALENV_ICON="\uf81f"
POWERLEVEL9K_DIR_HOME_BACKGROUND='cornsilk1'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='cornsilk1'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='darkred'
POWERLEVEL9K_TIME_BACKGROUND="darkgrey"
POWERLEVEL9K_TIME_FOREGROUND="lightgrey"
POWERLEVEL9K_TIME_ICON=""
POWERLEVEL9K_TIME_ICON_FOREGROUND="lightgrey"
POWERLEVEL9K_USER_BACKGROUND="white"
POWERLEVEL9K_USER_FOREGROUND="black"
#POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=true
#POWERLEVEL9K_USER_ICON="\uF1C9" # 
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # <
POWERLEVEL9K_CUSTOM_ICONS="echo -n '\uf302 \ue796'"
POWERLEVEL9K_CUSTOM_ICONS_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_ICONS_BACKGROUND="blue"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###############################
# Personal aliases and config #
###############################
if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi
###############################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Highlighting syntax
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(stern --completion=zsh)

##########################
# Projen auto completion #
##########################
###-begin-projen-completions-###
#
# yargs command completion script
#
# Installation: projen completion >> ~/.zshrc
#    or projen completion >> ~/.zsh_profile on OSX.
#
_projen_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" projen --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _projen_yargs_completions projen
###-end-projen-completions-###

