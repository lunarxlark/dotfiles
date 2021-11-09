#------------------------------------------------------------------------------#
# Plugins                                                                      #
#------------------------------------------------------------------------------#
### Added by Zinit's installer {{{
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}Z-shell%F{220} Initiative Plugin Manager (%F{33}z-shell/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/z-shell/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    z-shell/z-a-rust \
    z-shell/z-a-as-monitor \
    z-shell/z-a-patch-dl \
    z-shell/z-a-bin-gem-node

### }}} End of Zinit's installer chunk


# Load starship theme
# starship
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
export STARSHIP_CACHE=$XDG_CACHE_HOME/starship
zinit ice lucid \
  from"gh-r" \
  as"command" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" \
  src"init.zsh"
zinit light starship/starship

# fzf
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/completion.zsh
zinit ice \
  as"program" \
  from"gh-r"
zinit light junegunn/fzf-bin

# github
zinit wait'1' lucid \
  from"gh-r" \
  as"program" \
  pick"ghq*/ghq" \
  light-mode for @x-motemen/ghq

zinit wait'1' lucid \
  from"gh-r" \
  as'program' \
  pick'**/gh' \
  light-mode for @cli/cli

# syntax highlight
zinit light zsh-users/zsh-syntax-highlighting

# direnv
zinit wait'!1' lucid \
  from"gh-r" \
  as"program" \
  mv"direnv* -> direnv" \
  pick"direnv" \
  atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' \
  src'zhook.zsh' \
  light-mode for @direnv/direnv

zinit wait'1' lucid \
  atinit"export \
    ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/config \
    ASDF_DATA_DIR=$XDG_DATA_HOME/asdf \
    ASDF_DIR=$ZINIT_HOME/plugins/asdf-vm---asdf" \
  pick"asdf.sh" \
  light-mode for @asdf-vm/asdf

# delta
zinit wait'1' lucid \
  from"gh-r" \
  as"program" \
  pick"delta*/delta" \
  light-mode for @dandavison/delta

# exa
zinit wait'1' lucid \
  from"gh-r" \
  as"program" \
  pick"**/exa" \
  light-mode for @ogham/exa

# ripgrep
zinit wait'1' lucid blockf nocompletions \
  from"gh-r" \
  as'program' \
  pick'ripgrep*/rg' \
  atclone'chown -R $(id -nu):$(id -ng) .; zinit creinstall -q BurntSushi/ripgrep' \
  atpull'%atclone' \
  light-mode for @BurntSushi/ripgrep

# fd
zinit wait'1' lucid blockf nocompletions \
  from"gh-r" \
  as'program' \
  cp"fd-*/autocomplete/_fd -> _fd" \
  pick'fd*/fd' \
  atclone'chown -R $(id -nu):$(id -ng) .; zinit creinstall -q sharkdp/fd' \
  atpull'%atclone' \
  light-mode for @sharkdp/fd

# bat
zinit wait'1' lucid \
  from"gh-r" \
  as"program" \
  cp"bat/autocomplete/bat.zsh -> _bat" \
  pick"bat*/bat" \
  atload"export BAT_THEME='gruvbox-dark'; alias cat=bat" \
  light-mode for @sharkdp/bat

# jq
zinit wait'1' lucid \
  from"gh-r" \
  as"program" \
  mv"jq* -> jq" \
  pick"**/jq" \
  light-mode for @stedolan/jq

# wakatime
zinit load 'wbingli/zsh-wakatime'

# completion
zinit wait lucid blockf \
  atload"zicompinit; zicdreplay" \
  for zsh-users/zsh-completions