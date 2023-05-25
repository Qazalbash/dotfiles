# C/C++

sudo pacman -S --noconfirm gcc cmake make

# Python3

sudo pacman -S --noconfirm python-pip
pip3 install --upgrade pip
pip3 install --upgrade setuptools
pip3 install --upgrade wheel
pip3 install --upgrade virtualenv
pip3 install matplotlib numpy pandas


# Rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source "$HOME/.cargo/env"
source "$HOME/.bash_profile"
source "$HOME/.bashrc"
