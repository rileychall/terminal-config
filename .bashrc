export HOMER=${HOME}/real
export EMUDIR=$HOMER/projects/emu_dev/emu
export PATH=${HOMER}/bin:$PATH

# COMMAND ALIASES
alias dus='du -h --max-depth=1 | sort -h'
alias ls='ls --color=always'
alias grep='grep -n --color=always'
alias ll=bashrc_list_function
#alias qst='qstat -u guven'
#alias space='df -h /xdisk/guven/'
#alias db='dbxcli'
#alias dbll='dbxcli ls -l'

# DIRECTORY SHORTCUTS
alias home='cd ${HOMER}'
alias dev='cd ${EMUDIR}'

# GIT ALIASES
alias gstat='git status'
alias gdiff='git diff'
alias glog='git log'
alias glogg='git log --all --decorate --oneline --graph'
alias ggol='git log --all --decorate --oneline -20 --reverse'

export GIT_AUTHOR_NAME='Riley Hall'

# EMU GREP SHORTCUT FUNCTION
function grp(){
    grep -nT --color=always "$1" *.F
}

# LS SHORTCUT FUNCTION
function bashrc_list_function(){
    echo
    echo "Permission | Owner | Size | Mod Time | Name"
    ls -otrAhp --color=always --group-directories-first $1 | sed -n "1!p"
}

# PROMPT STYLING
PS1='\[\033[38;5;32m\]$(whoami):'                # Username
PS1+='\[\e[36m\]${PWD#"${PWD%/*/*/*}/"}'  # Directory
PS1+='\[\e[32m\]|>\[\e[0m\]'              # Rest

# WINDOW TITLE
# make window title first letter of computer name (uppercase) and current folder
PROMPT_COMMAND='echo -en "\033]0;$(hostname | cut -c1 | tr '[[:lower:]]' '[[:upper:]]')>${PWD##*/}\a"'

#TERM=xterm
#export $TERM=xterm-256color

# VIMRC REPLACEMENT
export MYVIMRC=${HOMER}/config/.vimrc
alias vim='vim -u $MYVIMRC'

export VIMINIT=${HOMER}/config/.vimrc

# AUTOCOMPLETE SETTING
complete -d cd

