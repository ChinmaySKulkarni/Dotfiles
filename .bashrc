#########################################################################################################################################################################
#Environment Variables:
#########################################################################################################################################################################
export BASH_CONF="bashrc"

#Define my HOME directory.
export HOME=/Users/chinmay

#Add shell scripts to PATH env variable.
export PATH=$PATH:$HOME/programming/shell-scripts

#Set the home directory for Scala and add it to PATH.
export SCALA_HOME=/usr/local/scala/bin
export PATH=$PATH:$SCALA_HOME

#Set the JAVA_HOME environment variable and add it to PATH if not already there.
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$PATH:$JAVA_HOME

#Set the home directory for weka and add it to PATH.
export WEKA_HOME=/usr/local/weka
export PATH=$PATH:$WEKA_HOME

#Add python binaries to PATH
export PATH=$PATH:/usr/local/bin/python3

#Add local bin to path
export PATH=$PATH:$HOME/.local/bin

#Add miniconda3 to path
export PATH=$PATH:$HOME/miniconda3/bin

#Open visual studio code from command line
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#Set the default editor.
export EDITOR=vim

#Set the terminal color environment variable.
export TERM="xterm-256color"

#Ignore certain files like object/class files when auto-completing
export FIGNORE=$FIGNORE:.pyc:.o:.class

#Set up the home directory for OrientDB
export ORIENT_HOME=/Users/chinmay/UIUC/Thesis_Work/Project/orientdb-community-2.1.6

#Add the location of RabbitMQ in PATH.
export RABBITMQ_PATH=/usr/local/sbin
export PATH=$PATH:$RABBITMQ_PATH

#Set Hadoop variables and add them to PATH.
# export HADOOP_HOME=/usr/local/hadoop
# export PATH=$PATH:$HADOOP_HOME/bin
# export PATH=$PATH:$HADOOP_HOME/sbin
# export HADOOP_MAPRED_HOME=$HADOOP_HOME
# export HADOOP_COMMON_HOME=$HADOOP_HOME
# export HADOOP_HDFS_HOME=$HADOOP_HOME
# export YARN_HOME=$HADOOP_HOME

#Set Cassandra variables and add them to PATH.
#export CASSANDRA_HOME=$HOME/opt/cassandra
#export CASSANDRA_CONF=$CASSANDRA_HOME/conf
#export PATH=$PATH:$CASSANDRA_HOME/bin

#########################################################################################################################################################################
#Fancy Prompt:
#########################################################################################################################################################################

#set a fancy prompt (non-color, unless we know we "want" color)
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#########################################################################################################################################################################
#Bash Aliases:
#########################################################################################################################################################################

#Store git credentials to save time. Timeout set to 2 Hours.
alias gitcache='sudo git config --global credential.helper "cache --timeout=7200"'

#Easier navigation of git history
alias lg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

#Start Cassandra cqlsh.
#alias cqlsh='$HOME/opt/cassandra/bin/cqlsh'

#Make ls use colors
export CLICOLOR=1

#Display grep output colourized.
alias grep='grep --color=auto'

#For typing less to display ls.
alias l='ls'

#Show all files (do not ignore files starting with .) (-a), display inode numbers (first column) (-i),
#ls with long listing format(-l), reverse order while sorting (-r), sort by modification time (newest first) (-t).
#alias lt='ls -ailrt'
alias lt='ls -ail'

#lt with file sizes in human readable format (-h).
alias lth='ls -ahilrt'

#Default to vim even when vi is entered.
alias vi='vim'

#Aliasing rm to safe_rm shell script to avoid disastrous removals.
#alias rm='safe_rm'

#Find the changed files when using svn
alias changed_files='svn diff | grep Index:'

#Similar to the 'alias' command, except it displays the bash functions defined inside .bashrc.
#--color=always is used to retain the coloring of the first grep command before piping it.
#the '-v' option is used to ignore lines that match 'fns_alias' i.e. don't display this line:
alias fns_alias='grep --color=always -n "()" "$HOME"/.bashrc | grep -v "fns_alias"'

#Directly cd to shell scripts directory.
alias progsh='cd $HOME/programming/shell-scripts'

#Directly cd to the scratch directory (for testing out programs).
alias scratch='cd $HOME/scratch'

#Directly cd to the trash directory (used to store files/directories that are rm'ed).
alias trash_dir='cd $HOME/rm_trash'

#Directly cd into the directory for Data Mining Principles CS512.
alias dm='cd $HOME/UIUC/Coursework/Sem_2/CS_512_Data_Mining_Principles/'

#Directly cd into the directory for Data Mining CS412.
alias ads='cd $HOME/UIUC/Coursework/Sem_2/CS_525_Advanced_Distributed_Systems/'

#Directly cd into the svn directory for CS 241.
alias cs241='cd $HOME/UIUC/TA/CS_241_System_Programming/_class'

#Start weka.
alias weka='cd $WEKA_HOME && java -Xmx1000M -jar weka.jar&'

#Open a file in sublime-text. (Aliases for convenience).
alias sublime='open /Applications/Sublime\ Text.app/ '

#Command to toggle showing hidden files in finder. (Type TRUE or FALSE accordingly).
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles '

#Source .bashrc so that changes take effect right away.
alias refresh='source ~/.bashrc'

#Find all files recursively within the current directory that have .h, .c, .cpp or .py extensions.
alias list_code_files='find -L . -type f -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.py"'

#Run MongoDB from the specified data directory.
alias mongodb_start='sudo mongod --dbpath /MongoDB/db/'

# Auto-correct commands.
eval "$(thefuck --alias)"

#Useful Docker aliases
alias dockia='docker images -a'
alias dockpsa='docker ps -a'
alias dockrmall_containers='docker rm -f $(docker ps -a -q)'

#Useful k8s aliases
alias kcgn='kubectl get namespaces'
alias kcgp='kubectl get pods'
alias kcgd='kubectl get deployments'
alias kcgs='kubectl get services'
alias kcgi='kubectl get ingresses'
alias kcl='kubectl logs'

# Use python3 by default
alias python='python3'
alias python2='/usr/bin/python'
alias pip='pip3'

# ssh Azure config. Needs azure.local entry in ~/.ssh/config file
alias ssh-azure-local="ssh azure.local -p 2222 -t 'tmux new-session -A -s main'"

# Get details of all jobs located in the Slurm scheduling queue with more details
alias squeuen='squeue --format="%.18i %.9P %.80j %.8u %.8T %.10M %.9l %.6D %R" '

#########################################################################################################################################################################
#Useful Bash Functions:
#########################################################################################################################################################################

#Search using grep recursively (-r)  (and show line number of occurence (-n) ) and exclude unnecessary files.
#If no directory/file is passed, it searches the pattern in the current directory.
#If a directory name is passed, it searches the pattern in that directory.
#If a file name is passed, it searches the pattern in that file.
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

#Ignore case (-i) for fine_grep.
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

#Find and Replace first argument by second argument in either specific files, or if no file names
#are specified, then in all the files in that directory that contain the first word.
#
#If no files are specified, grep -l (displays file names containing the pattern instead of occurences of the pattern),
#is used to provide a newline separated list of files containg the pattern. This is given as input to xargs.
#
#In general, xargs is used like this:
#	prog | xargs utility
#
#where prog is expected to output one or more newline/space separated results. The trick is that xargs does not! necessarily
#call utility once for each result, instead it splits the result list into sublists and calls utility for every sublist.
#If you want to force xargs to call utility for every single result you will need to invoke it with xargs -L1.
#By default, xargs invokes the /bin/echo utility for each sublist.
#In this case xargs calls sed with (-i) (to edit files in-place) and perform the substitution.
#If file names are specified, the sed command is run over those filenames only.
fnr()
{
  if [ "$#" -lt 2 ]
  then
    echo "Usage: fnr <Word to replace> <New word> <Directory/File Names(Optional)>"
  elif [ "$#" -eq 2 ]
  then
    grep -lr --exclude-dir=".svn" -e "$1" . | xargs sed -i ".bak" "s/"$1"/"$2"/g"
  else
    FIRST_WORD="$1"
    SECOND_WORD="$2"
    shift 2
    echo -e "Files to be modified:\t" "$@" "\n"
    for filename in "$@"
    do
      if [[ -d "$filename" ]]
      then
        grep -lr --exclude-dir=".svn" -e "$FIRST_WORD" "$filename" | xargs sed -i ".bak" "s/"$FIRST_WORD"/"$SECOND_WORD"/g"
      elif [[ -f "$filename" ]]
      then
        sed -i ".bak" "s/"$FIRST_WORD"/"$SECOND_WORD"/g" "$filename"
      fi
    done
  fi
}

#Compile C programs with memwatch enabled.
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

#Print the sorted disk usage of each file. Display along with the total (-c), print du in
#human readable format (-h), summarize (display only total for each argument) (-s),
#sort as human-numeric-sort (gsort -h).
#If no directory is specified, run in the current directory.
#If a directory is specified, run in that directory.
#If a filename is specified, find the disk usage for that file only.
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

#Find the full path of the file given its inode number.
inode_find()
{
  if [[ "$#" -ne 1 ]]
  then
    echo "Enter inode number for the file to be found"
    return 1
  fi
  echo "$1"
  find / -inum "$1" -print
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

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
