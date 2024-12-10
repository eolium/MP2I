from pprint import pprint
from tqdm import tqdm
from math import isqrt

M = []

with open("j8.txt", "r", encoding="utf8") as f:
    while True:
        l = f.readline()[:-1]
        if l == "": break
        M.append(list(l))

width = len(M)
height = len(M[0])

antennes = []

for x in range(width):
    for y in range(height):
        if M[x][y] != ".":
            antennes.append((x, y, M[x][y]))

def produit_scalaire(a, b, c):
    return (a[0]-b[0])*(a[0]-c[0])+(a[1]-b[1])*(a[1]-c[1])

def distance(a, b):
    return isqrt((a[0]-b[0])**2+(a[1]-b[1])**2)


out = set()

for x in tqdm(range(width)):
    for y in tqdm(range(height)):
        for a in antennes:
            for b in antennes:
                if a == b or a[2] != b[2]: continue

                c = (x, y)

                if produit_scalaire(a, b, c) == 1 and distance(a, c)*2 <= distance(b, c):
                    M[x][y] = "#"
                    out.add(c)

print(len(out))