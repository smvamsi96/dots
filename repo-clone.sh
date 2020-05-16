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
	"smvamsi96.github.io"
	"knives"
)

# Internal Field Separator(ask google, if you don't know what it is!)
IFS=$'\n\t'

# Clone all the repos in one sweep!
for repo in ${repos[@]}; do cd ${HOME}/Code;git clone https://github.com/smvamsi96/${repo}.git && echo "\n"; done
