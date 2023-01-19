import random

for i in range(1,101):
    with open(f"./tests/input/input_{i}.txt", "w") as f:
        k = random.randint(2,1501)
        for j in range(k):
            f.write(str(random.randint(1,200)) + ' ')
        f.write(str(0) + '\n')
    print(f"test {i} generated")