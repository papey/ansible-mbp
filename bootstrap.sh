#!/usr/bin/env bash

function log {
    for i in $(seq "$1"); do echo -n "--- "; done
    echo "$2"
}

function nl {
    echo -e ""
}

# Xcode
log 1 "Is Xcode installed ?"
xcode-select -p > /dev/null 2>&1
if [[ $? != 0 ]] ; then
    echo "Error: Xcode not installed, try cmd : \`xcode-select --install\`"
    exit 1
else
    log 2 "Xcode installation found"
fi

nl

# HomeBrew
log 1 "Setting up HomeBrew"
which -s brew
if [[ $? != 0 ]] ; then
    log 2 "Installing HomeBrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    log 2 "Installed HomeBrew"
else
    log 2 "Updating HomeBrew"
    brew update
    log 2 "Updated HomeBrew"
fi

nl

# Packages
log 1 "Installing pkgs"
brew install python git ansible
log 2 "Pkgs installed"
