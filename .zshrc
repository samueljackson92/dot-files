# Path to your oh-my-zsh installation.
export ZSH=/Users/samueljackson/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

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

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#####################
# Custom Config Stuff
#####################
source /etc/profile.d/conda.sh

# This is here because of the stupid llvm doesn't play nice with
# system clang requirement that OSX has.
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/llvm/share/clang:$PATH"

alias clang-tidy=/usr/local/opt/llvm/bin/clang-tidy
alias clang-check=/usr/local/opt/llvm/bin/clang-check
alias clang-rename=/usr/local/opt/llvm/bin/clang-rename
alias ct="clang-tidy -checks='-*,performance-for-range-copy,performance-unnecessary-copy-initialization,modernize-use-override,modernize-use-nullptr,modernize-loop-convert,modernize-use-bool-literals,modernize-deprecated-headers,misc-*,-misc-unused-parameters'"
alias ctb="git diff --name-only master HEAD | xargs -L1 clang-tidy -checks='-*,performance-for-range-copy,performance-unnecessary-copy-initialization,modernize-use-override,modernize-use-nullptr,modernize-loop-convert,modernize-use-bool-literals,modernize-deprecated-headers,misc-*,-misc-unused-parameters'"
alias callgrind=valgrind –tool=callgrind –instr-atstart=no
alias make-docs="./bin/MantidPlot.app/Contents/MacOS/MantidPlot -xq docs/runsphinx_html.py"

eval $(/usr/libexec/path_helper -s)

# ------------------------------------------------------
# SCD Paths
# ------------------------------------------------------

export GPAW_SETUP_PATH=~/muon-data/gpaw-setups-0.9.20000
export DFTB_COMMAND=~/dev/dftbplus-17.1/_build/prog/dftb+/dftb+
export CASTEP_COMMAND=~/dev/CASTEP-16.12/bin/darwin_x86_64_gfortran6.0/castep.serial

export PATH="/Users/samueljackson/git/muon-project-scripts/analysis/tools/:$PATH"
export PATH="/Users/samueljackson/dev/CASTEP-16.12/obj/darwin_x86_64_gfortran7.0/:$PATH"
export PATH="/Users/samueljackson/dev/dftbplus-17.1/_build/prog/dftb+/:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -N -g -i -J --underline-special --SILENT'

# -------------------------------------------------------
eval "$(direnv hook zsh)"

# -------------------------------------------------------
# start a tmux session
if [ "$TMUX" = "" ]; then tmux; fi

