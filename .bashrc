#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='nano'
export VISUAL='nano'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


alias upall="paru -Syu --noconfirm && sudo npm -g update"
alias update='sudo pacman -Syyu'
alias ansible-playbook="ansible-playbook --inventory=./inventory.ini"
alias gitnuro='env _JAVA_AWT_WM_NONREPARENTING=1 java -jar /home/data/Applications/Gitnuro-linux-x86_64-1.4.3.jar'

alias fixicons='~/.dotfiles/scripts/fix-icons.sh'

#source /usr/share/nvm/init-nvm.sh

fastfetch
