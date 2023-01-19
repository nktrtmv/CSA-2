import subprocess

for i in range(1, 133):
    cmd = f'/bridge/final.out -f /bridge/tests/tests-8/{i}_in.txt /bridge/tests/tests-8/{i}_out.txt'
    PIPE = subprocess.PIPE
    p = subprocess.Popen(cmd, shell = True)
    p.wait()
