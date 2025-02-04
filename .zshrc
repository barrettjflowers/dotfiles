#PROMPT
PROMPT=$'%F{172}%B%n %F{253}%~ ↓\n%F{172}$%b%f '

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
alias fman='bash -c '\''compgen -c | fzf | xargs man'\'
alias fd='cd $(find . -maxdepth 3 -type d -not -name '.Trash' 2>/dev/null | fzf)'
alias falias='alias | awk -F= '\''{print $1}'\'' | fzf | xargs -I{} zsh -ic {}'
alias fvim='code $(fzf)'

#ntfy
alias ntfy="~/.ntfy.sh"

#vi-mode
bindkey -v '^?' backward-delete-char
#-------------------#

#ENV VARIABLES
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=code;

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

