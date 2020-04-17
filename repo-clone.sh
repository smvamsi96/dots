#!/bin/bash

# Bash Strict Mode
set -e
set -u
set -o pipefail

########################################################
#				Clone Github Repos					   #
########################################################

# An array of your repositories
repos=(
	"dots"
	"smvamsi96.github.io"
	"lexie"
)

if [ -d "$HOME/Code" ];then
	cd "$HOME/Code"
	echo "A Code directory Already exists"
	echo "Going Full Speed Ahead!"
else
	echo "Creating a Code directory in $HOME"
	mkdir "$HOME/Code"
	cd "$HOME/Code"
fi

# Internal Field Separator(ask google if you don't know what it is!)
IFS=$'\n\t'

# Clone all the repos in one sweep!
for repo in ${repos[@]}; do git clone https://github.com/smvamsi96/${repo}.git && echo "\n"; done
