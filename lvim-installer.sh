# lvim dependencies

sudo pacman -S --noconfirm --needed neovim npm

# installing lvim

wget https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh
LV_BRANCH='release-1.3/neovim-0.9' bash ./install.sh
rm -v install.sh

# copying the config file

sudo cp -rv lvim ~/.config/.
