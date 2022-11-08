#!/bin/bash
wid=$1
title=$(xtitle "$wid")
echo $wid
echo $title

[[ "$title" == 'Android Emulator -'* ]] \
    && echo state=floating
