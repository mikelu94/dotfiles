#!/bin/bash

os=`uname -s`
pkgmgr=""
num_pkgs=0

custom_install_command () {
    if [ $# -ne 1 ]; then
        echo "Error: install_commands can only be invoked with one input"
        exit
    fi
    case $1 in 
        "brew") /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";;
        "oh-my-zsh") sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";;
    esac
}

install_package () {
# $1=package name
# $2=command to check existence of package
# $3=custom install command (optional)
    if [ $# -lt 2 ]; then
        echo "Error: install_package invoked with less than 2 inputs"
        exit
    fi
    eval $2 &> /dev/null
    if [ $? -ne 0 ]; then
        echo "$1 not found. Installing $1."
        if [ $# -eq 1 ]; then
            $pkgmgr install $1
        else
            custom_install_command $1
        fi
        num_pkgs=$(( $num_pkgs + 1  ))
    else 
        echo "$1 found."
    fi
}

if [ "$os" = "Darwin" ]; then
    install_package "brew" "which brew" 1
    pkgmgr="usr/local/bin/brew"
elif [ -f /etc/debian_version ]; then
    pkgmgr="sudo /usr/bin/apt-get"
fi

install_package "vim" "which vim"
install_package "tmux" "which tmux"
install_package "zsh" "which zsh"
install_package "oh-my-zsh" "find ~ -maxdepth 1 -name '.oh-my-zsh' -type d | grep oh-my-zsh"

echo "Installed $num_pkgs packages."

for configFile in .*; do
    if [ -f $configFile ]; then
        if [ `find ~ -maxdepth 1 -name $configFile -type d | wc -l` -ne 0 ]; then
            echo "Moving $configFile to ~"
            cp $configFile ~/$configFile
        fi
    fi
done
