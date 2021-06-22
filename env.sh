export LANG=ja_JP.UTF-8
export TERM=screen-256color
export EDITOR='vim'

export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.data
export XDG_CACHE_HOME=~/.cache

# go
export GO111MODULE=on
#export GOPROXY=https://proxy.golang.org
export GOPATH=$HOME/dev
export GOBIN=$GOPATH/bin
export GOENV=$GOPATH/env
export GOCACHE=$GOPATH/go-build
export PATH=$GOBIN:$PATH
# GOROOTはgolang.org/dlで設定されたデフォルト値を変えられない
# そのため、defaultのまま。
#export GOROOT=$HOME/dev

# ghq
export GHQ_ROOT=$GOPATH/src

# anyenv
export ANYENV_ROOT=~/dev/src/github.com/anyenv/anyenv
export PATH=$ANYENV_ROOT/bin:$PATH
eval "$(anyenv init -)"

# rustup
. "$HOME/.cargo/env"

export PATH=~/.local/bin:$PATH
export PATH=~/.local/go/bin:$PATH
export PATH=~/Library/Python/3.7/bin:$PATH
