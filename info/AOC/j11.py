from tqdm import tqdm

with open("j11.txt", "r", encoding="utf8") as f:
    tab = [int(e) for e in f.readlines()[0].split(" ")]

def paire(n):
    l = str(n)
    m = len(l)//2
    return int(l[:m]), int(l[m:])

def blink(tab):
    s = False

    for i, e in enumerate(tab):
        if s:
            s = False
            continue
        if e == 0:
            tab[i] = 1
        elif len(str(e))%2 == 0:
            t = paire(e)
            tab[i] = t[0]
            tab.insert(i+1, t[1])
            s = True
        else:
            tab[i]*=2024



print(len(tab))