#!/bin/bash

if pgrep -x "hyprsunset" > /dev/null
then
    pkill hyprsunset
else
    hyprsunset -t 2500 &
fi

