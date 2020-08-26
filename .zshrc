# Created by newuser for 5.7.1

# The following lines were added by compinstall
#
#zstyle ':completion:*' completer _complete _ignored
#zstyle :compinstall filename '/Users/tydavis/.zshrc'

# for ZSH
case "$OSTYPE" in
  darwin*)
    # ZSH Settings
    zstyle ':completion:*' completer _complete _ignored
    zstyle :compinstall filename '/Users/tydavis/.zshrc'
    # == OSX Settings ==
    export PATH=/usr/local/bin:$PATH:$HOME/.bin:$HOME/.cargo/bin:/usr/local/opt/openjdk/bin:/usr/local/go/bin:/Users/tydavis/go/bin
    export AWS_SDK_LOAD_CONFIG=1
    if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
    if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi
    `eval $HOME/go/bin/pathuniq`
  ;;
  linux*)
    # ZSH Settings
    zstyle ':completion:*' completer _complete _ignored
    zstyle :compinstall filename '/home/tydavis/.zshrc'
    # == Archlinux (?) settings
    alias psc='ps xawf -eo pid,user,cgroup,args'
    
    export GOPATH=/home/tydavis/go
    export PATH=$PATH:$HOME/.cargo/bin:/usr/local/go/bin:/home/tydavis/go/bin:/home/tydavis/.bin:/home/tydavis/.local/bin
    
    if [ -f '/home/tydavis/.bin/google-cloud-sdk/path.zsh.inc' ]; then . '/home/tydavis/.bin/google-cloud-sdk/path.zsh.inc'; fi
    if [ -f '/home/tydavis/.bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/tydavis/.bin/google-cloud-sdk/completion.zsh.inc'; fi
    `eval /home/tydavis/.bin/pathuniq`
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
    # No BSD yet
  ;;
esac

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
export EDITOR="nvim"
export VISUAL="nvim"
export GO111MODULE=on

alias less='less -FX'
alias ls='/bin/ls -F'
#alias rg='rg -p'
alias vim='nvim'

if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa -G  --color auto -a -s type'
    alias ll='exa -l --color always -a -s type'
fi

if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp --theme="Nord"'
  #export BAT_THEME="Solarized (light)"
  export BAT_THEME="Nord"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# To load files
# git clone --bare https://github.com/tydavis/dotfiles.git $HOME/.dotfiles

#shorten the git dotfiles management
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# Ignore files that aren't relevant
# dotfiles config --local status.showUntrackedFiles no

export PS1="%m [%n:%c]%# "


