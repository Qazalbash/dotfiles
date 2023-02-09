echo "Installing Visual Studio Code..."
firefox https://go.microsoft.com/fwlink/?LinkID=760868
mv ~/Downloads/code*.deb .
dpkg -i code*.deb
echo "Installing Fira Code font..."
apt install fonts-firacode

username=$(logname)
cp c.json /home/$username/.config/Code/User/snippets/c.json