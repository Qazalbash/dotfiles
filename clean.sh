echo "Removing LibreOffice, Rhythmbox, Thunderbird, and other unnecessary packages..."
apt remove --purge libreoffice* rhythmbox* thunderbird*
echo "Removing unused packages..."
apt autoremove
echo "Cleaning up..."
apt autoclean
echo "Removing orphaned packages..."
apt clean