# Aliases

alias re="openbox --reconfigure && echo 'OK, I\'m reloaded!'"
alias flex='jfetch'

alias updatemirrors='sudo reflector --verbose --country "united states" -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrorx='sudo reflector --age 6 --latest 10 --fastest 10 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist'

#alias ristretto='devour ristretto'
#alias sxiv='devour sxiv'
#alias mpv='devour mpv'
#alias vlc='devour vlc'
#alias zathura='devour zathura'

alias figlet='figlet -f Stick\ Letters'
alias sshserver='ssh josh@192.168.1.118'
alias sshrouter='ssh root@192.168.1.1'
alias wifi='nmtui'
alias update='sudo pacman -Syu --noconfirm && yay -Syu --noconfirm'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias aliases='vim /home/josh/.oh-my-zsh/custom/aliases.zsh'
alias aliass='cat /home/josh/.oh-my-zsh/custom/aliases.zsh'
#alias tmux='tmux -2'
alias fixkeys='sudo pacman-key --refresh-keys'
alias please='sudo !!'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias dc='docker-compose'
alias sr='sudo reboot'
alias ss='sudo shutdown -h now'
alias sp='sudo pacman -S --noconfirm'
alias cleanup='sudo pacman -rns $(pacman -qtdq)'
#alias find='fd'
#alias diff='diff-so-fancy'
alias x='exit'
alias bk='cd "$OLDPWD"'
alias lf='lfub'
alias load='xrdb -load ~/.Xresources'
alias merge='xrdb -merge ~/.Xresources'
alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias ls='exa -Gl --header --icons --color=always --git --time-style=iso --time=changed'
alias l='exa -Gal --header --icons --color=always --git --time-style=iso --time=changed'
alias ll='exa -Gal --header --icons --color=always --group-directories-first --git --time-style=iso --time=changed'
alias lc='exa -Gal --header --icons --color=always --git --time-style=iso --time=changed --sort=changed'
alias lr='exa -Galr --header --icons --color=always --group-directories-first --git --time-style=iso --time=changed'
alias l.='exa -a | grep -E "^\." --header --icons --color=always --git --time-style=iso --time=changed'

alias vi='vim'
alias icon='sudo gtk-update-icon-cache /usr/share/icons/* && sudo gtk-update-icon-cache $HOME/.icons/*'
alias font='fc-cache -f -v'
#alias grep='() { $(whence -p grep) --color=auto $@ }'
#alias erep='() { $(whence -p egrep) --color=auto $@ }'
alias pgrep='ps aux | grep'
alias grep='grep --color=auto'
alias cp='cp -riv'
alias rm='rm -IRv'
alias mv='mv -iv'
alias wget='wget -c'

alias enable_vbox='sudo modprobe vboxdrv vboxnetadp vboxnetflt vboxpci'
alias disable_vbox='sudo modprobe -r vboxdrv vboxnetadp vboxnetflt vboxpci'

alias mpd_start='systemctl start mpd.service mpdscribble.service --user'
alias mpd_stop='systemctl stop mpd.service mpdscribble.service --user'
alias mute='amixer -D pulse set Master 1+ mute'
alias unmute='amixer -D pulse set Master 1+ unmute'

alias ym='youtube-dl -xic --audio-format mp3 --add-metadata'
alias yt='youtube-dl -xic --add-metadata'
alias ytmp3='youtube-dl -x --audio-format mp3'

alias pingg='curl ipinfo.io/ip && ping -c 5 -q google.com'
alias speed_test='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias exl='expressvpn list all'
alias exd='expressvpn disconnect'
alias exc='expressvpn connect $1'
alias exs='expressvpn status'

#alias gcl='git clone --depth 1'
#alias gi='git init'
#alias ga='git add'
#alias gc='git commit -m'
#alias gp='git push origin master'
