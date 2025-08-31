# installation

sudo pacman -S --noconfirm --needed git --noconfirm

# configuration

git config --global user.name "Meesum Qazalbash"
git config --global user.email "meesumqazalbash@gmail.com"

# Signed Commits
git config --global commit.gpgsign true

# ssh-key generation

ssh-keygen -t rsa -b 4096 -C "meesumqazalbash@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -sel c

echo "The key has been saved in the clipboard."
echo "Add it as your new GPG Key to the github."
echo "Here is the link to the article for reference: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account"
