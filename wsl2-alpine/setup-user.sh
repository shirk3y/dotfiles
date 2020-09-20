#!/bin/bash

set -e

git config --global user.email shirk3y@gmail.com
git config --global user.name shirk3y
git config --global alias.co checkout 
git config --global alias.br branch 
git config --global alias.ci commit 
git config --global alias.st status 
git config --global alias.last 'log -1 HEAD' 

bashrc="$HOME/.bashrc"
bashrcd="$HOME/.bashrc.d"
mkdir -p "$bashrcd"
touch "$bashrc"

if ! grep -q "DOTFILES" "$bashrc"; then
cat <<-EOT >> "$bashrc"
# DOTFILES

for file in $bashrcd/*.sh;
do
  source "\$file"
done
EOT
else
  echo "Not updating $bashrc."
fi


echo 'eval "$(starship init bash)"' > "$bashrcd/starship.sh"
