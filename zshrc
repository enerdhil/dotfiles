# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(osx history zsh_reload bundler gem redis-cli sudo systemadmin)

source $ZSH/oh-my-zsh.sh

# User configuration

[[ -z "$PS1" ]] && return


# Set less options
if [[ -x $(which less 2> /dev/null) ]]
then
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
    export LESSHISTFILE='-'
    if [[ -x $(which lesspipe 2> /dev/null) ]]
    then
	LESSOPEN="| lesspipe %s"
	export LESSOPEN
    fi
fi

# Set default editor
if [[ -x $(which emacs 2> /dev/null) ]]
then
    export EDITOR="vim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

# Env for vim header
export MAIL42=jhezard@student.42.fr
export USER42=jhezard

# Needed for GPG to work
export GPG_TTY=$(tty)

# Background processes aren't killed on exit of shell
setopt AUTO_CONTINUE

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

if command -v rbenv >/dev/null 2>&1 ; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$( rbenv init - )"
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
