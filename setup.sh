#! /bin/bash
rm -rf ~/.vimrc
rm -rf ~/.vim/
cp ./_vimrc ~/.vimrc
mkdir ~/.vim/
cp -p -R ./vimfiles/** ~/.vim/
