###packages

pacman -Suy
pacman -S rofi
pacman -S i3-gaps
pacman -S dunst
pacman -S polybar

pacman -S htop
pacman -S kitty
pacman -S python
pacman -S fzf
pacman -S nvim
pacman -S vim
pacman -S docker
pacman -S kubectl
pacman -S zsh
pacman -S tmux
pacman -S blueman


##symlinks
cd ~
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
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

##fonts
cd ~/pkg &&
git clone https://aur.archlinux.org/nerd-fonts-complete.git &&
cd nerd-fonts-complete &&
makepkg -si

i3 reload