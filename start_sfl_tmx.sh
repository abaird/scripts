#!/bin/sh
WS=projects

if ! tmux has-session -t sfl; then
  tmux \
    new -s sfl -n browse \; \
    send-keys "cd $WS/browse" C-m \; \
    send-keys "STEPFORD_LOCAL=true BROWSE_SERVICE_LOCAL=true DEALS_SERVICE_HOST=http://deals-service.lsdev.co foreman start" C-m \; \
    neww -n stepford \; \
    send-keys "cd ~/projects/stepford" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
    neww -n sso-frontend \; \
    send-keys "cd ~/projects/sso-frontend/" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
    neww -n accounts \; \
    send-keys "cd ~/projects/accounts" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
    neww -n deals-service \; \
    send-keys "cd ~/projects/deals-service" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
    neww -n deals \; \
    send-keys "cd ~/projects/deals" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
    neww -n cupcake \; \
    send-keys "cd ~/projects/cupcake" C-m \; \
    send-keys "LOCAL_STEPFORD=true bundle exec foreman start" C-m \; \
    neww -n geo \; \
    send-keys "cd ~/projects/geo" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
    neww -n city-service \; \
    send-keys "cd ~/projects/city-service" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
    neww -n browse-service \; \
    send-keys "cd ~/projects/browse-service" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
    neww -n pipeline \; \
    send-keys "cd ~/projects/pipeline" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
    neww -n deal_bucks \; \
    send-keys "cd ~/projects/deal_bucks" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
    neww -n fakeybiller \; \
    send-keys "cd ~/projects/fakeybiller" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
    neww -n payments \; \
    send-keys "cd ~/projects/payments" C-m \; \
    send-keys "bundle exec foreman start -f Procfile.no_fakeybiller" C-m \; \
    neww -n travel-service \; \
    send-keys "cd ~/projects/travel-service" C-m \; \
    send-keys "bundle exec foreman start" C-m \; \
    neww -n escapes \; \
    send-keys "cd ~/projects/escapes" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
    neww -n products \; \
    send-keys "cd ~/projects/products" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
    neww -n checkout \; \
    send-keys "cd ~/projects/checkout" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
    neww -n sponsors \; \
    send-keys "cd ~/projects/sponsors" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
    neww -n events
    send-keys "cd ~/projects/events" C-m \; \
    send-keys "STEPFORD_LOCAL=true bundle exec foreman start" C-m \; \
   detach 
fi
if [ "$TERM_PROGRAM" = "iTerm.app" ] ; then
  # iTerm2 is way nicer, but lacks support for named sessions.
  tmux -CC attach
else
  tmux att -t sfl 
fi
