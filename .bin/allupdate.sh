#!/usr/bin/zsh

sudo pacman -Syu; 

fd -H -j 2 -t d -E mod -E vendor '.git$' ~/code/work -x bash -c "cd {//}; git config user.email tyler.m.davis@nordstrom.com; git config http.cookiefile /home/tydavis/.gitcookie-work; " ;
fd -H -j 2 -t d -E mod -E vendor '.git$' ~/ -x bash -c "cd {//}; git fetch --all --prune ; git merge --ff-only; " ;

gcloud components update -q;
