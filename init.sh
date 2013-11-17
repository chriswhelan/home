#!/bin/sh

cd ~/.home
librarian-puppet install
sudo puppet apply --modulepath=modules --verbose init.pp
puppet apply --modulepath=modules --verbose home.pp
sudo usermod `whoami` -s /usr/bin/zsh
