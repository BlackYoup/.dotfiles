# .zshrc

source "$HOME/Dev/antigen/antigen.zsh"

source "$HOME/Dev/zsh-git-prompt/zshrc.sh"
source /etc/profile

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply
PROMPT='%{$fg[cyan]%}[%*]%{$fg[green]%}[%n:%~] $(git_super_status) %{$fg[yellow]%}~ %{$fg[red]%}$ %{$reset_color%}'

setopt no_share_history

if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi

alias sudo="sudo "
alias halt="systemctl poweroff"
alias lg="git lg"
alias gitclean="git branch --merged | grep -v master"
alias gd="git difftool"
alias make="make -j6"
alias gs="git status"
alias ls="ls --color"
alias cfx="/usr/bin/python2.7 /usr/bin/cfx"
alias search="grep -rn --color -C 1"
alias hibernate="sudo systemctl hibernate"
alias reboot="systemctl reboot"
alias mysql="mysql --auto-rehash"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias npm="PYTHON=/usr/bin/python2.7 npm"
alias vim="nvim"
alias vi="nvim"
alias tmux="tmux -2"
alias wip="git add . && git commit -m \"WIP\" --no-verify"
alias cp='rsync -avc -zz --progress'
#alias clever='/home/arnaud/Dev/clevercloud/clever-tools/bin/clever.js'
alias tiny_http_server='cd /tmp && npm i express && echo "require(\"express\")().get(\"*\",(_,r)=>{\n\tconsole.log(process.env.PORT||1016);\nr.end();\n}).listen(process.env.PORT || 1026)" > http.js && node http.js'
alias ip="ip --color"
alias cat="bat"
alias grep="rg"
alias find="fd"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

export TERM="screen"
export EDITOR="nvim"
export GOPATH=/home/arnaud/Dev/golang
export GOROOT=/usr/lib/go
export _JAVA_AWT_WM_NONREPARENTING=1
export CC=x86_64-pc-linux-gnu-gcc
export HOSTCC=$CC
export AR=x86_64-pc-linux-gnu-ar
export CXX=x86_64-pc-linux-gnu-g++
export NODE_REPL_HISTORY_FILE=/home/arnaud/.node-history
export ANDROID_HOME=/home/arnaud/Dev/android-sdk-linux
export VDPAU_DRIVER=nouveau
export PATH=/home/arnaud/scripts/override-bins:$JAVA_HOME/bin:$GOPATH/bin:/home/arnaud/.cargo/bin:/home/arnaud/Dev/clevercloud/0116-scripts:$PATH

if [[ -t 0 && $(tty) =~ /dev/tty ]] && ! pgrep -u $USER startx &> /dev/null;then
  eval `ssh-agent` && startx
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

#eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/*)

# I just don't like this empty folder being created each time I start an application
rm -rf $HOME/Desktop

source ~/.nvm/nvm.sh
source ~/.cargo/env

# Some plugin made this, don't remember which one
fpath=(/home/arnaud/.local/share/zsh/site-functions $fpath)
fpath=(/home/arnaud/.local/share/zsh/site-functions $fpath)
fpath=(/home/arnaud/.local/share/zsh/site-functions $fpath)
fpath=(/home/arnaud/.local/share/zsh/site-functions $fpath)
fpath=(/home/arnaud/.local/share/zsh/site-functions $fpath)
fpath=(/home/arnaud/.local/share/zsh/site-functions $fpath)
fpath=(/home/arnaud/.local/share/zsh/site-functions $fpath)

source ~/scripts/format-patch.sh

[[ -s /home/arnaud/.autojump/etc/profile.d/autojump.sh ]] && source /home/arnaud/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
