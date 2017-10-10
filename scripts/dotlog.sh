#!/bin/sh

LOGFILE=~/.dotfiles.log

LOGPREFIX="> "
LOGPREFIX+=$(date)
LOGPREFIX+="\nLOG: ["

LOGSUFFIX="]\n\n"

if [ -z "$1" ]; then
  exit 1
fi

if [ "$1" = "clean" ]; then
  rm ~/.dotfiles.log
  exit 0
fi

echo -ne $LOGPREFIX $1 $LOGSUFFIX >> $LOGFILE
