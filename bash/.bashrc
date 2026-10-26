# Author: maodun
# Modifydate: 2026.10.25

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '



# Alias
        ## Basic Command
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
        alias install='sudo pacman -S'
        alias uninstall='sudo pacman -Rns'
        alias update='sudo pacman -Syu'
        alias mount='sudo mount -t exfat -o rw,uid=1000,gid=1000 /dev/sda1 /mnt'
        alias umount='sudo umount -l /mnt'

        # Application Alias
        alias net='nmtui'
        alias bt='bluetoothctl'
        alias fs='fastfetch'
        alias ns='niri --session'



# Yazi
function y() {
        local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        command yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d '' cwd < "$tmp"
        [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
        command rm -f -- "$tmp"
}
