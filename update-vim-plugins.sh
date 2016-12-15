#!/bin/bash

cd ~/.vim/bundle
for i in `ls`; do
  echo "$i"
  cd "$i"
  git pull
  cd ..
done
