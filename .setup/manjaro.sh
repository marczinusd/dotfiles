#/bin/sh

sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# OMZ plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# All the things
sudo pacman -Syyu ripgrep zoxide hyperfine exa fzf git-delta btop bat dust fd procs httpie nnn code lazygit xclip mpv libreoffice-still calibre dotnet-sdk firefox-developer-edition emacs nodejs

# AUR stuff
pamac install --no-confirm rider webstorm code-features mcfly gitkraken discord spotify onedrive-abraunegg apple-fonts

# tmux setup
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# doom
git clone https://github.com/marczinusd/.doom.d.git
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

firefox-developer-edition https://github.com/microsoft/cascadia-code/releases
