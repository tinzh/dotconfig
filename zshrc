[ -z "${PS1:-}" ] && return

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/bin/nvim/bin:$PATH

export ZSH="$HOME/.oh-my-zsh" # path to your oh-my-zsh installation
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    dirhistory
    you-should-use
)
zstyle ':omz:update' mode auto # update oh-my-zsh automatically without asking

# stuff to only run on first zsh run
if [ ! -v ISRESOURCE ]; then

    source $ZSH/oh-my-zsh.sh

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/justzhang/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/justzhang/conda/etc/profile.d/conda.sh" ]; then
            . "/home/justzhang/conda/etc/profile.d/conda.sh"
        else
            export PATH="/home/justzhang/conda/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

    unalias g
    unalias gb
    unalias gcan!
    unalias glo
    unalias gpsupf
    unalias gsu
fi

# core git alias extensions
alias gb='git branch | grep -v release'
alias gcan!='gcann!'
alias gcsn!='ga src; gcn! --date=now'
alias gcsm='ga src; gcmsg'
alias gcg='git config --global'
alias gcgu='git config --global --unset'
alias gcoo='gco HEAD~'
alias gdo='gd HEAD~'
alias glo='glof | head -n 5'
alias glof='git log --oneline --decorate --color=always'
alias gpsupf='git push --set-upstream fork'
alias grboo='grb HEAD~ --onto'
alias grhho='grhh HEAD~'
alias grho='grh HEAD~'
alias grf='grff | head -n 5'
alias grff='git reflog --decorate --color=always'
alias gsu='git submodule update --init --recursive'

# display branches for all ca or mos repors
alias gbca='cd ~/caa; pwd; gb; cd ~/cab; pwd; gb; cd ~/cac; pwd; gb; popd > /dev/null; popd > /dev/null; popd > /dev/null'
alias gbcacore='cd ~/caa/core; pwd; gb; cd ~/cab/core; pwd; gb; cd ~/cac/core; pwd; gb; popd > /dev/null; popd > /dev/null; popd > /dev/null'
alias gbmos='cd ~/mosa; pwd; gb; cd ~/mosb; pwd; gb; cd ~/mosc; pwd; gb; popd > /dev/null; popd > /dev/null; popd > /dev/null'

export DELTA_FEATURES=+side-by-side

# for local mac laptop
alias s='ssh -L4000:localhost:4000 chhq-sudwchp19'
alias stop-warpd='launchctl unload /Library/LaunchAgents/com.warpd.warpd.plist'
alias restart-warpd='stop-warpd;sleep 1;warpd'
alias drwchrome='nohup /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --flag-switches-begin --enable-audio-service-sandbox --disable-background-timer-throttling --disable-renderer-backgrounding --disable-backgrounding-occluded-windows --enable-experimental-extension-apis --flag-switches-end &> /dev/null &'

# get compile_commands right
alias sedcc='sed -i '"'"'s/\/src\/Core\//\/submodules\/core\/src\//g;s/\/src\/CoreAppLibs\//\/submodules\/CoreAppLibs\//g;s/\/src\/ContractDataLibs\//\/submodules\/ContractDataLibs\//g;s/\/src\/ChexLib\//\/submodules\/chex_lib\/src\//g;s/src\/React/submodules\/react\/src/g'"'"


# runs command, setting $wd to working directory
function use-wd() {
    wd=$(pwd | cut -d/ -f4)
    eval "$*"
}
function alias-wd() { alias $1="use-wd '$2'" }
alias awd='alias-wd'

# build helpers
awd ca 'conda activate $wd'
awd cr 'conda activate base && yes | conda env remove -n $wd; yes | conda env create --name $wd --file ~/$wd/conda/deploy.yml && ca' # conda recreate, used by cu as fallback
awd cu 'ca && yes | conda env update -f ~/$wd/conda/deploy.yml || cr' # conda update, preferred over cr

awd gendebug 'pushd ~/$wd && (conda activate $wd && scripts/cmake_gen.py -t debug -d build/debug --update-clangd-config && sedcc build/debug/compile_commands.json; popd)'
awd genrelease 'pushd ~/$wd && (conda activate $wd && scripts/cmake_gen.py -t release -d build/release; popd)'
awd reset-release '(pushd ~/$wd && (rm -rf build/release; popd)); genrelease'

awd nd 'ca && cd ~/$wd/build/debug && ninja -j 60'
awd ndi 'nd install'
awd n 'ca && cd ~/$wd/build/release && ninja -j 60'
awd ni 'n install'
function cpi() { echo "using version ${1:-318}"; use-wd "cp -av install/* ~/qube/\$wd/${1:-318}" } # copy install folder to qube
function nicp() { ni && cpi $1 && rb }

# misc helpers
alias rb='printf "\a"' # ring bell
alias tfn='tail -F -n +1'

# automatically re-source .zshrc on change
if [[ $(uname) == "Darwin" ]]; then
    last_source_time=$(stat -Lf %m ~/.zshrc)
    PROMPT_COMMAND='test $(stat -Lf %m ~/.zshrc) -ne $last_source_time && ISRESOURCE=true source ~/.zshrc'
else
    last_source_time=$(stat -Lc %Y ~/.zshrc)
    PROMPT_COMMAND='test $(stat -Lc %Y ~/.zshrc) -ne $last_source_time && ISRESOURCE=true source ~/.zshrc'
fi
precmd() { eval "$PROMPT_COMMAND" }
