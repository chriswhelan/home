#!/bin/sh

cd ~/.home
librarian-puppet install
sudo puppet apply --modulepath=modules init.pp
