#########################################################################################################################################################################
#Environment Variables:
#########################################################################################################################################################################

#Define my HOME directory.
export HOME=/Users/chinmay

#Set the JAVA_HOME environment variable and add it to PATH if not already there.
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:$JAVA_HOME
#Switch between different Java versions if required
alias j8="export JAVA_HOME=\"/usr/libexec/java_home -v 1.8\"; java -version"

#Add poetry to PATH
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#Add virtualenv to PATH
export PATH="$PATH:/Users/chinmay/Library/Python/3.8/bin/"

#Set the default editor.
export EDITOR=vim

#Set the terminal color environment variable.
export TERM="xterm-256color"

#Ignore certain files like object/class files when auto-completing
export FIGNORE=$FIGNORE:.pyc:.o:.class

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

#Make ls use colors
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

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

#Directly cd to the scratch directory (for testing out programs).
alias scratch='cd $HOME/scratch'

#Open a file in sublime-text. (Aliases for convenience).
alias sublime='open /Applications/Sublime\ Text.app/ '

#Command to toggle showing hidden files in finder. (Type TRUE or FALSE accordingly).
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles '

#Find all files recursively within the current directory that have .h, .c, .cpp or .py extensions.
alias list_code_files='find -L . -type f -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.py"'

#########################################################################################################################################################################
#Useful Bash Functions:
#########################################################################################################################################################################

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

if [ -f ~/.git-completion.bash ]; then
	  . ~/.git-completion.bash
  fi

#Pyenv and Pyenv-virtualenv sourcing
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

