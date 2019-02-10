alias df="df -h"
alias du="du -h"

# Let's try Podman
alias docker="podman"

# peep is nice
alias more="peep"
alias less="peep"

# Directory and listing                 
alias ls="ls -ahF --color=always"
alias ll="ls -l --color=always"
alias la="ls -A"
alias l="ls -CF"
alias ..="cd .."
alias ...="cd ../.."

alias clip='xclip -selection clip'

# SSH 
alias ssh-add="ssh-add -t 1h"

# Edit commom files

alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias sshadddef="ssh-add ~/.ssh/id_rsa"

# # # K8s # # #
if [ -z "$(command -v kubectl)" ]; then
    alias kswitch='kubectl config use-context'
    alias knamespace='kubectl config set-context `kubectl config current-context` --namespace'
    alias ksvc="kubectl get --all-namespaces svc -o json | jq -r '.items[] | [.metadata.name,([.spec.ports[].nodePort | tostring ] | join(\"|\"))] | @csv'"
    alias kpods="kubectl get po"
    alias kinspect="kubectl describe"
fi

# Alert utility
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

