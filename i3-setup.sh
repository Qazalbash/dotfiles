# essential downloads

sudo pacman -S --noconfirm i3 cbatticon parcellite fish kitty feh

# Nerd font setup

wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip"
mkdir -p ~/.local/share/fonts
mv ./Hack.zip ~/.local/share/fonts/.
cd ~/.local/share/fonts
unzip Hack.zip
rm -rvf Hack.zip
