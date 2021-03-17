#!/bin/sh
# ls `git rev-parse --show-toplevel` | fzf | xargs -r $EDITOR
git --git-dir=$HOME/.cfg/ --work-tree=$HOME ls-files | fzf | xargs -r $EDITOR
