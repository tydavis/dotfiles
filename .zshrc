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
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH=/opt/homebrew/bin:$PATH:$HOME/.bin:$HOME/.cargo/bin:/Users/tydavis/go/bin
    export AWS_SDK_LOAD_CONFIG=1
    if [ -f '/Users/tydavis/.bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tydavis/.bin/google-cloud-sdk/path.zsh.inc'; fi
    if [ -f '/Users/tydavis/.bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tydavis/.bin/google-cloud-sdk/completion.zsh.inc'; fi
    # iTerm integration
    #test -e /Users/tydavis/.iterm2_shell_integration.zsh && source /Users/tydavis/.iterm2_shell_integration.zsh || true
    # Unlock Keychain
    alias unlock='security unlock-keychain ~/Library/Keychains/login.keychain'
    #
    `eval $HOME/.bin/pathuniq-rs`
  ;;
  linux*)
    # ZSH Settings
    zstyle ':completion:*' completer _complete _ignored
    zstyle :compinstall filename '/home/tydavis/.zshrc'
    # == Archlinux (?) settings
    alias psc='ps xawf -eo pid,user,cgroup,args'
    alias vim='nvim'
    alias gdb='gdb -tui'

    export GOPATH=/home/tydavis/go
    export PATH=$PATH:$HOME/.cargo/bin:/usr/local/go/bin:/home/tydavis/go/bin:/home/tydavis/.bin:/home/tydavis/.local/bin

    # Rust GDB problems
    export PYTHONPATH=$PYTHONPATH:$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/etc

    if [ "$(command -v hub)" ]; then
        eval "$(hub alias -s)"
    fi


    `eval $HOME/.bin/pathuniq-rs`
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
  alias cat='bat -pp'
  export BAT_THEME="Solarized (light)"
  #export BAT_THEME="Nord"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

if [ "$(command -v zstd)" ]; then
    alias zstd='zstd -T0'
fi

if [ "$(command -v fd)" ]; then
    alias upcode="fd -H -t d -E mod -E vendor '.git$' ~/code -x bash -c \"cd {//}; ~/.bin/fetchgit;\""
    # FZF fixes to use fd
    export FZF_DEFAULT_COMMAND="fd . $HOME"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd -t d . $HOME"
else
    alias upcode="find ~/code -name \".git\" |xargs -n1 -I{} bash -c ' cd {}/..; ~/.bin/fetchgit; ' "
fi


# To load files
# git clone --bare https://github.com/tydavis/dotfiles.git $HOME/.dotfiles

#shorten the git dotfiles management
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# Ignore files that aren't relevant
# dotfiles config --local status.showUntrackedFiles no

## Swagger command for go-swagger (https://goswagger.io/install.html)
#alias swagger="docker run --rm -it -e GOPATH=$HOME/go:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger"

export PS1="%m [%n:%c]%# "

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
