#!/bin/sh

here=$(dirname $0)

[ "$USER" == "root" ] || { echo "not a root"; exit 1; }

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

usermod -s /bin/bash shirk3y

echo "shirk3y ALL=(ALL:ALL) ALL" > /etc/sudoers.d/shirk3y
chmod 0440 /etc/sudoers.d/shirk3y

su -c "$here/setup-user.sh" shirk3y
