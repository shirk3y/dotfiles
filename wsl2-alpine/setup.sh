#!/bin/sh

here=$(dirname $0)
user=${1:-$USER}

su -c "$here/setup-root.sh $user"
su -c "$here/setup-user.sh" $user 
