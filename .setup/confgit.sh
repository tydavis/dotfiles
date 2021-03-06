#!/usr/bin/env zsh

rm ~/.gitconfig # Purge existing gitconf

# Dotfiles config
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config protocol.version 2
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config pull.ff only
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config push.default simple
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no

# Main Git Config
git config --global core.commitGraph true
git config --global credential.https://source.developers.google.com.helper "gcloud.sh"
git config --global fetch.parallel 4
git config --global fetch.writeCommitGraphs true
git config --global hub.protocol https
git config --global init.defaultBranch main
git config --global pack.threads 0 # Auto-detect threads from CPU
git config --global pack.writeReverseIndex true
git config --global protocol.version 2
git config --global pull.ff only
git config --global push.default simple
git config --global push.followTags true
git config --global status.submodulesummary 1
git config --global user.email tydavis@gmail.com
git config --global user.name "Tyler Davis"

# if [ "$(command -v delta)" ]; then
#   git config --global core.pager delta
#   git config --global delta.line-numbers true
#   git config --global delta.side-by-side false
#   git config --global interactive.diffFilter "delta --color-only"
# fi

case `uname` in
  Darwin)
    # commands for OS X go here
    #git config --global core.editor vim
    git config --global core.editor "code --wait"
    git config --global core.excludesfile "/Users/tydavis/.gitignore_global"
    git config --global credential.helper osxkeychain
    git config --global diff.tool vscode
    git config --global difftool.nvim.cmd "nvim -d \$LOCAL \$REMOTE \$MERGED -c 'wincmd w' -c 'wincmd J'"
    git config --global difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE"
    git config --global http.cookiefile /Users/tydavis/.gitcookies
    git config --global merge.tool vscode
    git config --global mergetool.vscode.cmd "code --wait \$MERGED"
  ;;
  Linux)
    # commands for Linux go here
    #git config --global core.editor vim
    git config --global core.editor "code --wait"
    git config --global core.excludesfile "/home/tydavis/.gitignore_global"
    git config --global credential.helper "store --file=/home/tydavis/.config/gitcreds"
    git config --global diff.tool vscode
    git config --global difftool.nvim.cmd "nvim -d \$LOCAL \$REMOTE \$MERGED -c 'wincmd w' -c 'wincmd J'"
    git config --global difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE"
    git config --global http.cookiefile /home/tydavis/.gitcookies
    git config --global merge.tool vscode
    git config --global mergetool.cmd "code --wait \$MERGED"
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

