#!/bin/bash

# set -e
rm -f /usr/src/app/tmp/pids/server.pid
# bundle exec rake db:{drop,create,migrate,seed}
exec "$@"
