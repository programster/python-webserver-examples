#!/bin/bash

BASE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


# Specify the number of users you wish to hit the webserver all at once.
NUM_USERS=500


# Specify  your webservers IP. Using "localhost" or 127.0.0.1 wont work here
# because gatling is running inside a docker container.
MY_LOCAL_IP="192.168.0.2"


docker run \
  -e JAVA_OPTS="-Dusers=$NUM_USERS -DsiteUrl=http://$MY_LOCAL_IP:8080/" \
  -it \
  --rm \
  -v $BASE_DIR/conf:/opt/gatling/conf \
  -v $BASE_DIR/user-files:/opt/gatling/user-files \
  -v $BASE_DIR/results:/opt/gatling/results \
  denvazh/gatling