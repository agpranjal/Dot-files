# ------------------------------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Install oh-my-zsh (if not installed)
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="awesomepanda"
ZSH_THEME="robbyrussell"
# ZSH_THEME="../custom/themes/powerlevel10k/powerlevel10k"
# ZSH_THEME="gentoo"
# ZSH_THEME="mh"
# ZSH_THEME="michelebologna"
# ZSH_THEME="minimal"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages 
  zsh-autosuggestions
  #thefuck
  jsontools
  docker
  docker-compose
  aws
  npm 
  pip
  gitfast
  heroku
  pm2
  safe-paste
  themes
  # ufw
  yarn
  zsh-z
  fancy-ctrl-z
  gitignore
  terraform
)

source $ZSH/oh-my-zsh.sh

# Install zsh-autosuggestions (if not installed)
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Use Ctrl-Space to accept zsh suggestion
bindkey "^ " autosuggest-accept

# Install thefuck (if not installed)
if [ ! -x "$(command -v thefuck)" ]; then
  #sudo apt install thefuck -y
fi

eval "$(thefuck --alias)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ------------------------------------------------------------------------
# start tmux when shell starts
# if [[ ! $TERM =~ screen ]]; then
#   export TERM=screen-256color
#   exec tmux -u
# fi

#if [ "$TMUX" = "" ]; then
#  export TERM=screen-256color
#  exec tmux -u
#fi

ZLE_SPACE_SUFFIX_CHARS=$'|&'

export LANG=en_US.UTF-8

export PATH="$PATH:/usr/local/python3/bin"

# ------------------------------------------------------------------------------------
# Load ~/.fzf.zsh if exists, else download fzf and install
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# Install bat (if not installed)
if ! [ -x "$(command -v batcat)" ]; then
  #sudo apt install bat -y
  #sudo ln -s batcat /usr/bin/bat
fi

# Install ripgrep
if ! [ -x "$(command -v rg)" ]; then
  #sudo apt install ripgrep
fi

# Default options for fzf
export FZF_DEFAULT_OPTS="
--cycle
--layout=reverse
--border=sharp
--info=inline
--multi
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-s:toggle'
--bind 'ctrl-a:toggle-all'
--bind 'tab:accept'
"
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"

# Use CTRL-f to trigger fzf (just like Ctrl-T)
# bindkey "^f" fzf-file-widget

# Use CTRL-f to trigger fzf command line completion (instead of CTRL-r)
# bindkey "^f" fzf-history-widget

# ------------------------------------------------------------------------
# Install pyenv (if not already installed)
if [ ! -d ~/.pyenv ]; then
  #sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
  #  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    #libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
      #curl https://pyenv.run | bash
fi

# Add pyenv to PATH
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ------------------------------------------------------------------------
# Set default editor for the shell
if [ -x "$(command -v nvim)" ]; then
  export VISUAL=nvim
elif [ -x "$(command -v vim)" ]; then
  export VISUAL=vim
else
  export VISUAL=vi
fi
export EDITOR="$VISUAL"

# ------------------------------------------------------------------------
# Customised git log
alias gitlog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Config for less pager program
# export LESS='--quit-if-one-screen --incsearch --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-5'
export LESS='--quit-if-one-screen --incsearch --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --no-init --window=-5'

# For Neovide
# alias neovide="neovide --frame NONE --noidle"
alias neovide="neovide --noidle --multigrid --geometry=130x100"

# Aliases for clear and ls
alias cl="clear"
alias cle="clear"
alias clea="clear"
alias rls="ls"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias hdfc-connect="warp-cli delete && warp-cli disconnect && warp-cli teams-enroll retire100"
alias opslyft-connect="warp-cli delete && warp-cli disconnect && warp-cli teams-enroll opslyft"
alias wa="warp-cli account"
alias ws="warp-cli status"
alias wc="warp-cli connect"
alias wd="warp-cli disconnect"

# Max limit of open file descriptors - required for macos
ulimit -n 1024
