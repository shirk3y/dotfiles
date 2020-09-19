#!/bin/sh

here=$(dirname $0)

[ "$USER" == "root" ] || { echo "not a root"; exit 1; }

apk update
apk add bash nodejs npm sudo vim git openssh openssh-keygen

sed -i.bak 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd

diff -U 0 /etc/passwd.bak /etc/passwd

echo "shirk3y ALL=(ALL:ALL) ALL" > /etc/sudoers.d/shirk3y
chmod 0440 /etc/sudoers.d/shirk3y

su -c "$here/setup-user.sh" shirk3y
