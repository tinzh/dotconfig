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
ln -s ~/.config/.zshrc .zshrc
exec zsh
```

Add the following to your .zshrc:
```
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    dirhistory
    you-should-use
)
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

