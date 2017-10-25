# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime ssh-agent)

# plugins=(cabal common-aliases fabric git debian dirhistory git-extras knife mercurial mvn pyenv pylint python screen ssh-agent sudo vagrant web-search history-substring-search zsh-syntax-highlighting) # Lefteris pluggins

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
export LS_COLORS=$LS_COLORS:"*.py=00;33":"*.ipynb=00;32"

alias l='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'
alias g='grep'
alias ..='cd ..'
# "\033c" is ESC c which is the VT-XXX escape sequence for "Full Reset (RIS)"
alias clc='printf "\033c"' # clear screen and history

alias rm='rm -i'
alias less='less -S'
alias m='less'
alias top='htop'
alias e='exit'
alias c='code -r' # visual studio code with -r to force reusing existing window
alias hh='history'
alias h='fc -il -l -20' # last 20 of history
alias lsr='tree'
alias s='subl'
alias tree='tree -I ".git"'

alias gg='git grep'
alias gl='git log'
alias gs='git status'
alias gsb='git status -sb'
alias ga='git add'
alias gap='git add --patch'
alias gb='git branch'
alias gbd='git branch -d'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gc='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gp='git pull'
alias gs='git show'
alias greb='curbranch=`git rev-parse --abbrev-ref HEAD`; git stash; git checkout master; git pull; git co $curbranch; git rebase master; git stash pop' # pull and rebase on master

alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.RunningFor}}"'

export PAGER="/usr/bin/less -S" # no word-wrap in psql outputs

export PATH="$HOME/lib/anaconda2/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# manually installed tex for notebook https://nbconvert.readthedocs.io/en/latest/install.html#installing-tex.
export PATH="/usr/local/texlive/2016/bin/x86_64-linux:$PATH"

GIT_PROMPT_ONLY_IN_REPO=1

# Sublime as default editor for git comments
export VISUAL=vim

# Workaround for a bug preventing display of menu bars https://bugs.launchpad.net/ubuntu/+source/appmenu-qt5/+bug/1307619
# unset QT_QPA_PLATFORMTHEME

# Customize prompt with colors, git info and Python env info
PS1_LOGIN_COLOR="049"
if [ $USERNAME = "vagrant" ]; then
    PS1_LOGIN_COLOR="226"
fi
if [ $HOST = "mm" -o $HOST = "hanson-mm" -o $HOST = "hanson-gateways" ]; then
    PS1_LOGIN_COLOR="160"
fi
if [ $HOST = "quant" ]; then
    PS1_LOGIN_COLOR="106"
fi
export PS1='$FG['$PS1_LOGIN_COLOR']%n@%M%f %* %B$FG[051]%~%b $(git_prompt_info)'$'\n''${ret_status}%{$reset_color%}'

if [ $HOST = "taf2" ]; then
    # Extra aliased taf2 specific
    source $HOME/.zshrc_taf2

    source activate quantdata
    export PS1='$FG[046]'$PS1

    # The next line updates PATH for the Google Cloud SDK.
    source "$HOME/lib/google-cloud-sdk/path.zsh.inc"
    # The next line enables shell command completion for gcloud.
    source "$HOME/lib/google-cloud-sdk/completion.zsh.inc"

    # Remap the CAPSLOCK key
    setxkbmap -option caps:none
    setxkbmap -option caps:escape

    alias logs="multitail -CS my_logs --mergeall ~/log/*.log" # not so usefull
fi

if [ $USERNAME = "vagrant" -o $HOST = "mm" -o $HOST = "hanson-mm" -o $HOST = "hanson-gateways" ]; then
    alias logs="multitail -CS my_logs --mergeall /var/log/docker/*/$(date +'%Y-%m-%d').$(hostname).log"
fi

# Pluggin to autosuggest
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
