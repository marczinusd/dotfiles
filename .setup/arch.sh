#/bin/sh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# OMZ plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/wfxr/forgit.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/forgit

# ALL the things
yay -S ripgrep zoxide hyperfine exa fzf git-delta btop bat dust fd the_silver_searcher procs httpie hub nnn visual-studio-code-bin lazygit neovim broot xclip mpv libreoffice-still calibre dotnet-sdk firefox-developer-edition emacs nvm onedrive-abraunegg joplin-desktop apple-fonts shfmt jq libappindicator-gtk3

# Proprietary software
yay -S discord spotify plex-media-server-plexpass

# Licensed stuff
yay -S sublime-text-4 sublime-merge rider webstorm webstorm-jre

# i3 things for the truly enlightened
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
