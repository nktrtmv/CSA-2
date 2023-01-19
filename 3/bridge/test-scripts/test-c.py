import subprocess

for i in range(1, 133):
    cmd = f'/bridge/c.out -f /bridge/tests/tests-3/{i}_in.txt /bridge/tests/tests-3/{i}_out.txt'
    PIPE = subprocess.PIPE
    p = subprocess.Popen(cmd, shell = True)
    p.wait()
