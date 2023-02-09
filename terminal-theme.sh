# Update your software repositories.
apt-get update
apt-get upgrade

# Install Git.
# Install Vim
apt-get install -y git vim

git clone https://github.com/pixegami/terminal-profile.git

cd terminal-profile

./install_powerline.sh
./install_terminal.sh
./install_profile.sh