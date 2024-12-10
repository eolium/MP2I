sign = lambda x: x // abs(x)


instable = lambda a, b: not (1 <= abs(a-b) <= 3)

def verifier(tab):
    if instable(tab[0], tab[1]): return False

    s = sign(tab[1]-tab[0])

    for i in range(1, len(tab)):
        if instable(tab[i], tab[i-1]) or sign(tab[i]-tab[i-1]) != s: return False

    return True


out = 0

with open("j2.txt", "r", encoding="utf8") as f:
    while True:
        l = f.readline()[:-1]
        if l == "": break

        tab = [int(e) for e in l.split(" ")]

        if verifier(tab):
            out += 1
        else:
            for i in range(len(tab)):
                tab2 = tab.copy()
                tab2.pop(i)
                if verifier(tab2):
                    out += 1
                    break

print(out)