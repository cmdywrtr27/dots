#Aliases

alias re="openbox --reconfigure && echo 'Openbox has been reconfigured'"
alias menu='obmenu-generator -s -c'
alias flex='jfetch'
alias news='instantnews --news USA Today'
alias please='sudo $(fc -ln -1)'

alias updatemirrors='sudo reflector --verbose --country "United States" -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrorx="sudo reflector --age 6 --latest 10 --fastest 10 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"

alias ristretto='devour ristretto'
alias sxiv='devour sxiv'
alias mpv='devour mpv'
alias vlc='devour vlc'
alias zathura='devour zathura'

alias figlet='figlet -f small'
alias sshserver='ssh josh@192.168.1.118'
alias sshrouter='ssh root@192.168.1.1'
alias wifi='nmtui'
alias update='sudo pacman -Syu -y && yay -Syu -y'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias aliases='vim $HOME/.config/zsh/aliases.zsh'
#alias tmux='tmux -2'
alias fixkeys='sudo pacman-key --refresh-keys'
alias please='sudo !!'

#alias cdl='builtin cd "$@" && command exa -Galh --icons --color=always'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdl='cd "$1" ; exa -Galh --icons --color=automatic'

alias dc='docker-compose'
alias sr='sudo reboot'
alias ss='sudo shutdown -h now'
alias sp='sudo pacman -S --noconfirm'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
#alias find='fd'
#alias diff='diff-so-fancy'
alias x='exit'
alias bk='cd "$OLDPWD"'
alias lf='lfub'
alias load='xrdb -load ~/.Xresources'
alias merge='xrdb -merge ~/.Xresources'
alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ncmpcpp2='~/.config/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug'

alias l='exa -Galh --icons --color=always'
alias ll='exa -Galh --icons --color=always --group-directories-first'
alias lls='exa -Galhs --icons --color=always --sort=size'
alias llt='exa -Galh --icons --color=always --sort=type'
alias lln='exa -Galh --icons --color=always --sort=name'
alias lld='exa -Galh --icons --color=always --group-directories-first --sort=date'
alias llm='exa -Galh --icons --color=always --sort=modified'
#alias ls='exa --icons --color=always'
alias l.='exa -a | egrep "^\."'

alias vi='vim'
alias v='nvim'
#alias vim='nvim'
alias icon='sudo gtk-update-icon-cache /usr/share/icons/* && sudo gtk-update-icon-cache $HOME/.icons/*'
alias font='fc-cache -f -v'
alias pgrep='ps aux | grep'
alias grep='grep --color=auto'
alias wget='wget -c'
alias mkdir='mkdir -pv'
alias xclip='xclip -selection clipboard'
alias cp='cp -Riv'
alias mv='mv -iv'
alias rm='rm -Iv'

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
alias color='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias exp='expressvpn'

#alias gcl='git clone --depth 1'
#alias gi='git init'
#alias ga='git add'
#alias gc='git commit -m'
#alias gp='git push origin master'

# Functions

function hist () {
	case $1 in
		# Copy selected command into clipboard
		"-c")
			OPTION=$(history -n | sort -r | uniq -u | fzf | tr -d '\n')
			echo $OPTION | xclip -selection clipboard
			;;

		# Execute selected command and copy its output to clipboard
		"-o")
			$(history -n | sort -r | uniq -u | fzf | tr -d '\n') | xclip -selection clipboard
			;;
		# Execute selected command
		"-e")
			$(history -n | sort -r | uniq -u | fzf | tr -d '\n')
			;;
		*)
			echo "hist is just a shell function!
USAGE:
	hist [option]

OPTIONS:

	-c		Copy the selected command to clipboard
	-o		Copy the output of selected command to clipboard
	-e		Execute the selected command "
			;;
	esac
}

weather ()
{
declare -a WEATHERARRAY
WEATHERARRAY=( `lynx -dump "http://www.google.com/search?hl=en&lr=&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&q=weather+${1}&btnG=Search" | grep -A 5 -m 1 "Weather for"`)
echo ${WEATHERARRAY[@]}
}

define ()
{
lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}&btnG=Google+Search" | grep -m 3 -w "*"  | sed 's/;/ -/g' | cut -d- -f1 > /tmp/templookup.txt
            if [[ -s  /tmp/templookup.txt ]] ;then
                until ! read response
                    do
                    echo "${response}"
                    done < /tmp/templookup.txt
                else
                    echo "Sorry $USER, I can't find the term \"${1} \""
            fi
rm -f /tmp/templookup.txt
}

