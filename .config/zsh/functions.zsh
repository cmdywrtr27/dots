#!/usr/bin/zsh

# Font information (fontq Inconsolata)
fontq() {
fc-list | rg -i $1
}

# Weather by zip code or city name (weather 90210 or weather Beverly Hills)
weather() {
declare -a WEATHERARRAY
WEATHERARRAY=( `lynx -dump "http://www.google.com/search?hl=en&lr=&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&q=weather+${1}&btnG=Search" | grep -A 5 -m 1 "Weather for"`)
echo ${WEATHERARRAY[@]}
}

# Translate a word (translate car french)
translate() {
TRANSLATED=`lynx -dump "http://dictionary.reference.com/browse/${1}" | grep -i -m 1 -w "${2}:" | sed 's/^[ \t]*//;s/[ \t]*$//'`
if [[ ${#TRANSLATED} != 0 ]]; then
    echo "\"${1}\" in ${TRANSLATED}"
    else
    echo "Sorry, I can not translate \"${1}\" to ${2}"
fi
}

# Define a word (define selfish)
define() {
lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}&btnG=Google+Search" | grep -m 3 -w "*" | sed 's/;/ -/g' | cut -d- -f1 > /tmp/templookup.txt
            if [[ -s  /tmp/templookup.txt ]]; then
                until ! read response
                    do
                    echo "${response}"
                    done < /tmp/templookup.txt
                else
                    echo "Sorry, the term \"${1} \" wasn't found"
            fi
rm -f /tmp/templookup.txt
}

# Extract tar and zip files (extract "filename")
extract() {
     if [[ -f $1 ]]; then
         case $1 in
             *.tar.bz2)   tar xjf $1 ;;
             *.tar.gz)    tar xzf $1 ;;
             *.bz2)       bunzip2 $1 ;;
             *.rar)       rar x $1 ;;
             *.gz)        gunzip $1 ;;
             *.tar)       tar xf $1 ;;
             *.tbz2)      tar xjf $1 ;;
             *.tgz)       tar xzf $1 ;;
             *.zip)       unzip $1 ;;
             *.Z)         uncompress $1 ;;
             *.7z)        7z x $1 ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Copy and go (cpg "filename")
cpg() {
  if [ -d "$2" ]; then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}

# Move and go (mvg "filename")
mvg() {
  if [ -d "$2" ]; then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}

# Directory size (dirsize "directory name")
dirsize() {
du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
egrep '^ *[0-9.]*M' /tmp/list
egrep '^ *[0-9.]*G' /tmp/list
rm /tmp/list
}

# IP information (myip)
myip() {
lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}

# Clock (clock)
clock() {
while true ; do clear ; echo "===========" ; date +" %l:%M %P" ; echo "===========" ; sleep 1 ; done
}

# Backup files (bu "filename")
bu() {
cp $1 ${1}-`date +%Y-%m-%d_%H:%M:%S`.bak ;
}

# List files after changing directories
chpwd() {
exa -l --grid --icons --color=always --git --sort=name --no-user --no-time --no-filesize --no-permissions
}
