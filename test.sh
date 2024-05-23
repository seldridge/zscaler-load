#!/usr/bin/env bash

download_file() {
  time curl 'http://212.183.159.230/5MB.zip' -o /dev/null
}

download_file

./load-cpus.sh -n 32 &
pid=$!

kill_load_cpus() {
  kill $pid
}

trap kill_load_cpus EXIT

sleep 1
download_file
