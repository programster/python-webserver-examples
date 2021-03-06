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

uwsgi --workers $NUM_WORKERS --threads 2 --http :8080 --wsgi-file /var/www/site/app.py