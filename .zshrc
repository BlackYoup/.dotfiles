# .zshrc

source "$HOME/Dev/antigen/antigen.zsh"

GIT_PROMPT_EXECUTABLE="haskell"

source "$HOME/Dev/zsh-git-prompt/zshrc.sh"
source /etc/profile

#PROMPT='%B%m%~%b$(git_super_status) %# '

antigen-use oh-my-zsh
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search

antigen-apply
PROMPT='%{$fg[cyan]%}[%*]%{$fg[green]%}[%n:%~] $(git_super_status) %{$fg[yellow]%}~ %{$fg[red]%}$ %{$reset_color%}'

setopt no_share_history

if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi

if [[ -t 0 && $(tty) =~ /dev/tty ]] && ! pgrep -u $USER startx &> /dev/null;then
  eval `ssh-agent` && startx
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
alias startClever="MINIFICATION_ENABLED=FALSE QUIET=TRUE grunt dev"
alias search="grep -rn --color -C 1"
alias hibernate="sudo systemctl hibernate"
alias reboot="systemctl reboot"
alias mysql="mysql --auto-rehash"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias npm="PYTHON=/usr/bin/python2.7 /home/arnaud/.npm-packages/bin/npm"
alias vim="nvim"
alias nvim="nvim"
alias tmux="tmux -2"
alias wip="git add . && git cm -m \"WIP\" --no-verify"
alias cp='rsync -av -zz --progress'

export EDITOR="nvim"
export JAVA_HOME=/etc/env.d/alternatives/java-jre/openjdk8-1.8/usr/x86_64-pc-linux-gnu/
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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=$PATH:/home/arnaud/clevercloud/clever-tools/bin:/home/arnaud/.cabal/bin:$JAVA_HOME/bin:$GOPATH/bin:/home/arnaud/.meteor:/home/arnaud/.npm-packages/bin:/home/arnaud/.local/bin:/home/arnaud/.cabal-packages:/usr/bin:$ANDROID_HOME/tools:/opt/eclipse:/home/arnaud/.cargo/bin

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
