#!/usr/bin/env bash

case `uname` in
  'Linux')
    mkdir -p $HOME/.local/share/fonts
    cd $HOME/.local/share/fonts
    curl -fLo "Meslo LG M Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf
    ;;
  'Darwin')
    cd ~/Library/Fonts
    curl -fLo "Meslo LG M Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete.ttf
    ;;
  *)
    echo "unsupported OS"
    ;;
esac
