from pprint import pprint
from tqdm import tqdm

M = []

with open("j10.txt", "r", encoding="utf8") as f:
    while True:
        l = f.readline()[:-1]
        if l == "": break
        M.append([int(e) if e != "." else -1 for e in list(l)])


def total_chemins(x, y):
    out = set()

    if M[x][y] == 9:
        out.add((x, y))
        return out

    # On teste dans chaque direction
    if x > 0 and M[x-1][y]-M[x][y] == 1:
        out.update(total_chemins(x-1, y))

    if x < len(M)-1 and M[x+1][y]-M[x][y] == 1:
        out.update(total_chemins(x+1, y))

    if y > 0 and M[x][y-1]-M[x][y] == 1:
        out.update(total_chemins(x, y-1))

    if y < len(M[0])-1 and M[x][y+1]-M[x][y] == 1:
        out.update(total_chemins(x, y+1))

    return out

def rating(x, y):
    out = 0

    if M[x][y] == 9:
        return 1

    # On teste dans chaque direction
    if x > 0 and M[x-1][y]-M[x][y] == 1:
        out += rating(x-1, y)

    if x < len(M)-1 and M[x+1][y]-M[x][y] == 1:
        out += rating(x+1, y)

    if y > 0 and M[x][y-1]-M[x][y] == 1:
        out += rating(x, y-1)

    if y < len(M[0])-1 and M[x][y+1]-M[x][y] == 1:
        out += rating(x, y+1)

    return out

s = 0
r = 0

for x in range(len(M)):
    for y in range(len(M[0])):
        if M[x][y] == 0:
            s += len(total_chemins(x, y))
            r += rating(x, y)

print(s)
print(r)