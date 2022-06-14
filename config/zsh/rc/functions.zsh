#------------------------------------------------------------------------------#
# Functions                                                                    #
#------------------------------------------------------------------------------#
ghq-fzf() {
  selected_dir=$(ghq list --vcs git --full-path | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    if [ -t 1 ]; then
      cd "${selected_dir}" && exa -l || return
    fi
  fi
}
zle     -N   ghq-fzf
bindkey '^G' ghq-fzf

d() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
zle     -N   fd
bindkey '^F' fd

f() {
  local files
  IFS=$'\n' files=($(fzf --height=40% --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

dtls() {
  if [[ -z $REGISTRY_URL ]]; then
    REGISTRY_URL="https://registry.hub.docker.com/v1/repositories"
  fi
  curl -s $REGISTRY_URL/"$1"/tags | jq -r ".[].name" | sort | fzf --height=40%
}

dpull() {
 tag="$(dtls $1)"
 docker pull $1:"$tag"
}

drmi() {
  docker images | fzf -m --height=40% --reverse --header-lines=1 | awk '{print $3}' | xargs -I% docker rmi -f %
}

dkill() {
  proc="$(docker ps -a | fzf -m --height=40% --reverse --header-lines=1 | awk '{print $1}')"
  docker kill $proc && docker rm $proc
}

drmf() {
  docker ps -a | fzf -m --height=40% --reverse --header-lines=1 | awk '{print $1}' | xargs -I% docker rm %
}

drm() {
  docker ps -a | fzf -m --height=40% --reverse --header-lines=1 | awk '{print $1}' | xargs -I% docker rm %
}

fgh() {
  git branch -a | fzf -m --height=40% --reverse | xargs -I% git checkout %
}
