# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
omz reload

# PPAs
sudo add-apt-repository -y ppa:lazygit-team/release
sudo add-apt-repository -y ppa:neovim-ppa/unstable
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# OMZ plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/wfxr/forgit.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/forgit

# all the things
sudo apt install -y ripgrep zoxide hyperfine exa fzf bat dust fd-find silversearcher-ag httpie hub nnn lazygit broot xclip shfmt jq neofetch p7zip-full p7zip-rar
# editors
sudo apt install neovim neovim-qt emacs code
# misc stuff
sudo apt install mpv

# some nice fonts
wget https://github.com/adam7/delugia-code/releases/download/v2110.31.1/delugia-complete.zip
unzip delugia-complete.zip
rm delugia-complete.zip
mv delugia-complete/*.ttf .local/share/fonts
rm -rf delugia-complete/

wget https://github.com/microsoft/cascadia-code/releases/download/v2110.31/CascadiaCode-2110.31.zip
unzip CascadiaCode-2110.31.zip
rm CascadiaCode-2110.31.zip
mv CascadiaCode-2110.31/ttf/*.ttf .local/share/fonts
rm -rf CascadiaCode-2110.31

wget https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg
7z x SF-Pro.dmg
cd SFProFonts/
7z x SF\ Pro\ Fonts.pkg
7z x Payload\~
mv Library/Fonts/*.otf $HOME/.local/share/fonts/
cd $HOME
rm -rf SFProFonts

# .NET SDK
sudo apt-get install -y apt-transport-https 
sudo apt-get install -y dotnet-sdk-6.0

# hyperfine 
wget https://github.com/sharkdp/hyperfine/releases/download/v1.12.0/hyperfine_1.12.0_amd64.deb
sudo dpkg -i hyperfine_1.12.0_amd64.deb
rm hyperfine_1.12.0_amd64.deb

# delta
wget https://github.com/dandavison/delta/releases/download/0.10.2/git-delta_0.10.2_amd64.deb
sudo dpkg -i git-delta_0.10.2_amd64.deb
rm git-delta_0.10.2_amd64.deb

# btop 
wget https://github.com/aristocratos/btop/releases/download/v1.1.2/btop-1.1.2-x86_64-linux-musl.tbz
mkdir btop && tar -xf btop-1.1.2-x86_64-linux-musl.tbz -C btop
cd btop
sudo make install
cd $HOME
rm -rf btop

# dust
wget https://github.com/bootandy/dust/releases/download/v0.7.5/dust-v0.7.5-x86_64-unknown-linux-gnu.tar.gz
mkdir dust && tar -xf dust-v0.7.5-x86_64-unknown-linux-gnu.tar.gz -C dust
sudo mv dust/dust-v0.7.5-x86_64-unknown-linux-gnu/dust /usr/local/bin/
rm -rf dust

# lazydocker 
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# tmux setup
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf

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

