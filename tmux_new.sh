#!/bin/sh

path_name="$(basename "$PWD" | tr . -)"
SESSION_NAME=${1-$path_name}

if [ -n "$1" ]; then
  SESSION_NAME=$1
fi

echo "starting tmux session with $SESSION_NAME"
if ! tmux has-session -t $SESSION_NAME; then
  tmux \
    new -s $SESSION_NAME -n vim \; \
    send-keys "vim" C-m \; \
    splitw -v -p 30 -t 1 \; \
  detach
fi
if [ "$TERM_PROGRAM" = "iTerm.app" ] ; then
  # iTerm2 is way nicer, but lacks support for named sessions.
  tmux -CC attach
else
  tmux att -t $SESSION_NAME 
fi
