#!/usr/bin/env zsh

case `uname` in
  Darwin)
    # commands for OS X go here
    git config --global credential.helper osxkeychain
    git config --global user.email tydavis@gmail.com
    git config --global core.editor "code --wait"
    git config --global difftool.cmd "code --wait --diff $LOCAL $REMOTE"
    git config --global core.excludesfile "/Users/tydavis/.gitignore_global"
    git config --global http.cookiefile /Users/tydavis/.gitcookie
  ;;
  Linux)
    # commands for Linux go here
    git config --global credential.helper "store --file=/home/tydavis/.config/gitcreds"
    git config --global user.email tydavis@gmail.com
    git config --global core.editor nvim
    git config --global difftool.cmd "nvim -d $LOCAL $REMOTE $MERGED -c 'wincmd w' -c 'wincmd J'"
    git config --global core.excludesfile "/home/tydavis/.gitignore_global"
    git config --global http.cookiefile /home/tydavis/.gitcookie
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

