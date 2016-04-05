#!/bin/sh
WS=~/projects

if ! tmux has-session -t sfl; then
  tmux \
    new -s sfl -n browse \; \
    send-keys "cd $WS/browse" C-m \; \
    send-keys "ENVAR=value foreman start" C-m \; \
  detach
fi
if [ "$TERM_PROGRAM" = "iTerm.app" ] ; then
  # iTerm2 is way nicer, but lacks support for named sessions.
  tmux -CC attach
else
  tmux att -t sfl 
fi
