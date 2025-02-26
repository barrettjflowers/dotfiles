# ~/.zshrc

# Find and set branch name var if in git repository.
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

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
# prompt='%2/ $(git_branch_name) > '

#PROMPT
prompt=$'%F{172}%B%n %F{253}%~ › %F{108}$(git_branch_name)%f ↓\n%F{172}→%b%f '

#SOURCES
source ~/.fzf-tab/fzf-tab.plugin.zsh

#ALIASES
#-------------------#
alias vim='code'
alias finder='open -a Finder ""'
alias netrw='vim .'
alias win='~/.windows.sh'

#tokens
alias gitlab-token='cat ~/.git-tokens/gitlab | pbcopy'
alias github-token='cat ~/.git-tokens/github | pbcopy'

#fzf
alias fman='bash -c '\''compgen -c | fzf --height 20 --no-preview | xargs man'\'
alias fd='cd "$(find . -maxdepth 3 -type d -not -name ".Trash" 2>/dev/null | fzf --height 20 --no-preview)"'
alias falias='alias | awk -F= '\''{print $1}'\'' | fzf --height 20 --no-preview | xargs -I{} zsh -ic {}'
alias fvim='code $(fzf)'

#ntfy
alias ntfy="~/.ntfy.sh"

#vi-mode
bindkey -v '^?' backward-delete-char
#-------------------#

#ENV VARIABLES
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=code;
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always {}' --border --height=100% --preview-window=right:60%"
export FZF_DEFAULT_COMMAND="find . -type f ! -name '.DS_Store'"

#AUTOCOMPLETE
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

