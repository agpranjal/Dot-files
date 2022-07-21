# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Install oh-my-zsh (if not installed)
if [ ! -d ~/.oh-my-zsh ]
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# # set descriptions format to enable group support
# zstyle ':completion:*:descriptions' format '[%d]'
# # set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # preview directory's content with exa when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# # switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="../custom/themes/powerlevel10k/powerlevel10k"
#ZSH_THEME="gentoo"
#ZSH_THEME="mh"
#ZSH_THEME="michelebologna"
#ZSH_THEME="minimal"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages 
  zsh-autosuggestions
  thefuck
  jsontools
  docker
  docker-compose
  aws
  npm 
  pip
  fancy-ctrl-z
  gitfast
  heroku
  pm2
  safe-paste
  # sudo
  themes
  ufw
  yarn
  z
)

source $ZSH/oh-my-zsh.sh

# start tmux when shell starts
if [[ ! $TERM =~ screen ]]; then
  export TERM=screen-256color
  exec tmux -u
fi

ZLE_SPACE_SUFFIX_CHARS=$'|&'

# Load ~/.fzf.zsh if exists, else download fzf and install
if [ -f ~/.fzf.zsh ]
then
  source ~/.fzf.zsh
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# CUSTOM: aliases for clear
alias cl="clear"
alias cle="clear"
alias clea="clear"
alias rls="ls"

# CUSTOM: customised git log
alias gitshow="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

export LANG=en_US.UTF-8

export PATH="$PATH:/usr/local/python3/bin"

# Install thefuck (if not installed)
if [ ! -x "$(command -v thefuck)" ]
then
  sudo apt install thefuck -y
fi

eval "$(thefuck --alias)"

# Install zsh-autosuggestions (if not installed)
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# CUSTOM: use Ctrl-Space to accept zsh suggestion
bindkey "^ " autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Install pyenv (if not already installed)
if [ ! -d ~/.pyenv ]
then
  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
      curl https://pyenv.run | bash
fi

# Add pyenv to PATH
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# CUSTOM: config for less pager program
export LESS='--quit-if-one-screen --incsearch --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-5'

# Install bat (if not installed)
if ! [ -x "$(command -v batcat)" ]
then
  sudo apt install bat -y
fi

# Default options for fzf
export FZF_DEFAULT_OPTS="
--cycle
--layout=reverse
--border=sharp
--info=inline
--multi
--preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-s:toggle'
--bind 'ctrl-a:toggle-all'
--bind 'tab:accept'
"

# Use fd (if installed) as backend for fzf
if [ -x "$(command -v fdfind)" ]
then
  #export FZF_DEFAULT_COMMAND='fdfind . --hidden'
  export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
else
  sudo apt install fd-find -y
  sudo apt install ripgrep
fi

# CUSTOM: use Ctrl-f to trigger fzf (just like Ctrl-T)
bindkey "^f" fzf-file-widget

# CUSTOM: set default editor for the shell
if [ -x "$(command -v nvim)" ]
then
  export VISUAL=nvim
elif [ -x "$(command -v vim)" ]
then
  export VISUAL=vim
else
  export VISUAL=vi
fi
export EDITOR="$VISUAL"
