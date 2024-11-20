from collections import Counter

N = int(input(""))

valeur = int(input(""))

boites = [int(e) for e in input("").split(" ")]

for i in range(1, len(boites)):
    boites[i] = (boites[i] + boites[i-1])

c = Counter(boites)

print(boites)
print(sum([e*(e-1)/2 for i, e in c.items()]))