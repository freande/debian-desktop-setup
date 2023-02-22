#!/bin/bash

CUR_DIR="$(dirname "$0")"

mkdir -p ~/.config
cp -r $CUR_DIR/files/.config/. ~/.config/
mkdir -p ~/.themes
cp -r $CUR_DIR/files/.themes/. ~/.themes/
cp -r $CUR_DIR/files/.zshrc ~/.zshrc
