#!/bin/bash

# These are user settings, not root settings.  Though you can modify them as root, you should not.  We will
# cover a different way to do this later in class, using symlinks.  This is convenient because then when you
# change your user-specific aliases / colors etc, the root aliases / colors etc will change automatically.
if [[ $(id -u) -eq 0 ]]; then
    echo "You are executing this script as root, and will not get the changes you expect."
    echo "Please execute this script as the regular user..."
    echo "...goodbye."
    exit 0
fi

# Backup and replace the bash_profile
if [[ -f ~/.bash_profile ]]; then
    mv ~/.bash_profile ~/.bash_profile_ORIGINAL_BACKUP
fi
cp ./bash_addons/bash_profile ~/.bash_profile

# Backup and replace the bashrc
if [[ -f ~/.bashrc ]]; then
    mv ~/.bashrc ~/.bashrc_ORIGINAL_BACKUP
fi
cp ./bash_addons/bashrc ~/.bashrc

# Backup and replace the vimrc
if [[ -f ~/.vimrc ]]; then
    mv ~/.vimrc ~/.vimrc_ORIGINAL_BACKUP
fi
cp ./vim_addons/vimrc ~/.vimrc

# Add the colors for the vimrc
# mkdir -p will create the folder if it doesn't exist, and leave it if it does without failing the mkdir command
mkdir -p ~/.vim/
mkdir -p ~/.vim/colors
if [[ -f ~/.vim/colors/monokai.vim ]]; then
    echo "You seem to already have the vim monokai theme..."
    echo "...leaving it as is."
else
    cp ./vim_addons/colors/monokai.vim ~/.vim/colors/
fi

# Last, link the bash_profile

PROF_STRING="# Used to properly link the bash_profile, not to be done by the bashrc. See
#
#     http://askubuntu.com/a/121075/418575
#
# for more information.
if [[ -f ~/.bash_profile ]]; then
    . ~/.bash_profile
fi
"
echo "$PROF_STRING" >> ~/.profile
