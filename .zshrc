# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_MODE='nerdfont-complete'
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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

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

# FZF fuzzy ##############################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"


# VIM mode ################################################################

# Updates editor information when the keymap changes.
export KEYTIMEOUT=1
function zle-keymap-select() {
  # update keymap variable for the prompt
  VI_KEYMAP=$KEYMAP

  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select
zle -N edit-command-line


bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi


# Powerlevel #################################################################

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_STATUS_OK=true

POWERLEVEL9K_COLOR_SCHEME='dark'

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status background_jobs history time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user host dir dir_writable vcs)


POWERLEVEL9K_VI_INSERT_MODE_STRING='%BI%b'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='%BN%b'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='074'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='235'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='220'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='235'

POWERLEVEL9K_HOST_TEMPLATE="%2m"
#POWERLEVEL9K_SSH_ICON="\uf2f6"
#POWERLEVEL9K_HOST_ICON="\uf120"
POWERLEVEL9K_HOST_REMOTE_BACKGROUND="242"
POWERLEVEL9K_HOST_LOCAL_BACKGROUND="242"
POWERLEVEL9K_HOST_REMOTE_FOREGROUND="black"
POWERLEVEL9K_HOST_LOCAL_FOREGROUND="black"

POWERLEVEL9K_TIME_ICON=''
POWERLEVEL9K_TIME_BACKGROUND='244'
POWERLEVEL9K_TIME_FOREGROUND='black'
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

POWERLEVEL9K_USER_DEFAULT_BACKGROUND='211'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_USER_SUDO_BACKGROUND='211'
POWERLEVEL9K_USER_SUDO_FOREGROUND='black'
POWERLEVEL9K_USER_ROOT_BACKGROUND='211'
POWERLEVEL9K_USER_ROOT_FOREGROUND='black'

POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND='211'
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='211'
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='black'

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='238'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='238'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='238'
POWERLEVEL9K_DIR_ETC_FOREGROUND='black'
POWERLEVEL9K_DIR_ETC_BACKGROUND='238'

POWERLEVEL9K_HISTORY_BACKGROUND='242'
POWERLEVEL9K_HISTORY_BACKGROUND='242'

POWERLEVEL9K_STATUS_OK_BACKGROUND='238'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='238'

# shortcuts ######################################################################
alias zshconfig="vi ~/.zshrc"
alias tml="transmission-remote -l"
alias tm="transmission-remote"
