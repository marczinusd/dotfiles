#/bin/sh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

pacman -Syyu ripgrep zoxide hyperfine exa fzf git-delta btop bat dust fd procs httpie zsh-autosuggestions code lazygit xclip mpv libreoffice-still calibre dotnet-sdk

# AUR stuff
pamac install --no-confirm rider webstorm code-features mcfly gitkraken discord spotify onedrive-abraunegg nnn-icons
