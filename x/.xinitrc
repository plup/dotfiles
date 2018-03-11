#!/bin/bash
[ -f ~/.Xresources ] && xrdb ~/.Xresources
exec i3
