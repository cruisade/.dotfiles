###packages

yes | sudo pacman -Suy
sudo pacman -S --noconfirm rofi i3-gaps dunst polybar htop kitty fzf neovim vim docker kubectl zsh tmux blueman snapd
sudo pacman -Ss font
sudo systemctl enable --now snapd.socket


##symlinks
cd ~

ln -s ~/.dotfiles/.tmux.conf .tmux.conf 
ln -s ~/.dotfiles/.vimrc .vimrc
ln -s ~/.dotfiles/.Xresources .Xresources
ln -s ~/.dotfiles/.zshrc .zshrc
ln -s ~/.dotfiles/.gitconfig .gitconfig  


cd ./.config
ln -sn ~/.dotfiles/.config/dunst dunst
ln -sn ~/.dotfiles/.config/kitty kitty
ln -sn ~/.dotfiles/.config/i3 i3
ln -sn ~/.dotfiles/.config/nvim nvim
ln -sn ~/.dotfiles/.config/polybar polybar

sudo chsh -s $(which zsh)
nvim +'PlugInstall --sync' +'PlugUpdate' +qa  

##fonts
sudo cp .dotfiles/.config/polybar/fonts/Iosevka\ Nerd\ Font\ Complete.ttf /usr/share/fonts
fc-cache
