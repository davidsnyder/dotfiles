#!/bin/bash

export PS1='\u@\h: \W\$ '

alias ls='ls -G'

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;31'

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
