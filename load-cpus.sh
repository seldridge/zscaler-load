#!/usr/bin/env bash

set -eo pipefail

usage() {
  cat <<EOF
USAGE: $0 -n <processes>

Load up a machine with `n` parallel processes.  Use C-c to kill this program and
kill running parallel processes.

OPTIONS:
    -h                    Display available options
    -n                    The number of processes to launch
EOF
}

OPT_PROCESSES=
while getopts "n:h" option; do
  case $option in
    h)
      usage
      exit 0
      ;;
    n)
      OPT_PROCESSES=$OPTARG
      ;;
    *)
      echo "Unrecognized option"
      exit 1
      ;;
  esac
done

if [[ ! $OPT_PROCESSES ]]; then
  echo "missing mandatory option -n"
  usage
  exit 1
fi

kill_all_yes() {
  echo [info] Killing all running yes processes
  pkill yes
}

trap kill_all_yes SIGINT

for i in $(seq 1 $OPT_PROCESSES); do
  echo [info] Spawning '`yes`' number $i
  yes > /dev/null &
done

wait
