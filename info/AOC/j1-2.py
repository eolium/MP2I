from collections import Counter

tab1, tab2 = [], []

with open("j1-2.txt", "r", encoding="utf8") as f:
    while True:
        l = f.readline()[:-1]
        if l == "": break
        else:
            a, b = l.split("   ")
            tab1.append(int(a))
            tab2.append(int(b))

c = Counter(tab2)

out = 0

for n in tab1:
    out += n * c[n]

print(out)
