from tqdm import tqdm

def verify(manuel, rules):
    for r in rules:
        if r[0] in manuel and r[1] in manuel and manuel.index(r[0]) > manuel.index(r[1]):
            return False

    return True


def create_matrice(rules, nb_pages):
    pass

    # nique sa mère

rules = []

manuels = []

nb_pages = 0

with open("j5.txt", "r", encoding="utf8") as f:
    while True:
        l = f.readline()[:-1]
        if l == "": break
        rules.append([int(e) for e in l.split("|")])
        nb_pages = max(max(rules[-1]), nb_pages)

    while True:
        l = f.readline()[:-1]
        if l == "": break
        manuels.append([int(e) for e in l.split(",")])
        nb_pages = max(max(manuels[-1]), nb_pages)

out = 0

maximum = 0

M = create_matrice(rules, nb_pages)

print(M)
exit()

for m in manuels:
    if verify(m, rules):
        out += m[len(m) // 2]
    else:
        maximum = max(len(m), maximum)