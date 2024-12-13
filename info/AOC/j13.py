from pprint import pprint
from re import findall

def separer(tab: list) -> list:
    return [tab[i:][:6] for i in range(0, len(tab), 6)]

with open("j13.txt", "r", encoding="utf8") as f:
    tab = separer(list(map(int, findall(r'\d+', f.read()))))

import numpy as np

def cout(t: list) -> int:
    M1 = np.array([
        [t[0], t[2]],
        [t[1], t[3]]
    ])

    M2 = np.array([
        [t[4]],
        [t[5]]
    ])

    print(M1)

for e in tab:
    cout(e)
    print("")