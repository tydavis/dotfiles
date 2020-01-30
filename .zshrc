# Created by newuser for 5.7.1

# The following lines were added by compinstall
#
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/tydavis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
unsetopt autocd beep extendedglob
#bindkey -e
bindkey -v
# End of lines configured by zsh-newuser-install

# ZSH VIM MODE 
export KEYTIMEOUT=1
###

export EDITOR="vim"
export VISUAL="vim"

### GOLANG
export GOPATH=/home/tydavis/go
export GO111MODULE=on

export PATH=$PATH:$HOME/.cargo/bin:/usr/local/go/bin:/home/tydavis/go/bin:/home/tydavis/.bin

export MANPAGER="sh -c 'col -b | bat -l man -p'"
alias less='less -FRX'
alias rg='rg -p'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias ls='/bin/ls -F'

if [ -f '/home/tydavis/.bin/google-cloud-sdk/path.zsh.inc' ]; then . '/home/tydavis/.bin/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/tydavis/.bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/tydavis/.bin/google-cloud-sdk/completion.zsh.inc'; fi

## for d in `find ~/go/src -name ".git"|grep -E -v "cargo|pkg|npm|testdata|vendor"`; do cd $d/..; echo `pwd`:; git pull; done
# fd -H -t d -E mod '.git$' ~/ -x git -C {//} pull;

`eval /home/tydavis/.bin/pathuniq`

export PS1="%m [%n:%c]%# "

export BAT_THEME="Monokai Extended Light"
