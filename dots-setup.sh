#!/bin/bash


if [ -d "${HOME}/Code" ];then
	echo "A ${HOME}/Code directory already exists!\nGoing Full Speed Ahead!\n"
else
	mkdir ${HOME}/Code
fi

# clone some repos you're working on...
/repo-clone.sh

if [ $(uname) = Darwin ]; then			# using uname is better than reading user's input
	echo "Treating the System as Mac os\n"
else
	echo "Treating the System as Linux\n"
	cd "${HOME}/Code/dots/"
fi

for file in ${HOME}/Code/dots/.*; do ln -sv ${file}; done

echo "Removing .gitconfig and .gitignore"
rm ${HOME}/.gitconfig ${HOME}/.gitignore 
echo "Removing .git/"
rm -rf ${HOME}/.git

echo "source .source_list" >> ${HOME}/.zshrc
echo "Sourcing .zshrc"
source ${HOME}/.zshrc

echo "----------------------------------------You're Good to Go----------------------------------------"
