#!/usr/bin/env zsh

case "$OSTYPE" in
  darwin*)
    brew update;
    brew upgrade;
    brew cleanup;
    fd -H -t d -E mod -E vendor '.git$' ~/ -x bash -c "cd {//}; git fetch --all --prune ; git merge --ff-only; " ;
  ;;
  linux*)
    sudo pacman -Syu; 
    fd -H -t d -E mod -E vendor '.git$' ~/code/work -x bash -c "cd {//}; git config user.email tyler.m.davis@nordstrom.com; git config http.cookiefile /home/tydavis/.gitcookie-work; " ;
    fd -H -t d -E mod -E vendor '.git$' ~/ -x bash -c "cd {//}; git fetch --all --prune ; git merge --ff-only; " ;
  ;;
esac

gcloud components update -q;
