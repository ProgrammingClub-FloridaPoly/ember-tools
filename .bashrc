# ~/.bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

stty -echoctl

# term initializations
PS1="\[\e[0;1;34m\][\$(date +%R)] \[\e[00;01;35m\]${chroot:+($chroot)}\u@\h\[\e[01;34m\]:\w\[\e[01;31m\] \$ "
echo -e "\x1b[1;1H\x1b[J"
echo "There are $(users | wc -w) users logged in."
echo "Logged in as $(whoami)" | lolcat
echo -e "\n$(pwd)\n"

# hard screen clear
bind -x '"\C-t": printf "\ec"'

# ls options
alias l='ls'
alias la='ls -AFG'
alias ll='ls -lAFG'
alias cl='clear; ls -G'
alias cls='clear; ls -AG'
alias cll='clear; ll -G'
alias clll='clear; ll | less'
alias ld='clear; ls -1v '

# grep options
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# vim aliases
alias vb='vim ~/.bashrc && source ~/.bashrc'
alias vv='vim ~/.vimrc'

#mistake aliases
alias cim='vim'
alias vmi='vim'

# edit aliases
alias obr='open -e ~/.bashrc && source ~/.bashrc'
alias ovr='open -e ~/.vimrc'
alias oe='open -e'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000 

# append to the history file, don't overwrite it
shopt -s histappend 

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" 

# alerts
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias emergency='notify-send --urgency=critical -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#general aliases
alias c='clear'
# mariadb
alias sql_connect='mysql -u $(whoami) -p -h ember-db'

#methods
weather(){ 
    curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-33805}"|perl -ne '/<title>([^<]+)/&&printf "%s: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';
} # FPU zip code

command_exists () { #to see if a program is installed
    type "$1" &> /dev/null ;
}

# Mail var for vim header
export MAIL=$(whoami)@floridapoly.edu
