#------------------------------------------------------------------------------#
# Environment variable                                                         #
#------------------------------------------------------------------------------#
export LANG=ja_JP.UTF-8
if builtin command -v nvim > /dev/null 2>&1; then
  export EDITOR=${EDITOR:-nvim}
else
  export EDITOR=${EDITOR:-vim}
fi

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.data}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# zsh & zinit
export ZDOTDIR=$HOME
export ZHOMEDIR=$ZDOTDIR/.config/zsh
export ZRCDIR=$ZHOMEDIR/rc
export ZDATADIR=$XDG_DATA_HOME/zsh

# go
export GO111MODULE=on
export GOPATH=$HOME/dev
export GOBIN=$GOPATH/bin
export GOENV=$GOPATH/env
export GOCACHE=$GOPATH/go-build
# GOROOTはgolang.org/dlで設定されたデフォルト値を変えられない
# そのため、defaultのまま。
#export GOROOT=$HOME/dev

# ghq
export GHQ_ROOT=$GOPATH/src

# rustup
. "$HOME/.cargo/env"

export PATH=~/Library/Python/3.7/bin:$PATH

path=(
  $HOME/.local/bin
  $HOME/.local/go/bin
  $GOBIN
  $path
  )

# }}}
