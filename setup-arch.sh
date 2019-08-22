sudo pacman -Syuu
sudo pacman -S krdc trizen vlc libreoffice-fresh pamac-cli keychain
echo "eval `keychain --eval --agents ssh id_rsa`" >> ~/.bashrc
pamac build mattermost-desktop-bin --no-confirm
