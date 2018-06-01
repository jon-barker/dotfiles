#---------ALIASES---------------------------------
#-->Modify Existing Commands
alias aptitude='aptitude -u'
alias du='du -h'
alias df='df -h'
alias ls='ls -hF --color=auto'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias vi='vim'
alias logoff='logout'
alias nano='nano -w'
alias axel='axel -a'
alias free='free -m'
alias iptraf='sudo iptraf'
alias iftop='sudo iftop'
alias cd..='cd ..'
alias lshw='sudo lshw'
alias ifstat='ifstat -nt'
alias pwrstat='sudo pwrstat'
alias vpnc='sudo openconnect ngvpn01.nvidia.com -u jbarker -b'

#-->Custom Commands
alias ubuntu.custom.update='sudo aptitude update ; sudo aptitude -f full-upgrade ; sudo aptitude autoclean'
alias mount.drobo='sudo mount /dev/sdf2 -t hfsplus -o rw /mnt/Drobo'
alias lsd='ls -l | grep ^d'
alias clean.config.files='sudo dpkg-query -l| grep -v "ii " | grep "rc " | awk '{print $2" "}' | tr -d "\n" | xargs sudo aptitude purge'
alias tn='tmux new -s'
alias ta='tmux attach -d -t'

#---------VARIABLES-----------------------------


#---------GREETING--------------------------------
clear
fortune | cowsay -f stegosaurus | lolcat
echo
echo "Press enter to contine"
read
clear
whoami | finger -lp
echo
cal
echo
echo "Contents of ~/:"
ls $HOME
echo
