from pprint import pprint

def value(M, x, y):
    out = 0

    try:
        if M[y][x]+M[y][x-1]+M[y][x-2]+M[y][x-3] == "XMAS":
            out += 1
    except: pass

    try:
        if M[y][x]+M[y][x+1]+M[y][x+2]+M[y][x+3] == "XMAS":
            out += 1
    except: pass

    try:
        if M[y][x]+M[y+1][x]+M[y+2][x]+M[y+3][x] == "XMAS":
            out += 1
    except: pass

    try:
        if M[y][x]+M[y-1][x]+M[y-2][x]+M[y-3][x] == "XMAS":
            out += 1
    except: pass

    try:
        if M[y][x]+M[y+1][x+1]+M[y+2][x+2]+M[y+3][x+3] == "XMAS":
            out += 1
    except: pass


    try:
        if M[y][x]+M[y+1][x-1]+M[y+2][x-2]+M[y+3][x-3] == "XMAS":
            out += 1
    except: pass

    try:
        if M[y][x]+M[y-1][x+1]+M[y-2][x+2]+M[y-3][x+3] == "XMAS":
            out += 1
    except: pass

    try:
        if M[y][x]+M[y-1][x-1]+M[y-2][x-2]+M[y-3][x-3] == "XMAS":
            out += 1
    except: pass

    return out

M = []

with open("j4-2.txt", "r", encoding="utf8") as f:
    while True:
        l = f.readline()[:-1]
        if l == "": break

        M.append(list(l))

out = 0

for x in range(len(M[0])):
    for y in range(len(M)):
        out += value(M, x, y)

print(out-1)
