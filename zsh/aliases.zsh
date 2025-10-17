# Docker Shortcuts
alias dtail="docker logs -f --tail 100"
alias dclean="docker rmi -f \$(docker images | grep '<none>' | awk '{ print \$3; }')"
alias dcleanc="docker rm -f \$(docker ps -a | grep Exited | awk '{ print \$1; }')"
alias ds='while true; do TEXT=$(docker stats --no-stream $(docker ps --format={{.Names}})); sleep 0.1; clear; echo "$TEXT"; done'
alias dtrunc="sudo sh -c \"truncate -s 0 /var/lib/docker/containers/*/*-json.log\""
alias dcleana="docker rmi -f \$(docker images | awk '{ print \$3; }')"
alias buildx="docker buildx build -f Dockerfile --builder=intel --platform=linux/amd64 --tag=docker.demand.io/simplycodes-api:latest --push ."
alias dcleanx="docker buildx prune --all"

# Kubernetes Shortcuts
alias kclean="kubectl delete pod \$(kubectl get pods | grep -E 'Error|OutOfcpu|Completed' | awk '{ print \$1; }')"
alias kcleanj="kubectl delete job \$(kubectl get jobs | awk '{ print \$1; }')"
alias kpods='kubectl get pods'
alias kshell='kubectl exec -it $1 bash'
alias kdesc='kubectl describe pods'
alias kdel='kubectl delete pod'
alias klogs='kubectl logs'
alias ktail='kubectl logs --tail 100 -f'
alias ksvc='kubectl get service'
alias ksvcdesc='kubectl describe service'
alias kcrons='kubectl get cronjobs'
alias kdeps='kubectl get deployments'
alias kfail='kpods | egrep -v "Running|Completed"'
alias krestart="kpods | awk '\$4>0'"
alias khpa='kubectl describe hpa'

# GRPC forwards
alias mgrpc="kubectl port-forward service/merchant-api 5051:5050"
alias pgrpc="kubectl port-forward service/merchant-api 5052:5050"

# Git shortcuts
alias ghprune="git remote prune origin"

# Xcode (Erase iOS Simulator Data)
alias erasesims="xcrun simctl erase all"

# Vim = neovim (Using LazyVim as a starter)
alias vi="nvim"
alias vim="nvim"
alias lazyvimupd='nvim --headless "+Lazy! sync" +qa'

# Serial connections
# To exit picocom: Ctrl-C + a, Ctrl-C + q
alias serial="picocom -b 115200 /dev/tty.usbserial-AB0P0N22"
# alias serial="sudo cu -l /dev/tty.usbserial-AB0P0N22 -s 115200"

# System monitoring
alias top="btop"
alias htop="btop"
