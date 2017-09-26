#!/bin/bash
find ~/.vim/bundle -mindepth 1 -maxdepth 1 -type d -exec sh -c 'cd {}; git pull' \;
