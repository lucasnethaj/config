#!/bin/sh
git --git-dir=$HOME/.cfg/ --work-tree=$HOME ls-files | fzf | xargs -r $EDITOR
