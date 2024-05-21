#!/usr/bin/env bash

download_file() {
  time wget 'http://212.183.159.230/5MB.zip' -O /dev/null
}

download_file

./load-cpus.sh -n 16 &
pid=$!

sleep 1
download_file

pkill yes
