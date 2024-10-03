### env ###
export BASH_CONF="bashrc"
export BASH_SILENCE_DEPRECATION_WARNING=1

export HOME=/Users/chinmay

export SCALA_HOME=/usr/local/scala/bin
export PATH=$PATH:$SCALA_HOME

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$PATH:$JAVA_HOME
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

export PATH=$PATH:/usr/local/bin/python3
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/miniconda3/bin

# open visual studio code from command line
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# psql
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="$CPPFLAGS:-I/opt/homebrew/opt/postgresql@15/include"

# set the default editor.
export EDITOR=vim
# used for k9s
export KUBE_EDITOR="vim"

# set the terminal color environment variable.
export TERM="xterm-256color"
# make ls use colors
export CLICOLOR=1

# ignore certain files like object/class files when auto-completing
export FIGNORE=$FIGNORE:.pyc:.o:.class

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set a fancy prompt (non-color, unless we know we "want" color) --> overridden below with git-specific prompt
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


### aliases ###
# store git credentials to save time. Timeout set to 2 Hours.
alias gitcache='sudo git config --global credential.helper "cache --timeout=7200"'
# save time with git and gh cli commands
alias gpom='git pull origin main'
alias gpoma='git pull origin master'
alias gs='git status'
alias gd='git diff'
alias ga='git add .'
alias gc='git commit -S -m'
alias gl='git log'
alias gcm='git checkout main'
alias gfp='git fetch -up'
alias ghl='gh auth login --git-protocol https --web'
alias ghpr='gh pr status'
alias ghis='gh issue status'
# easier navigation of git history
alias lg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# display grep output colorized.
alias grep='grep --color=auto'

alias l='ls'
alias lt='ls -ail'
# lt with file sizes in human readable format (-h).
alias lth='ls -ahilrt'

#Default to vim even when vi is entered.
alias vi='vim'

# similar to the 'alias' command, except it displays the bash functions defined inside .bashrc.
alias fns_alias='grep --color=always -n "()" "$HOME"/.bashrc | grep -v "fns_alias"'

# open a file in sublime-text. (Aliases for convenience).
alias sublime='open /Applications/Sublime\ Text.app/ '

# command to toggle showing hidden files in finder. (Type TRUE or FALSE accordingly).
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles '

# source .bashrc so that changes take effect right away.
alias refresh='source ~/.bashrc'

# find all files recursively within the current directory that have .h, .c, .cpp or .py extensions.
alias list_code_files='find -L . -type f -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.py"'

# useful Docker aliases
alias dockia='docker images -a'
alias dockpsa='docker ps -a'
alias dockrmall_containers='docker rm -f $(docker ps -a -q)'

# useful k8s aliases
alias kcgn='kubectl get namespaces'
alias kcgp='kubectl get pods'
alias kcgd='kubectl get deployments'
alias kcgs='kubectl get services'
alias kcgi='kubectl get ingresses'
alias kcl='kubectl logs'
alias k='kubectl'
alias kx='kubectx'

# use python3 by default
alias python='python3'
alias python2='/usr/bin/python'
alias pip='pip3'

# get details of all jobs located in the Slurm scheduling queue with more details
alias squeuen='squeue --format="%.18i %.9P %.80j %.8u %.8T %.10M %.9l %.6D %R" '


### functions ###
# search using grep recursively (-r)  (and show line number of occurence (-n) ) and exclude unnecessary files.
# If no directory/file is passed, it searches the pattern in the current directory.
# If a directory name is passed, it searches the pattern in that directory.
# If a file name is passed, it searches the pattern in that file.
fine_grep()
{
  if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]
  then
    echo "Usage: fine_grep <Pattern to find> <Directory/File Name(Optional)>"
  elif [ "$#" -eq 2 ]
  then
    if [[ -d "$2" ]]
    then
      grep --color=auto -nr "$1" --exclude=*.{tmp,svn*,*~,o,linux*,swp*} "$2"/*
    elif [[ -f "$2" ]]
    then
      grep --color=auto -n "$1" "$2"
    fi
  else
    grep --color=auto -nr "$1" --exclude=*.{tmp,svn*,*~,o,linux*,swp*} *
  fi
}

# ignore case (-i) for fine_grep.
ignore_case_fine_grep()
{
  if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]
  then
    echo "Usage: ignore_case_fine_grep <Pattern to find> <Directory/File Name(Optional)>"
  elif [ "$#" -eq 2 ]
  then
    if [[ -d "$2" ]]
    then
      grep --color=auto -inr "$1" --exclude=*.{tmp,svn*,*~,o,linux*} "$2"/*
    elif [[ -f "$2" ]]
    then
      grep --color=auto -in "$1" "$2"
    fi
  else
    grep --color=auto -inr "$1" --exclude=*.{tmp,svn*,*~,o,linux*} *
  fi
}

# compile C programs with memwatch enabled.
mem_compile()
{
  if [ "$#" -ne 2 ]
  then
    echo "Usage: mem_compile <C file>  <Name of executable to be generated>"
  else
		MEM_WATCH_DIR="$HOME/programming/c/mem_watch"
		cp "$MEM_WATCH_DIR"/"memwatch.c" ./
		cp "$MEM_WATCH_DIR"/"memwatch.h" ./
    gcc -DMEMWATCH -DMEMWATCH_STDIO "$1" memwatch.c -o "$2"
  fi
}

# print the sorted disk usage of each file. Display along with the total (-c), print du in
# human readable format (-h), summarize (display only total for each argument) (-s),
# sort as human-numeric-sort (gsort -h).
# If no directory is specified, run in the current directory.
# If a directory is specified, run in that directory.
# If a filename is specified, find the disk usage for that file only.
sdu()
{
  if [ "$#" -eq 0 ]
  then
    du -chs * | gsort -h
  else
    for argument in "$@"
    do
      if [[ -d "$argument" ]]
      then
        du -chs "$argument"/* | gsort -h
      elif [[ -f "$argument" ]]
      then
        du -chs "$argument"
      elif [[ ! -e "$argument" ]]
      then
        echo "No such file or directory!"
      fi
      echo -e "\n"
    done
  fi
}

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

if [ -f ~/.git-completion.bash ]; then
	  . ~/.git-completion.bash
fi

fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}

eval "$(/opt/homebrew/bin/brew shellenv)"


# enable completions See https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# See fzf https://github.com/junegunn/fzf#installation
# Installation: brew install fzf
# Key bindings: $(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
