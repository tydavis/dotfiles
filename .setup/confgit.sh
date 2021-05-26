#!/usr/bin/env zsh

rm ~/.gitconfig # Purge existing gitconf

# Dotfiles config
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config pull.ff only
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config push.default simple
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config protocol.version 2
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no

# Main Git Config
git config --global user.name "Tyler Davis"
git config --global user.email tydavis@gmail.com
git config --global push.default simple
git config --global init.defaultBranch main
git config --global credential.https://gitlab.nordstrom.com.username cm0l
git config --global credential.https://source.developers.google.com.helper "gcloud.sh"
git config --global url."https://gitlab.nordstrom.com/".insteadOf "git@gitlab.nordstrom.com:"
git config --global fetch.parallel 4
git config --global fetch.writeCommitGraphs true
git config --global protocol.version 2
git config --global http.postBuffer 524288000
git config --global status.submodulesummary 1
git config --global pull.ff only
git config --global hub.protocol https

# if [ "$(command -v delta)" ]; then
#   git config --global core.pager delta
#   git config --global interactive.diffFilter "delta --color-only"
#   git config --global delta.line-numbers true
#   git config --global delta.side-by-side false
# fi

case `uname` in
  Darwin)
    # commands for OS X go here
    git config --global credential.helper osxkeychain
    #git config --global core.editor vim
    git config --global core.editor "code --wait"
    git config --global diff.tool vscode
    git config --global difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE"
    git config --global difftool.nvim.cmd "nvim -d \$LOCAL \$REMOTE \$MERGED -c 'wincmd w' -c 'wincmd J'"
    git config --global merge.tool vscode
    git config --global mergetool.vscode.cmd "code --wait \$MERGED"
    git config --global core.excludesfile "/Users/tydavis/.gitignore_global"
    git config --global http.cookiefile /Users/tydavis/.gitcookies
  ;;
  Linux)
    # commands for Linux go here
    git config --global credential.helper "store --file=/home/tydavis/.config/gitcreds"
    #git config --global core.editor vim
    git config --global core.editor "code --wait"
    git config --global diff.tool vscode
    git config --global difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE"
    git config --global difftool.nvim.cmd "nvim -d \$LOCAL \$REMOTE \$MERGED -c 'wincmd w' -c 'wincmd J'"
    git config --global merge.tool vscode
    git config --global mergetool.cmd "code --wait \$MERGED"
    git config --global core.excludesfile "/home/tydavis/.gitignore_global"
    git config --global http.cookiefile /home/tydavis/.gitcookies
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

