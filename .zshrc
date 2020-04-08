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

# == Universal Configs ==
export EDITOR="vim"
export VISUAL="vim"
export GO111MODULE=on
export BAT_THEME="Monokai Extended Light"

alias less='less -FRX'
alias ls='/bin/ls -F'
alias rg='rg -p'

# Using nvim again
alias vim='nvim'

# To load files
# git clone --bare https://github.com/tydavis/dotfiles.git $HOME/.dotfiles

#shorten the git dotfiles management
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# Ignore files that aren't relevant
# dotfiles config --local status.showUntrackedFiles no

export PS1="%m [%n:%c]%# "

# for ZSH
case "$OSTYPE" in
  darwin*)
    # == OSX Settings ==
    export PATH=/usr/local/bin:$PATH:$HOME/.bin:/usr/local/opt/openjdk/bin:/usr/local/go/bin:/Users/tydavis/go/bin
    export AWS_SDK_LOAD_CONFIG=1
    if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
    if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi
    export MANPAGER="sh -c 'col -b | bat -l man -p'"
    `eval $HOME/go/bin/pathuniq`
  ;;
  linux*)
    # == Archlinux (?) settings
    export MANPAGER="sh -c 'col -b | bat -l man -p'"
    alias psc='ps xawf -eo pid,user,cgroup,args'
    
    export GOPATH=/home/tydavis/go
    export PATH=$PATH:$HOME/.cargo/bin:/usr/local/go/bin:/home/tydavis/go/bin:/home/tydavis/.bin
    
    if [ -f '/home/tydavis/.bin/google-cloud-sdk/path.zsh.inc' ]; then . '/home/tydavis/.bin/google-cloud-sdk/path.zsh.inc'; fi
    if [ -f '/home/tydavis/.bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/tydavis/.bin/google-cloud-sdk/completion.zsh.inc'; fi
    `eval /home/tydavis/.bin/pathuniq`
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
    # No BSD yet
  ;;
esac

