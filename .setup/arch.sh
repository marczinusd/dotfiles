#/bin/sh

echo "--- Prerequisites"
echo "    => yay (https://github.com/Jguer/yay#installation)"
echo "          -> uncomment/add 'Color', 'ILoveCandy', 'VerbosePkgLists' and 'ParallelDownloads = 5' in /etc/pacman.conf"

echo "Refreshing mirror list, this might take a while"
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo "Old mirrorlist backed up at /etc/pacman.d/mirrorlist.backup"
curl -s "https://archlinux.org/mirrorlist/?country=AT&country=DK&country=FI&country=FR&country=DE&country=HU&country=GB&protocol=http&protocol=https&ip_version=4&ip_version=6" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 8 - > mirrorlist
sudo mv -f mirrorlist /etc/pacman.d/mirrorlist

echo "Update system"
yay -Syu

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
omz reload

# OMZ plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/wfxr/forgit.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/forgit
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Command line utilities
yay -S ripgrep zoxide hyperfine exa fzf git-delta btop bat dust fd the_silver_searcher procs httpie hub nnn lazygit lazydocker-bin broot xclip shfmt jq neofetch
# Editors
yay -S visual-studio-code-bin neovim neovim-qt-git emacs 
# SDKs
yay -S dotnet-sdk nvm 
# Desktop apps
yay -S firefox-developer-edition mpv libreoffice-still calibre onedrive-abraunegg joplin-desktop 
# Some nice fonts
yay -S apple-fonts ttf-cascadia-code ttf-ibm-plex 
# The rest
yay -S libappindicator-gtk3 

# Proprietary software
yay -S discord spotify plex-media-server-plexpass

# DB stuff
yay -S dbeaver redis

# Licensed stuff
yay -S bcompare rider webstorm webstorm-jre clion clion-jre datagrip datagrip-jre 

# i3 things for the truly enlightened
yay -S i3-gaps dunst polybar rofi arandr qt5ctl lxappearance alsa calc pywal networkmanager-dmenu playerctl zscroll

# tmux setup
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Docker
yay -S docker
systemctl enable docker
systemctl start docker
sudo usermod -aG docker $USER

# doom
git clone https://github.com/marczinusd/.doom.d.git
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# get fzf repo for completion stuff
git clone https://github.com/junegunn/fzf.git .fzf

# apply dotfiles
alias gconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

git clone --bare git@github.com:marczinusd/dotfiles.git $HOME/.cfg
gconfig checkout
gconfig config --local status.showUntrackedFiles no
