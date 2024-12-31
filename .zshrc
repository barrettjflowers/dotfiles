#PROMPT
PROMPT=$'%F{172}%B%n %F{253}%~ >\n%F{172}$%b%f '

#ALIAS
alias finder='open -a Finder ""'

#-------------------#
#fzf
alias fman='bash -c '\''compgen -c | fzf | xargs man'\'
alias fd='cd $(find . -maxdepth 2 -type d -not -name '.Trash' 2>/dev/null | fzf)'

#ntfy
alias ntfy="~/.ntfy.sh"

#vi-mode
bindkey -v '^?' backward-delete-char

#paths
export PATH="$HOME/.cargo/bin:$PATH"
#-------------------#

#AUTOCOMPLETE
autoload -Uz compinit; compinit
autoload -Uz bashcompinit; bashcompinit

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

