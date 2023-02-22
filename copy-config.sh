#!/bin/bash

CUR_DIR="$(dirname "$0")"

cp -r $CUR_DIR/files/.config/* ~/.config/
cp -r $CUR_DIR/files/.zshrc ~/.zshrc
