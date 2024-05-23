This is a script that can be used to generate a bunch of parallel processes.

This is intended to be used to show a bug in Zscaler on macOS where if too many
processes are running, then Zscaler will show a large drop in bandwidth.

The script `load-cpus.sh` allows loading up many parallel threads doing busy
work.  This can be used on the command line to interactively show the problem.

The script `test.sh` uses `load-cpus.sh` to show a drop in bandwidth when
downloading a small 5MiB test file.

#### Example Output

The example below shows that loading the CPU with 32 processes causes download
speed to drop to 10% of unloaded bandwidth.

```
# ./test.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 5120k  100 5120k    0     0  2659k      0  0:00:01  0:00:01 --:--:-- 2658k

real	0m1.946s
user	0m0.021s
sys	0m0.047s
[info] Forking 32 processes:
[info]   - Process 1: 64835
[info]   - Process 2: 64836
[info]   - Process 3: 64837
[info]   - Process 4: 64838
[info]   - Process 5: 64839
[info]   - Process 6: 64840
[info]   - Process 7: 64841
[info]   - Process 8: 64842
[info]   - Process 9: 64843
[info]   - Process 10: 64844
[info]   - Process 11: 64845
[info]   - Process 12: 64846
[info]   - Process 13: 64847
[info]   - Process 14: 64848
[info]   - Process 15: 64849
[info]   - Process 16: 64850
[info]   - Process 17: 64851
[info]   - Process 18: 64852
[info]   - Process 19: 64853
[info]   - Process 20: 64854
[info]   - Process 21: 64855
[info]   - Process 22: 64856
[info]   - Process 23: 64857
[info]   - Process 24: 64858
[info]   - Process 25: 64859
[info]   - Process 26: 64860
[info]   - Process 27: 64861
[info]   - Process 28: 64862
[info]   - Process 29: 64863
[info]   - Process 30: 64864
[info]   - Process 31: 64865
[info]   - Process 32: 64866
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 5120k  100 5120k    0     0   251k      0  0:00:20  0:00:20 --:--:--  510k

real	0m20.373s
user	0m0.020s
sys	0m0.037s
[info] Killing all forked processes:
[info]   - Killed 64835
[info]   - Killed 64836
[info]   - Killed 64837
[info]   - Killed 64838
[info]   - Killed 64839
[info]   - Killed 64840
[info]   - Killed 64841
[info]   - Killed 64842
[info]   - Killed 64843
[info]   - Killed 64844
[info]   - Killed 64845
[info]   - Killed 64846
[info]   - Killed 64847
[info]   - Killed 64848
[info]   - Killed 64849
[info]   - Killed 64850
[info]   - Killed 64851
[info]   - Killed 64852
[info]   - Killed 64853
[info]   - Killed 64854
[info]   - Killed 64855
[info]   - Killed 64856
[info]   - Killed 64857
[info]   - Killed 64858
[info]   - Killed 64859
[info]   - Killed 64860
[info]   - Killed 64861
[info]   - Killed 64862
[info]   - Killed 64863
[info]   - Killed 64864
[info]   - Killed 64865
[info]   - Killed 64866
```
