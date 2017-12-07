#!/bin/sh

# TODO: host IP is always 172.18.0.1 ?
URL="http://172.18.0.1:3000/node/get_host_definition?hostname=$1"

if [ "$1" = "puppetdb.foo.local" ]; then
  echo '---
parameters:
classes:'
  exit
fi

if [ -d /usr/local/cache/ ]; then

  echo "cached $1" >> /usr/local/cache/log
  /usr/bin/wget -O "/usr/local/cache/$1.yaml" -q $URL
  /bin/cat "/usr/local/cache/$1.yaml"

else
  
  /usr/bin/wget -O - -q $URL

fi
