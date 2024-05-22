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
--2024-05-22 19:45:34--  http://212.183.159.230/5MB.zip
Connecting to 212.183.159.230:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5242880 (5.0M) [application/zip]
Saving to: ‘/dev/null’

/dev/null                                100%[=================================================================================>]   5.00M  3.00MB/s    in 1.7s

2024-05-22 19:45:36 (3.00 MB/s) - ‘/dev/null’ saved [5242880/5242880]


real	0m1.896s
user	0m0.016s
sys	0m0.043s
[info] Forking 32 processes:
[info]   - Process 1: 26935
[info]   - Process 2: 26936
[info]   - Process 3: 26937
[info]   - Process 4: 26938
[info]   - Process 5: 26939
[info]   - Process 6: 26940
[info]   - Process 7: 26941
[info]   - Process 8: 26942
[info]   - Process 9: 26943
[info]   - Process 10: 26944
[info]   - Process 11: 26945
[info]   - Process 12: 26946
[info]   - Process 13: 26947
[info]   - Process 14: 26948
[info]   - Process 15: 26949
[info]   - Process 16: 26950
[info]   - Process 17: 26951
[info]   - Process 18: 26952
[info]   - Process 19: 26953
[info]   - Process 20: 26954
[info]   - Process 21: 26955
[info]   - Process 22: 26956
[info]   - Process 23: 26957
[info]   - Process 24: 26958
[info]   - Process 25: 26959
[info]   - Process 26: 26960
[info]   - Process 27: 26961
[info]   - Process 28: 26962
[info]   - Process 29: 26963
[info]   - Process 30: 26964
[info]   - Process 31: 26965
[info]   - Process 32: 26966
--2024-05-22 19:45:37--  http://212.183.159.230/5MB.zip
Connecting to 212.183.159.230:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 5242880 (5.0M) [application/zip]
Saving to: ‘/dev/null’

/dev/null                                100%[=================================================================================>]   5.00M  59.3KB/s    in 73s

2024-05-22 19:46:51 (70.5 KB/s) - ‘/dev/null’ saved [5242880/5242880]


real	1m13.792s
user	0m0.020s
sys	0m0.051s
[info] Killing all forked processes:
[info]   - Killed 26935
[info]   - Killed 26936
[info]   - Killed 26937
[info]   - Killed 26938
[info]   - Killed 26939
[info]   - Killed 26940
[info]   - Killed 26941
[info]   - Killed 26942
[info]   - Killed 26943
[info]   - Killed 26944
[info]   - Killed 26945
[info]   - Killed 26946
[info]   - Killed 26947
[info]   - Killed 26948
[info]   - Killed 26949
[info]   - Killed 26950
[info]   - Killed 26951
[info]   - Killed 26952
[info]   - Killed 26953
[info]   - Killed 26954
[info]   - Killed 26955
[info]   - Killed 26956
[info]   - Killed 26957
[info]   - Killed 26958
[info]   - Killed 26959
[info]   - Killed 26960
[info]   - Killed 26961
[info]   - Killed 26962
[info]   - Killed 26963
[info]   - Killed 26964
[info]   - Killed 26965
[info]   - Killed 26966
```
