#!/bin/bash

# download dots-setup.sh and repo-clone.sh
curl -sSL https://github.com/smvamsi96/dots/blob/master/dots-setup.sh -o ${HOME}/code/dots-setup.sh
curl -sSL https://github.com/smvamsi96/dots/raw/master/repo-clone.sh -o ${HOME}/code/repo-clone.sh

# make the setup files executable
chmod +x "${HOME}/code/dots-setup.sh"
chmod +x "${HOME}/code/repo-clone.sh"

# execute dots-setup.sh
cd ${HOME}/code
${HOME}/code/dots-setup.sh

# install commacd
curl -sSL https://github.com/shyiko/commacd/raw/v1.0.0/commacd.sh -o ${HOME}/code/dots/.commacd.sh && echo "source ${HOME}/.commacd.sh" >> ~/.source_list

# install tldr - community driven man pages
mkdir -p ~/bin
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
xe ~/bin/tldr

# install bat
bwi bat

# install exa
bwi exa
