#/bin/sh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# OMZ plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# ALL the things
yay -S ripgrep zoxide hyperfine exa fzf git-delta btop bat dust fd the_silver_searcher procs httpie hub nnn code code-features lazygit neovim broot xclip mpv libreoffice-still calibre dotnet-sdk firefox-developer-edition emacs nvm rider webstorm webstorm-jre gitkraken discord spotify onedrive-abraunegg joplin plex-media-server-plexpass apple-fonts 

# i3 stuff
yay -S i3-gaps dunst polybar rofi arandr qt5ctl lxappearance alsa calc pywal networkmanager-dmenu playerctl zscroll

# tmux setup
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# doom
git clone https://github.com/marczinusd/.doom.d.git
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# get fzf repo for completion stuff
git clone https://github.com/junegunn/fzf.git .fzf

# apply dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

git clone git@github.com:marczinusd/dotfiles.git $HOME/cfg
config checkout
config config --local status.showUntrackedFiles no
