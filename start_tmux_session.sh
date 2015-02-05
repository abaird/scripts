#!/bin/sh
WS=projects

if ! tmux has-session -t sfl; then
  tmux \
    new -s sfl -n browse \; \
    send-keys "ssh lsdev.co" C-m \; \
    send-keys "cd $WS/deals" C-m \; \
    send-keys "BROWSE_SERVICE_LOCAL=true bundle exec foreman start" C-m \; \
    neww -n stepford \; \
    send-keys "ssh lsdev.co" C-m \; \
    send-keys "cd ~/projects/stepford" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach 
fi
if [ "$TERM_PROGRAM" = "iTerm.app" ] ; then
  # iTerm2 is way nicer, but lacks support for named sessions.
  tmux -CC attach
else
  tmux att -t sfl 
fi
