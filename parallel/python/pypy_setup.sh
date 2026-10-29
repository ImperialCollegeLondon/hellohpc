#!/bin/bash


ml virtualenv
mkdir -p ~/venv
virtualenv ~/venv/pypyenv
cd ~/venv/pypyenv
wget https://downloads.python.org/pypy/pypy3.10-v7.3.17-linux64.tar.bz2
tar xvf pypy3.10-v7.3.17-linux64.tar.bz2 
cd ~/venv/pypyenv/bin
ln -s  ~/venv/pypyenv/pypy3.10-v7.3.17-linux64/bin/pypy pypy

