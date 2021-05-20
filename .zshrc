# Path to your oh-my-zsh installation.
export ZSH=/Users/nadeemshabir/.oh-my-zsh
#export DASHT_DOCSETS_DIR=~/Library/Application\ Support/Dash/DocSets/
[[ $TMUX = "" ]] && export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

typeset -g POWERLEVEL9K_MODE='nerdfont-complete'
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_beginning
typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─'
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%F{blue}├─'
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰%f '
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%F{blue}─╮'
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX='%F{blue}─┤'
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%F{blue}─╯'

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir dir_writable vcs)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status kubecontext command_execution_time time battery)

typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
typeset -g POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_BACKGROUND=black
typeset -g POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_FOREGROUND=cyan

typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='·'
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=
if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
    # The color of the filler. You'll probably want to match the color of POWERLEVEL9K_MULTILINE
    # ornaments defined above.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=242
    # Start filler from the edge of the screen if there are no left segments on the first line.
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
    # End filler on the edge of the screen if there are no right segments on the first line.
    typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
fi

typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
      # '*prod*'  PROD    # These values are examples that are unlikely
      # '*test*'  TEST    # to match your needs. Customize them as needed.
      '*'       DEFAULT)
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=0
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND=69

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize fast-syntax-highlighting zsh-autosuggestions dune-quotes colored-man-pages)

# User configuration

#export PATH="$PATH:/Users/nadeemshabir/.rvm/gems/ruby-1.9.3-p448/bin:/Users/nadeemshabir/.rvm/gems/ruby-1.9.3-p448@global/bin:/Users/nadeemshabir/.rvm/rubies/ruby-1.9.3-p448/bin:/Users/nadeemshabir/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

export PATH="/Users/nadeemshabir/.pyenv/bin:$PATH"

export PATH="$PATH:/Users/nadeemshabir/.cargo/bin"
export PATH="$PATH:/Users/nadeemshabir/go/bin"
export PATH="$PATH:/Users/nadeemshabir/Development/bin"

source $ZSH/oh-my-zsh.sh

source <(kubectl completion zsh)
# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR=nvim

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export EDITOR=nvim
setopt AUTO_CD

export DEFAULT_THEME="Spacemacs"
export SSH_DEFAULT_THEME="Spacemacs"
export SSH_DANGER_THEME="Production"
export SSH_WARNING_THEME="Staging"
export DEVELOPMENT_WORK_DIR=/Users/nadeemshabir/Development/talis

export GOOGLER_COLORS=dhdxxy

# dont store duplicate commands in the history
export HISTCONTROL=ignoreboth:erasedups

bindkey \^U backward-kill-line

alias ll="ls -alh"
alias c='pygmentize -O style=monokai,bg=dark -f console256 -g'
alias applisten="lsof -P -i -n"
alias vless="/opt/local/share/vim/vim74/macros/less.sh"

source ~/.aliases
source ~/.server_aliases

source <("$DEVELOPMENT_WORK_DIR/infra/docker-compose-dev.sh" completion zsh docker-compose-dev dcd)
# LESS with syntax highlighting
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -X -F '

autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

export PATH="$PATH:$HOME/.ec2.cli"
# script_dir=$(dirname $0)
if [ -f ~/.ec2.cli/completion.bash ]; then
  source ~/.ec2.cli/completion.bash
fi

export NVM_DIR="/Users/nadeemshabir/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# use peco to search through zsh history
if which peco &> /dev/null; then
  function peco_select_history() {
    local tac
    { which gtac &> /dev/null && tac="gtac" } || \
      { which tac &> /dev/null && tac="tac" } || \
        tac="tail -r"
    BUFFER=$(fc -l -n 1 | eval $tac | \
      peco --layout=bottom-up --query "$LBUFFER")
    CURSOR=$#BUFFER # move cursor
    zle -R -c       # refresh
  }

  zle -N peco_select_history
  bindkey '^x^s' peco_select_history
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.fzf.zsh

source /opt/local/share/nvm/init-nvm.sh

# Talis CLI Tools
#PATH=$PATH:/Users/nadeemshabir/Development/talis/talis-cli-tools/bin:/Users/nadeemshabir/.local/bin
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
PATH=/Users/nadeemshabir/Development/talis/talis-cli-tools/bin:$PATH:/Users/nadeemshabir/.local/bin

# Talis CLI completions
if [ -f '/Users/nadeemshabir/Development/talis/talis-cli-tools/completions/completions.zsh' ]; then
  source '/Users/nadeemshabir/Development/talis/talis-cli-tools/completions/completions.zsh'
fi



#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####


