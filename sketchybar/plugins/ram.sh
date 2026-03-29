#!/usr/bin/env bash

RAM=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100 - int($5)}')
sketchybar --set $NAME label="${RAM}%"
