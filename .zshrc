#Prompt

PROMPT=$'%F{222}%B%n %F{253}%~ >\n%F{222}$%b%f '

#Aliases

alias cfzf='code $(fzf)'
alias dotfzf='find . -not -path "./.library/*" 2>/dev/null | fzf'
alias fman='bash -c '\''compgen -c | fzf | xargs man'\'
alias ntfy='curl ntfy.barrettjflowers.net/homelab -d '\''Default Notification.'\'
alias vfzf='vim $(fzf)'

#vi mode
bindkey -v '^?' backward-delete-char
