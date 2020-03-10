###packages

pacman -Suy --noconfirm
pacman -S --noconfirm rofi i3-gaps dunst polybar htop kitty fzf neovim vim docker kubectl zsh tmux blueman


##symlinks
cd ~
mv ~/dotfiles ~/.dotfiles
ln -s ~/.dotfiles/.tmux.conf .tmux.conf 
ln -s ~/.dotfiles/.vimrc .vimrc
ln -s ~/.dotfiles/.Xresources .Xresources
ln -s ~/.dotfiles/.zshrc .zshrc
ln -s ~/.dotfiles/.gitconfig .gitconfig  


mrdir .config
cd .config
ln -sn ~/.dotfiles/.config/dunst dunst
ln -sn ~/.dotfiles/.config/kitty kitty
ln -sn ~/.dotfiles/.config/i3 i3
ln -sn ~/.dotfiles/.config/nvim nvim
ln -sn ~/.dotfiles/.config/polybar polybar

nvim +'PlugInstall --sync' +'PlugUpdate' +qa  


##snap
cd ~
git clone https://aur.archlinux.org/snapd.git
cd snapd
sudo -u $USER makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

##fonts
cd ~/pkg &&
git clone https://aur.archlinux.org/nerd-fonts-complete.git &&
cd nerd-fonts-complete &&
sudo -u $USER makepkg -si

i3 reload
