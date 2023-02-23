#!/bin/bash

CUR_DIR="$(dirname "$0")"

## Problem... again..
mkdir -p $HOME/.config
cp -r $CUR_DIR/files/.config/. $HOME/dotconfig/
cp -r $CUR_DIR/files/.zshrc $HOME/.zshrc
