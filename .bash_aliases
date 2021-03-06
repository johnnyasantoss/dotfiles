alias df="df -h"
alias du="du -h"

# Let's try Podman
alias docker="podman"

# More is less and the cake is a lie
alias more="less"

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

alias kswitch='kubectl config use-context'
alias knamespace='kubectl config set-context `kubectl config current-context` --namespace'
alias ksvc="kubectl get --all-namespaces svc -o json | jq -r '.items[] | [.metadata.name,([.spec.ports[].nodePort | tostring ] | join(\"|\"))] | @csv'"
alias kpods="kubectl get po"
alias kinspect="kubectl describe"

