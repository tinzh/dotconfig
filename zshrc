[ -z "${PS1:-}" ] && return

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/bin/nvim/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    dirhistory
    you-should-use
)
# update automatically without asking
zstyle ':omz:update' mode auto

source $ZSH/oh-my-zsh.sh

unalias g
unalias gsu
unalias gpsupf
alias gsu='git submodule update --init --recursive'
alias gpsupf='git push --set-upstream fork'

# for local
alias s='ssh -L4000:localhost:4000 chhq-sudwchp19'
alias stop-warpd='launchctl unload /Library/LaunchAgents/com.warpd.warpd.plist'
alias restart-warpd='stop-warpd;sleep 1;warpd'
alias drwchrome='nohup /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --flag-switches-begin --enable-audio-service-sandbox --disable-background-timer-throttling --disable-renderer-backgrounding --disable-backgrounding-occluded-windows --enable-experimental-extension-apis --flag-switches-end &> /dev/null &'

# for remote
alias sedcc='sed -i '"'"'s/\/src\/Core\//\/submodules\/core\/src\//g;s/\/src\/CoreAppLibs\//\/submodules\/CoreAppLibs\//g;s/\/src\/ContractDataLibs\//\/submodules\/ContractDataLibs\//g;s/\/src\/ChexLib\//\/submodules\/chex_lib\/src\//g;s/src\/React/submodules\/react\/src/g'"'"
alias gencmd='scripts/cmake_gen.py -t debug -d build/debug --update-clangd-config && sedcc build/debug/compile_commands.json'
alias tfn='tail -F -n +1'

alias ringbell='printf "\a"'

# automaticall resource .zshrc on change
if [[ $(uname) == "Darwin" ]]; then
    last_source_time=$(stat -Lf %m ~/.zshrc)
    PROMPT_COMMAND='test $(stat -Lf %m ~/.zshrc) -ne $last_source_time && source ~/.zshrc'
else
    last_source_time=$(stat -Lc %Y ~/.zshrc)
    PROMPT_COMMAND='test $(stat -Lc %Y ~/.zshrc) -ne $last_source_time && source ~/.zshrc'
fi
precmd() { eval "$PROMPT_COMMAND" }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

