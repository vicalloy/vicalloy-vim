#! /bin/bash
#rm -rf ~/.vimrc
#rm -rf ~/.vim/
sudo apt-get install ttf-dejavu
sudo pip install pyflakes
sudo pip install jedi
cp ./_vimrc ~/.vimrc
mkdir ~/.vim/
cp -p -R ./vimfiles/** ~/.vim/
