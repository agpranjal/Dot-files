eval $(/opt/homebrew/bin/brew shellenv)
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
  yarn
  z
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

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias wa="warp-cli account"
alias ws="warp-cli status"
alias wc="warp-cli connect"
alias wd="warp-cli disconnect"

# Export AWS KEYS to environment
function export-opslyft-iam()
{
  profile_name="opslyft-iam" \
  export AWS_ACCESS_KEY_ID="$(crudini --get ~/.aws/credentials $profile_name aws_access_key_id)" \
  export AWS_SECRET_ACCESS_KEY="$(crudini --get ~/.aws/credentials $profile_name aws_secret_access_key)"
}

function with-role() {
  role_arn="$1"

  shift 1
  (
  credentials="$(aws sts assume-role --role-arn $role_arn --role-session-name opslyft)" && \
  export AWS_ACCESS_KEY_ID="$(echo $credentials | jq -r '.Credentials.AccessKeyId')" && \
  export AWS_SECRET_ACCESS_KEY="$(echo $credentials | jq -r '.Credentials.SecretAccessKey')" && \
  export AWS_SESSION_TOKEN="$(echo $credentials | jq -r '.Credentials.SessionToken')" && \
  "$@"
  )
}


# ============MACOS SPECIFIC SETTINGS=====================

# Max limit of open file descriptors - required for macos
ulimit -n 1024

# required for installing psycopg2
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib" \
  CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include" \
  PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"

# Add mysql-client to path
export PATH="${PATH}:/opt/homebrew/Cellar/mysql-client/8.0.33/bin"

# Dont know what this does ! :(
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Save every command to shell history (no limit)
export HISTSIZE=1000000000

# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Enable zsh syntax highlighting
file="/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ -f "$file" ]; then
  source "$file"
fi

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
alias lg=lazygit
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/Downloads/google-cloud-sdk/path.zsh.inc' 2>/dev/null ; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/Downloads/google-cloud-sdk/completion.zsh.inc' 2>/dev/null ; fi



# ------------------------------------------------------------------------
# Set default editor for the shell
alias nvim=lvim
if [ -x "$(command -v lvim)" ]; then
  export VISUAL=lvim
elif [ -x "$(command -v nvim)" ]; then
  export VISUAL=nvim
elif [ -x "$(command -v vim)" ]; then
  export VISUAL=vim
else
  export VISUAL=vi
fi
export EDITOR="$VISUAL"

