#############
# Functions #
#############

function hours() { git flog | grep "Jared Norman" | grep $1 | less -R }

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# Find directories by substring
function f() { ag --nocolor -l -g "$1" "${2:-.}"  }

# Find and replace using sed and silver!
function replace() { ag -l --nocolor "$1" "${3:-.}" | xargs sed -i -e "s/$1/$2/g" }

# Switch to first awesome tag. Only switches current active display.
function first_tag { echo 'local awful = require("awful"); awful.tag.viewonly(awful.tag.gettags(mouse.screen)[1])' | awesome-client }

function jftest() {
  clear
  eval "$1"
  local retval=$?
  # first_tag
  if [ $retval -eq 0 ]; then
    notify-send "Tests passed!"
    exit
  else
    notify-send "Tests failed!"
  fi
}

function togglebg() {
  echo $BASE16_THEME
  if [ "hopscotch" = "$BASE16_THEME" ] || [ "base16-hopscotch" = "$BASE16_THEME" ]
  then
    base16_unikitty-light
  else
    base16_hopscotch
  fi
}

function fix_keyboard {
  xset m 0 0
  togglekb qwerty
}

###########
# Aliases #
###########

# Misc

alias bx='bundle exec'
alias ya=yaourt
alias grep='grep --color=auto'
alias ls='ls -G'
alias c='cd ~/Codes/$(ls ~/Codes | fzf)'
alias tms="tmux attach -t"
alias tm='tmux switch -t "`tmux list-sessions | cut -d':' -f1 | fzf`"'
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias dev='ssh -t `grep -w -i "Host" ~/.ssh/config | sed 's/Host//' | grep -i "\-dev$" | fzf`'

# Git
alias g='git'
alias gpl='git pull origin $(current_branch)'
alias gplr='git pull --rebase origin $(current_branch)'
alias gp='git push origin $(current_branch)'
alias gpf='git push --force-with-lease origin $(current_branch)'

# History Substring Search
source $HOME/.zsh/vendor/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=black,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
