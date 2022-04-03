#!/bin/bash
set -e

# Remove potentially pre-existing server pid for Rails
rm -f /turdle/tmp/pids/server.pid

# Execute container's main process
exec "$@"
