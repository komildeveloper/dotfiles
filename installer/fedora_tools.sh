#!/usr/bin/env bash
# Auther :Komil Sobitov <komil.sobitov.uzb@gmail.com>
# Description:
# Automatically install tools for Linux distribution, such as Linux Servers (CentOS, Fedora, Ubuntu)

# Enable debug
# set -x

# Check if program exists
function program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value.
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

# Assert the special programs must exist.
function program_must_exist() {
    program_exists $1

    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

function dnf_install_dependency(){
    program_exists "pip"
    if [ "$?" -ne 0 ]; then
	sudo dnf install python3-pip -y
	sudo dnf install python3-wheel -y
    fi
}

# Install packages by yum(For Centos/Fedora/RedHat-based distributions)
function centos_fedora_install() {
    dnf_install_dependency

    echo "start to install git"
    program_exists "git" || sudo dnf install -y git

    echo "start to install vim"
    program_exists "vim" || sudo dnf install -y vim

    echo "start to install tmux"
    program_exists "tmux" || sudo dnf install -y tmux

    echo "start to install neovim"
    program_exists "neovim" || sudo dnf install -y neovim

    echo "Installing neovim build prerequisites"
    program_exists "ninja-build" || sudo dnf -y install ninja-build
    program_exists "cmake" || sudo dnf -y install cmake
    program_exists "gcc" || sudo dnf -y install gcc
    program_exists "make" || sudo dnf -y install make
    program_exists "unzip" || sudo dnf -y install unzip
    program_exists "gettext" || sudo dnf -y install gettext
    program_exists "curl" || sudo dnf -y install curl
    program_exists "gcc-c++" || sudo dnf -y install gcc-c++
    program_exists "libstdc++" || sudo dnf -y install libstdc++

    echo "start to install fzf"
    program_exists "emacs" || sudo dnf install -y fzf

    echo "start to install ripgrep"
    program_exists "emacs" || sudo dnf install -y ripgrep

    echo "start to install tree"
    program_exists "tree" || sudo dnf install -y tree

    echo "start to install zsh"
    program_exists "zsh" || sudo dnf install -y zsh

    echo "start to install htop"
    program_exists "zsh" || sudo dnf install -y htop

    echo "start to install zoxide"
    program_exists "zsh" || sudo dnf install -y zoxide

    echo "Installing Node.js"
    sudo dnf module install nodejs:18/common
}

function install_awesome_tools() {
  centos_fedora_install 
}

# Start to install all awesome tools
install_awesome_tools

function create_config_files() {
  echo "Installing vim package manager"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing tmux package manager"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  echo "Downloading tmux config file"
  curl https://raw.githubusercontent.com/komildeveloper/dotfiles/main/tmux/.config/tmux.conf -o ~/.tmux.conf

  echo "Downloading vim config file"
  curl https://raw.githubusercontent.com/komildeveloper/dotfiles/main/vim/.vimrc -o ~/.vimrc
}

create_config_files
