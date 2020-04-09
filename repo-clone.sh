#!/bin/bash

########################################################
#				Clone Github Repos					   #
########################################################

# An array of your repositories
repos=(dots smvamsi96.github.io lexie)

if [ -d "$HOME/Code" ];then
	cd "$HOME/Code"
	echo "A Code directory Already exists\nGoing Full Speed Ahead!\n"
else
	echo "Creating a Code directory in $HOME\n"
	mkdir "$HOME/Code"
	cd "$HOME/Code"
fi

# Clone all the repos in a sweep!

for repo in $repos; do git clone https://github.com/smvamsi96/${repo}.git && echo "\n"; done
