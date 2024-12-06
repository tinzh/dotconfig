# Setup my terminal, Neovim, etc.

### Clone repo

```
mkdir -p $HOME/.config
pushd $HOME/.config
rm -rf nvim tmux
git init
git remote add origin git@github.com:tinzh/dotconfig.git
git fetch
git checkout origin/main -b main
popd
```

### oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Powerlevel10k

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### zsh

```
rm .zshrc
ln -s ~/.config/zshrc .zshrc
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "exec zsh" >> .bashrc
exec zsh
```

### Neovim

```
cd ~
mkdir -p bin
pushd bin

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim

popd
```

### Tmux

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### On CentOS 7

Get nvim from https://github.com/neovim/neovim-releases/releases

```
conda install zsh "git>=2.23.0" tmux gcc ripgrep
```
