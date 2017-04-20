#!/bin/bash

function ask() {
    while true; do
        read -e -n 1 -p "Do you want to install $1 : [Y]es/[N]o : " ANSWER
        echo
        case $ANSWER in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
        esac
    done
}

if [[ $1 == "-f" ]]; then
    FORCE=1
else
    FORCE=0
fi

# Git config file
if [ $FORCE -eq 1 ] || ask "git config"; then
    echo "Installing git config"
    cp -v gitconfig $HOME/.gitconfig
    echo
else
    echo "Skipping git config install"
fi

# ZSH config files
if [ $FORCE == 1 ] || ask "ZSH config"; then
    echo "Installing zsh config"
    if command -v wget >/dev/null 2>&1; then
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    elif command -v curl >/dev/null 2>&1; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        "Don't have curl or wget, install one, or install oh-my-zsh manually"
    fi

    cp -rv custom $HOME/.oh-my-zsh/

    if ask "zsh with remote config files"; then
        cp -v zshrc_for_remote $HOME/.zshrc
    else
        cp -v zshrc $HOME/.zshrc
    fi
    echo
else
    echo "Skipping zsh config install"
fi

# Hosts file
if [ $FORCE -eq 1 ] || ask "hosts file"; then
    echo "Installing hosts file for ssh completion"
    openssl enc -aes-256-cbc -d -in hosts.dat > $HOME/.hosts
    echo
else
    echo "Skipping hosts file install"
fi

# Vim config files
if [ $FORCE -eq 1 ] || ask "vim config"; then
    echo "Installing vim config"
    cp -v vimrc $HOME/.vimrc
    cp -rv vim $HOME/.vim
else
    echo "Skipping vim config install"
fi


# IRB config files
if [ $FORCE == 1 ] || ask "IRB config"; then
    echo "Installing irb config"
    cp -v irbc $HOME/.irbc
    cp -v irbc_rails $HOME/.irbc_rails
    echo
else
    echo "Skipping IRB config install"
fi

