#!/bin/bash

NUM_PROCS=`cat /proc/cpuinfo | awk '/^processor/{print $3}'| wc -l`

# Gunicorn recommends a number of workers equal to 
# (number of processors x 2) + 1
# https://docs.gunicorn.org/en/latest/design.html#how-many-workers
NUM_WORKERS=$(expr $NUM_PROCS \* 2 + 1)

# Start gunicorn with a number of workers equal to the number of cores
# and listening on socket instead of IP, because nginx will be passing to
# gunicorn this way
cd /var/www/site
gunicorn --workers $NUM_WORKERS --daemon --bind unix:/tmp/gunicorn.sock app:app 

# Start nginx which will pass to gunicorn
service nginx start

# Run the cron service in the foreground to keep the container running.
cron -f