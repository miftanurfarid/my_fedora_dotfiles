#!/bin/bash

HOME_FONT="$HOME/.fonts"
MOST_DISTROS="/usr/share/fonts"
RHL5="/usr/X11R6/lib/X11/fonts"
RHL6="/usr/X11R6/lib/X11/fonts"

if test -e $MOST_DISTROS ; then
  FONT_PATH=$MOST_DISTROS
elif test -e $RHL5 ; then
  FONT_PATH=$RHL5
elif test -e $RHL6 ; then
  FONT_PATH=$RHL6
else
  FONT_PATH=$HOME_FONT
fi

FONT_PATH=$FONT_PATH"/wps-fonts"

[ ! -d "$FONT_PATH" ] && mkdir -p "$FONT_PATH"

cp -f *.ttf $FONT_PATH
cp -f *.TTF $FONT_PATH
chmod 644 $FONT_PATH/*
fc-cache -vfs