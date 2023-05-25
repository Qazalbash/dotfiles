sudo git clone https://aur.archlinux.org/yay-git.git
# gradf is the username of the system, may very system to system
sudo chown -R gradf:gradf ./yay-git
cd yay-git
makepkg -sirc
