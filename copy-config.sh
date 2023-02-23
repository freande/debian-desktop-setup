#!/bin/bash

CUR_DIR="$(dirname "$0")"

## Problem... again..
mkdir -p $HOME/.config
cp -r $CUR_DIR/files/dotconfig/. $HOME/.config/
cp -r $CUR_DIR/files/.zshrc $HOME/.zshrc
