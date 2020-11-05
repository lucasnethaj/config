#!/bin/sh
file=$(git --git-dir=$HOME/.cfg/ --work-tree=$HOME ls-files | fzf)
nvim $file
