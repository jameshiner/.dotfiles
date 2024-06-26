# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="agnoster"
# ZSH_THEME="awesomepanda"
# ZSH_THEME="afowler"
# ZSH_THEME="sorin"
# ZSH_THEME="gentoo"
# ZSH_THEME="jispwoso"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    z
    colored-man-pages
    colorize
    zsh-syntax-highlighting
    rvm
    nvm
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit

# Load Pure Prompt
prompt pure
zstyle :prompt:pure:path color 'cyan'
zstyle :prompt:pure:git:branch color 'magenta'
zstyle ':prompt:pure:prompt:*' color 'white'

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
# aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ide="sh ~/scripts/ide.sh"

alias home='cd ~'
alias h=home
alias hi=history
alias c=clear
alias u="cd .."
alias ls="ls -G"
alias la="ls -A"
alias ll="la -l"
alias g=git
alias tc="clear && tmux clear-history"
alias reload="source ~/.zshrc"
alias pls='sudo $(fc -ln -1)'
alias plz='sudo $(fc -ln -1)'
alias nginx-restart='sudo nginx -s stop && sudo nginx'
alias nginx-stop='sudo nginx -s stop'
alias nano='/opt/homebrew/bin/nano/'
alias mkdir="mkdir -pv"
alias nano="nano -l"
alias py="python3"
alias python="python3"
alias vim="nvim"
alias weather="curl wttr.in/"
alias weatherhelp="curl wttr.in/:help"

# wellsky
# alias sar="sencha app refresh"
# alias sabdd="sencha app build desktop development"
# alias sabdp="sencha app build desktop production"

# square
# alias activate="source ~/Development/dashboard/frontend/dashboard/env/bin/activate"
# alias dev="cd ~/Development/dashboard/frontend/dashboard/"
# alias devs="activate && cd ~/Development/dashboard/frontend/dashboard/ && yarn start"
# alias devd="cd ~/Development/dashboard/frontend/@dashboard/rst-ui"
# alias devds="activate && cd ~/Development/dashboard/frontend/@dashboard/rst-ui && yarn start"
# alias egc="ember generate component -gc"

# ls after cd
mkcd() { mkdir "$1" && cd "$1"; }
function cd {
    if [ -z "$1" ]; then
        builtin cd
    else
        builtin cd "$1"
    fi
    if [ $? -eq 0 ]; then
        ls
    fi
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
