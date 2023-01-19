import subprocess

for i in range(1, 13):
    cmd = f'/bridge/a.out -f /bridge/tests/time-tests/{i}_in.txt /bridge/tests/time-tests/{i}_out.txt'
    PIPE = subprocess.PIPE
    p = subprocess.Popen(cmd, shell = True)
    p.wait()
