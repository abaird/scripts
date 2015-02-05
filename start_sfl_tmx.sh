#!/bin/sh
WS=~/projects

if ! tmux has-session -t sfl; then
  tmux \
    new -s sfl -n browse \; \
    send-keys "cd $WS/browse" C-m \; \
    send-keys "BROWSE_SERVICE_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n stepford \; \
    send-keys "cd $WS/stepford" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n sso-frontend \; \
    send-keys "cd $WS/sso-frontend/" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n accounts \; \
    send-keys "cd $WS/accounts" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n deals-service \; \
    send-keys "cd $WS/deals-service" C-m \; \
    send-keys "STEPFORD_LOCAL=true DEALS_SERVICE_HOST=http://deals-service.lsdev.co bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n deals \; \
    send-keys "cd $WS/deals" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n cupcake \; \
    send-keys "cd $WS/cupcake" C-m \; \
    send-keys "LOCAL_STEPFORD=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n geo \; \
    send-keys "cd $WS/geo" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n city-service \; \
    send-keys "cd $WS/city-service" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n browse-service \; \
    send-keys "cd $WS/browse-service" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n pipeline \; \
    send-keys "cd $WS/pipeline" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n deal_bucks \; \
    send-keys "cd $WS/deal_bucks" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n fakeybiller \; \
    send-keys "cd $WS/fakeybiller" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n payments \; \
    send-keys "cd $WS/payments" C-m \; \
    send-keys "bundle exec foreman start -f Procfile.no_fakeybiller" C-m \; \
  detach
  tmux \
    neww -n travel-service \; \
    send-keys "cd $WS/travel-service" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n escapes \; \
    send-keys "cd $WS/escapes" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n products \; \
    send-keys "cd $WS/products" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n checkout \; \
    send-keys "cd $WS/checkout" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n sponsors \; \
    send-keys "cd $WS/sponsors" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
  detach
  tmux \
    neww -n events \; \
    send-keys "cd $WS/events" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
   detach 
fi
if [ "$TERM_PROGRAM" = "iTerm.app" ] ; then
  # iTerm2 is way nicer, but lacks support for named sessions.
  tmux -CC attach
else
  tmux att -t sfl 
fi
