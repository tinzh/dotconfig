#/usr/bin/env bash

set -e

pushd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '1s/^/ZSH_THEME="powerlevel10k/powerlevel10k"\n/' .zshrc

mkdir -p bin
cd bin

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim

popd
exec /usr/bin/env bash

