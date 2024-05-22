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

processes=()
kill_all_yes() {
  echo "[info] Killing all forked processes:"
  for pid in "${processes[@]}"; do
    kill $pid
    echo "[info]   - Killed $pid"
  done
}

trap kill_all_yes SIGINT SIGTERM

echo "[info] Forking $OPT_PROCESSES processes:"
for i in $(seq 1 $OPT_PROCESSES); do
  yes > /dev/null &
  pid=$!
  echo "[info]   - Process $i: $pid"
  processes+=($pid)
done

wait
