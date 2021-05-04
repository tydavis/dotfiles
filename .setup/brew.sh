#!/usr/bin/env zsh

# == Code Below ==

if ([[ ! -d "/opt/homebrew" ]]) && [[ -f "/private/etc/bashrc_Apple_Terminal" ]]; then
    # Install xcode cli components
    xcode-select --install
    # Install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    brew doctor;
    brew update;

    # Install taps here
    brew tap git-chglog/git-chglog;
    # Tap fonts
    brew tap homebrew/cask-fonts
    # Gitlab kubelogin tap
    brew tap incubator/kubelogin https://gitlab.nordstrom.com/k8s/incubator/homebrew-kubelogin.git;
fi

# Install new brew packages
brewtemp=$(mktemp /tmp/upbrew.XXXX)
brew deps --installed | awk -F ':'  '{print $1}' > $brewtemp
comm -13 $brewtemp ~/.setup/list.brew | while read -r b; do brew install $b ; done
rm $brewtemp

# Install new cask packages
casktemp=$(mktemp /tmp/upbrewcask.XXXX)
brew list -1 --cask > $casktemp
comm -13 $casktemp ~/.setup/list.brewcask | while read -r b; do brew install --cask $b ; done
rm $casktemp

