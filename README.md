This is a script that can be used to generate a bunch of parallel processes.

This is intended to be used to show a bug in Zscaler on macOS where if too many
processes are running, then Zscaler will show a large drop in bandwidth.

The script `load-cpus.sh` allows loading up many parallel threads doing busy
work.  This can be used on the command line to interactively show the problem.

The script `test.sh` uses `load-cpus.sh` to show a drop in bandwidth when
downloading a small 5MiB test file.

#### Example Output


```
# ./test.sh
--2024-05-21 15:57:37--  http://212.183.159.230/5MB.zip
Connecting to 212.183.159.230:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5242880 (5.0M) [application/zip]
Saving to: ‘/dev/null’

/dev/null                  100%[=======================================>]   5.00M  2.98MB/s    in 1.7s

2024-05-21 15:57:39 (2.98 MB/s) - ‘/dev/null’ saved [5242880/5242880]


real	0m1.908s
user	0m0.016s
sys	0m0.043s
[info] Spawning `yes` number 1
[info] Spawning `yes` number 2
[info] Spawning `yes` number 3
[info] Spawning `yes` number 4
[info] Spawning `yes` number 5
[info] Spawning `yes` number 6
[info] Spawning `yes` number 7
[info] Spawning `yes` number 8
[info] Spawning `yes` number 9
[info] Spawning `yes` number 10
[info] Spawning `yes` number 11
[info] Spawning `yes` number 12
[info] Spawning `yes` number 13
[info] Spawning `yes` number 14
[info] Spawning `yes` number 15
[info] Spawning `yes` number 16
--2024-05-21 15:57:40--  http://212.183.159.230/5MB.zip
Connecting to 212.183.159.230:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5242880 (5.0M) [application/zip]
Saving to: ‘/dev/null’

/dev/null                  100%[=======================================>]   5.00M   341KB/s    in 12s

2024-05-21 15:57:53 (413 KB/s) - ‘/dev/null’ saved [5242880/5242880]


real	0m12.806s
user	0m0.015s
sys	0m0.058s
```
