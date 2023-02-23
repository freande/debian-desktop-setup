#!/bin/bash

CUR_DIR="$(dirname "$0")"

## Problem... again..
mkdir -p ~/.config
cp -r $CUR_DIR/files/.config/. ~/.config/
cp -r $CUR_DIR/files/.zshrc ~/.zshrc
