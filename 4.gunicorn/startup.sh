#!/bin/bash

NUM_PROCS=`cat /proc/cpuinfo | awk '/^processor/{print $3}'| wc -l`

# Gunicorn recommends a number of workers equal to 
# (number of processors x 2) + 1
# https://docs.gunicorn.org/en/latest/design.html#how-many-workers
NUM_WORKERS=$(expr $NUM_PROCS \* 2 + 1)

# Start gunicorn with a number of workers equal to the number of cores.
cd /var/www/site
gunicorn --workers $NUM_WORKERS --bind='':8080 app:app