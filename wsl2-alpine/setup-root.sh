#!/bin/sh

here=$(dirname $0)
user="$1"

# Essential packages
apk update
apk add \
	curl \
	bash \
	less \
	nodejs \
	npm \
	sudo \
	vim \
	git \
	openssh \
	openssh-keygen
	
npm i -g yarn

# Starship shell
if ! command -v starship; then
	curl -fsSL \
		https://starship.rs/install.sh | ( \
			bash -s -- --verbose --force --bin-dir /usr/bin \
		)
fi

#usermod -s /bin/bash "$user"
sed -i.bak 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd

# Sudo 
echo "$user ALL=(ALL:ALL) ALL" > /etc/sudoers.d/$user.sh
chmod 0440 /etc/sudoers.d/$user.sh
