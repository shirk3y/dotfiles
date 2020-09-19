#!/bin/sh

[ "$USER" == "shirk3y" ] || { echo "not a shirk3y"; }

git config --global user.email shirk3y@gmail.com
git config --global user.name shirk3y
git config --global alias.co checkout 
git config --global alias.br branch 
git config --global alias.ci commit 
git config --global alias.st status 
git config --global alias.last 'log -1 HEAD' 

