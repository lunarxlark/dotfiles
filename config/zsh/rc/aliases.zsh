#------------------------------------------------------------------------------#
# Aliases                                                                      #
#------------------------------------------------------------------------------#
alias v='vi'
alias vi='vi'
alias n='nvim'

alias E='exec $SHELL -l'
alias t='tmux'
alias cp='cp -i'
alias mv='mv -i'
alias l='exa -a'
alias ll='exa -la'
alias ..='cd .. && ll'
alias ...='cd ../../ && ll'
alias gs='git status'
alias gp='git pull origin'
alias ga='git add'
alias gc='git commit'
alias gf='git fetch'
alias gp='git pull origin'
alias gch='git checkout'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gsd='git stash drop'
alias gl='git log --oneline'
alias gd='git diff'
alias gdc='git diff --cached'
alias tf='terraform'
alias ghils='gh issue list | fzf --preview "gh issue view {+1}" | awk '{print $1}' | xargs gh issue view --web'
alias ghpls='gh pr list | fzf --preview "gh pr diff --color=always {+1}"'
alias gmaster='gh pr create -B master -H develop -d -t "[$(date "+%Y-%m-%d %H:%M")] merge develop to master"'
alias ghprc="gh pr create"
alias ghprv="gh pr view --web"
alias dc="docker-compose"
alias dps="docker ps"
alias ghv="gh pr view --web"
alias mux="tmuxinator"
