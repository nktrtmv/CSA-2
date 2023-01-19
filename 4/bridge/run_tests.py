import subprocess

for i in range(1, 101):
    cmd = f'./a.out -f ./tests/input/input_{i}.txt ./tests/output/output_{i}.txt'
    PIPE = subprocess.PIPE
    p = subprocess.Popen(cmd, shell = True)
    p.wait()
    print(f'test {i} completed')