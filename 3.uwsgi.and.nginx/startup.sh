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

chown www-data:www-data --recursive /var/www

touch /tmp/uwsgi.sock
chown www-data:www-data /tmp/uwsgi.sock 
chmod 660 /tmp/uwsgi.sock 

uwsgi \
  --uid=www-data \
  --workers $NUM_WORKERS \
  --threads 2 \
  --socket /tmp/uwsgi.sock \
  --wsgi-file /var/www/site/app.py &


service nginx start

cron -f