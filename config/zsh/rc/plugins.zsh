#------------------------------------------------------------------------------#
# Plugins                                                                      #
#------------------------------------------------------------------------------#
### Added by Zi's installer {{{
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
zicompinit


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
#zinit light-mode for \
#    z-shell/z-a-rust \
#    z-shell/z-a-as-monitor \
#    z-shell/z-a-patch-dl \
#    z-shell/z-a-bin-gem-node

### }}} End of Zinit's installer chunk


# Load starship theme
# starship
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
export STARSHIP_CACHE=$XDG_CACHE_HOME/starship
zi ice lucid \
  from"gh-r" \
  as"command" \
  bpick"*.tar.gz" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" \
  src"init.zsh"
zi light starship/starship


# fzf
zi snippet https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh
zi snippet https://github.com/junegunn/fzf/blob/master/shell/completion.zsh
zi ice \
  as"program" \
  from"gh-r"
zi light junegunn/fzf-bin

# aws
zi snippet https://github.com/aws/aws-cli/blob/master/bin/aws_zsh_completer.sh

# github
zi wait'1' lucid \
  from"gh-r" \
  as"program" \
  pick"ghq*/ghq" \
  light-mode for @x-motemen/ghq

zi wait'1' lucid \
  from"gh-r" \
  as"program" \
  pick'**/gh' \
  atclone"./**/gh completion -s zsh > $ZI_HOME/completions/_gh" \
  light-mode for @cli/cli

# syntax highlight
zi light zsh-users/zsh-syntax-highlighting

# direnv
zi wait'!1' lucid \
  from"gh-r" \
  as"program" \
  mv"direnv* -> direnv" \
  pick"direnv" \
  atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' \
  src'zhook.zsh' \
  light-mode for @direnv/direnv

zi wait'1' lucid \
  atinit"export \
    ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/config \
    ASDF_DATA_DIR=$XDG_DATA_HOME/asdf \
    ASDF_DIR=$ZI_HOME/plugins/asdf-vm---asdf" \
  pick"asdf.sh" \
  light-mode for @asdf-vm/asdf

# delta
zi wait'1' lucid \
  from"gh-r" \
  as"program" \
  pick"delta*/delta" \
  light-mode for @dandavison/delta

# exa
zi wait'1' lucid \
  from"gh-r" \
  as"program" \
  pick"**/exa" \
  light-mode for @ogham/exa

# ripgrep
zi wait'1' lucid blockf nocompletions \
  from"gh-r" \
  as'program' \
  pick'ripgrep*/rg' \
  atclone'chown -R $(id -nu):$(id -ng) .; zi creinstall -q BurntSushi/ripgrep' \
  atpull'%atclone' \
  light-mode for @BurntSushi/ripgrep

# fd
zi wait'1' lucid blockf nocompletions \
  from"gh-r" \
  as'program' \
  cp"fd-*/autocomplete/_fd -> _fd" \
  pick'fd*/fd' \
  atclone'chown -R $(id -nu):$(id -ng) .; zi creinstall -q sharkdp/fd' \
  atpull'%atclone' \
  light-mode for @sharkdp/fd

# bat
zi wait'1' lucid \
  from"gh-r" \
  as"program" \
  cp"bat/autocomplete/bat.zsh -> _bat" \
  pick"bat*/bat" \
  atload"export BAT_THEME='gruvbox-dark'; alias cat=bat" \
  light-mode for @sharkdp/bat

# jq
zi wait'1' lucid \
  from"gh-r" \
  as"program" \
  mv"jq* -> jq" \
  pick"**/jq" \
  light-mode for @stedolan/jq

# wakatime zi load 'wbingli/zsh-wakatime'

# completion
zi wait lucid blockf \
  atload"zicompinit; zicdreplay" \
  for zsh-users/zsh-completions

# httpstat
zi ice as:"program" cp:"httpstat.sh -> httpstat" pick:"httpstat"
zi light b4b4r07/httpstat
