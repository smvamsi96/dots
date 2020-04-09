#!/bin/bash

if [ -d "${HOME}/code" ];then
	echo "A code directory already exists in you ${HOME} directory\nGoing Full Speed Ahead!\n"
	./repo-clone.sh
else
	mkdir ${HOME}/code
	cd ${HOME}/code
	./repo-clone.sh
fi

if [ $? -eq 1 ];then
	echo "Something wrong with the ${HOME}/code directory"
	break;
fi

# is it linux?
linux=0	# not linux by default

# read linux variable.
read -p "Enter 1 if it's linux or Just press enter if it's mac: " linux

if [ $linux -ne "1" ]; then
	echo "Treating the System as Mac os\n"
else
	echo "Treating the System as Linux\n"
	cd "${HOME}/code/dots/"
	git checkout linux
fi

cd $HOME
rm .zshrc
for file in ${HOME}/code/dots/.*; do ln -sv ${file}; done

cd ${HOME}
rm .gitconfig .gitignore 
rm -rf .git
source .zshrc

echo "----------------------------------------\nYou're Good to Go\n----------------------------------------\n"
