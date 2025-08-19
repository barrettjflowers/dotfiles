#-------------------#
#-------------------#
# ~/.zshrc

# find and set branch name var if in git repository
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ''$branch''
  fi
}

# history
HISTSIZE=10000
SAVEHIST=10000

# ls colors
export CLICOLOR=1
export LSCOLORS="GxExCxDxBxagacad"
alias ls='COLUMNS=60 ls -C -G'

# substitution
setopt prompt_subst

# prompt
prompt=$'%F{254}%B%F{254}%~ › %F{254}$(git_branch_name) \n%F{254}→%b%f '

# sources
source ~/.fzf-tab/fzf-tab.plugin.zsh
# syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alliases
#==============#
alias vim='nvim'
alias finder='open -a Finder ""'
alias win='~/.scripts/.windows.sh'
alias wol='~/.scripts/.wol.sh'
alias gl='git log --all --oneline --graph'
alias vimconf='nvim $NVIM_CONFIG'

# ntfy
alias ntfy="~/.scripts/.ntfy.sh"
#==============#

# tokens
alias gitlab-token='cat ~/.git-tokens/gitlab | pbcopy'
alias github-token='cat ~/.git-tokens/github | pbcopy'

# fzf
alias fman='bash -c '\''compgen -c | fzf --height 20 --no-preview | xargs man'\'
alias fd='cd "$(find . -maxdepth 3 -type d -not -name ".Trash" 2>/dev/null | fzf --height 20 --no-preview)"'
alias falias='alias | awk -F= '\''{print $1}'\'' | fzf --height 20 --no-preview | xargs -I{} zsh -ic {}'
alias fvim='code $(fzf)'

# vi-mode
bindkey -v '^?' backward-delete-char
#-------------------#

# env vars, maybe move these to .zshenv eventually
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim;
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always {}' --border --height=100% --preview-window=right:60%"
export FZF_DEFAULT_COMMAND="find . -type f ! -name '.DS_Store'"

# autocomplete
autoload -Uz compinit; compinit
autoload -Uz bashcompinit; bashcompinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`
            awk '/^Host/ && $2 !~ /[*]/ {print $2}' ~/.ssh/config ;
            `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh
export PATH="/Users/barrettjflowers/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/barrettjflowers/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Created by `pipx` on 2025-05-08 23:31:57
export PATH="$PATH:/Users/barrettjflowers/.local/bin"
