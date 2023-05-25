sudo pacman -S networkmanager --noconfirm
sudo systemctl enable NetworkManager
ip link set dev wlan0 mtu 2300
