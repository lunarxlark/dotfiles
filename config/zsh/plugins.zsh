### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.data/}/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$ZINIT_HOME" && command chmod g-rwX "$ZINIT_HOME"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$ZINIT_HOME/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Load starship theme
# starship
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
export STARSHIP_CACHE=$XDG_CACHE_HOME/starship
zinit ice lucid \
  from"gh-r" \
  as"command" \
  bpick"*.tar.gz" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" \
  src"init.zsh"
zinit light starship/starship


### binary
# fzf
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/completion.zsh
zinit wait"0" lucid \
  from"gh-r" \
  as"program" \
  pick"fzf-*/fzf -> fzf" \
  light-mode for @junegunn/fzf


# zoxide
zinit wait"0" lucid \
  from"gh-r" \
  as"program" \
  pick"zoxide-*/zoxide -> zoxide" \
  cp"zoxide-*/completions/_zoxide -> _zoxide" \
  atclone"./zoxide init zsh > init.zsh" \
  atpull"%atclone" src"init.zsh" \
  light-mode for @ajeetdsouza/zoxide


# jq
zinit wait'1' lucid \
  from"gh-r" \
  as"program" \
  mv"jq* -> jq" \
  pick"**/jq" \
  light-mode for @stedolan/jq


# fd
zinit wait'0' lucid blockf nocompletions \
  from"gh-r" \
  as'program' \
  cp"fd-*/autocomplete/_fd -> _fd" \
  pick'fd*/fd' \
  atclone'chown -R $(id -nu):$(id -ng) .; zinit creinstall -q sharkdp/fd' \
  atpull'%atclone' \
  light-mode for @sharkdp/fd


# exa
zinit wait'0' lucid \
  from"gh-r" \
  as"program" \
  pick"**/exa" \
  atload"alias l='exa -la --icons --time-style long-iso'" \
  light-mode for @ogham/exa


# ripgrep
zinit wait'1' lucid blockf nocompletions \
  from"gh-r" \
  as'program' \
  pick'ripgrep*/rg' \
  atclone'chown -R $(id -nu):$(id -ng) .; zinit creinstall -q BurntSushi/ripgrep' \
  atpull'%atclone' \
  light-mode for @BurntSushi/ripgrep


# bat
zinit wait'1' lucid \
  from"gh-r" \
  as"program" \
  cp"bat/autocomplete/bat.zsh -> _bat" \
  pick"bat*/bat" \
  atload"export BAT_THEME='gruvbox-dark'; alias cat=bat" \
  light-mode for @sharkdp/bat


# direnv
zinit wait'0' lucid \
  from"gh-r" \
  as"program" \
  mv"direnv* -> direnv" \
  pick"direnv" \
  atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' \
  src'zhook.zsh' \
  light-mode for @direnv/direnv


# ghq
zinit wait'0' lucid \
  from"gh-r" \
  as"program" \
  pick"ghq*/ghq" \
  light-mode for @x-motemen/ghq


# asdf
zinit wait'1' lucid \
  atinit"export \
    ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/config \
    ASDF_DATA_DIR=$XDG_DATA_HOME/asdf \
    ASDF_DIR=$ZINIT[PLUGINS_DIR]/asdf-vm---asdf" \
  pick"asdf.sh" \
  light-mode for @asdf-vm/asdf


# github
zinit wait'1' lucid \
  from"gh-r" \
  as"program" \
  pick'gh_**/bin/gh' \
  atclone"./**/gh completion -s zsh > $ZINIT[COMPLETIONS_DIR]/_gh" \
  light-mode for @cli/cli


# delta
zinit wait'1' lucid \
  from"gh-r" \
  as"program" \
  pick"delta*/delta" \
  light-mode for @dandavison/delta


### completion
zinit wait lucid blockf light-mode for \
    @'zsh-users/zsh-autosuggestions' \
    @'zsh-users/zsh-completions' \
    @'zdharma-continuum/fast-syntax-highlighting'


# zinit wait lucid is-snippet as"completion" for \
#   atload"autoload bashcompinit; bashcompinit; complete -C '$(which aws_completer)' aws" \
#     https://github.com/aws/aws-cli/blob/v2/bin/aws_zsh_completer.sh

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C $(which aws_completer) aws
