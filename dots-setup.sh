#!/bin/bash

if [ -d "${HOME}/Code" ];then
	echo "A ${HOME}/Code directory already exists!\nGoing Full Speed Ahead!\n"
else
	mkdir ${HOME}/Code
	cd ${HOME}/Code
fi

./repo-clone.sh

if [ $? -eq 1 ];then
	echo "Something wrong with the ${HOME}/Code directory"
	break;
fi

# is it linux?
# linux=0	# not linux by default

# read linux variable.
# read -p "Enter 1 if it's linux or Just press enter if it's mac: " linux

if [ $(uname) = Darwin ]; then			# using uname is better than reading user's input
	echo "Treating the System as Mac os\n"
else
	echo "Treating the System as Linux\n"
	cd "${HOME}/Code/dots/"
fi

cd $HOME && for file in ${HOME}/Code/dots/.*; do ln -sv ${file}; done


echo "Removing .gitconfig and .gitignore"
rm ${HOME}/.gitconfig ${HOME}/.gitignore 
echo "Removing .git/"
rm -rf ${HOME}/.git
echo "Sourcing .zshrc"
source ${HOME}/.zshrc

echo "----------------------------------------You're Good to Go----------------------------------------"
