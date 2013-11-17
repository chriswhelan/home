#!/bin/sh

cd ~/.home
librarian-puppet install
sudo puppet apply --modulepath=modules init.pp
puppet apply --modulepath=modules home.pp
