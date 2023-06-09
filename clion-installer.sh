wget "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.28.1.15219.tar.gz?_gl=1*vjyq2k*_ga*MTY4MDU4NDY5My4xNjg2MzQ0NDgz*_ga_9J976DJZ68*MTY4NjM0NDQ4My4xLjEuMTY4NjM0NDU1NC4wLjAuMA.." -O jetbrains-toolbox-1.28.1.15219.tar.gz

sudo pacman -S --needed --noconfirm tar

sudo tar -xzf jetbrains-toolbox-1.28.1.15219.tar.gz -C /opt

cd /opt/jetbrains-toolbox-1.28.1.15219

./jetbrains-toolbox
