tab1, tab2 = [], []

with open("j1-2.txt", "r", encoding="utf8") as f:
    while True:
        l = f.readline()[:-1]
        if l == "": break
        else:
            a, b = l.split("   ")
            tab1.append(int(a))
            tab2.append(int(b))

tab1.sort()
tab2.sort()

assert len(tab1) == len(tab2)

out = [abs(tab1[i] - tab2[i]) for i in range(len(tab1))]

print(sum(out))
