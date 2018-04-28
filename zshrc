# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
    export ZSH=/home/amuro/.oh-my-zsh

    eval `dircolors /home/amuro/.dir_colors/dircolors` 

# ibus settings
    export GTK_IM_MODULE=nimf
    export XMODIFIERS=@im=nimf
    export QT_IM_MODULE=nimf
    export QT4_IM_MODULE=nimf

    export EDITOR=/usr/bin/vim
    export PATH=/home/amuro/bin:/home/amuro/.gem/ruby/2.4.0/bin:/home/amuro/CS367/Project3:$HOME/sys161/bin:$HOME/sys161/tools/bin:$HOME/.cabal/bin:$HOME/.cargo/bin:$HOME/.cabal-sandbox/bin:$PATH
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

    alias zeus="ssh hshin23@zeus.vse.gmu.edu"
    alias mason="sudo openconnect vpn.gmu.edu"
    alias prolog="swipl"
    alias bgrand="feh --randomize --bg-scale ~/Pictures/Wallpaper/firewatch/*"
    alias vim="nvim"
    alias lola="log --graph --decorate --pretty=oneline --abbrev-commit --all"
    alias firefox="firefox-developer-edition"
    alias slack-term="TERM=xterm slack-term"

    EDITOR="emacs -nw"

    # stty -ixon
    # xrdb ~/.Xresources
    #
    export FLIP_HOME="/home/amuro/Downloads/flip/flip_linux_3-2-1/flip.3.2.1/bin"
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/jre"

# Gotham Shell
# GOTHAM_SHELL="$HOME/.config/gotham/gotham.sh"
# [[ -s $GOTHAM_SHELL ]] && source $GOTHAM_SHELL

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"
# ZSH_THEME="smt"
# ZSH_THEME="norm"
# ZSH_THEME="pygmalion"

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
plugins=(git)

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
