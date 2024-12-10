with open("j9-test.txt", "r", encoding="utf8") as f:
    entree = f.readline()

bloc = [int(e) for e in entree]

disque = list("".join([str(i//2)*e if i%2==0 else "."*e for i, e in enumerate(bloc)]))

i = 0
j = len(disque)-1

while True:
    while i < len(disque) and disque[i] != ".":
        i+=1
    while j >= 0 and disque[j] == ".":
        j-=1
    
    if i >= j:
        break

    c = disque[i]
    disque[i] = disque[j]
    disque[j] = c

print("".join(disque))

s = 0

for i,e in enumerate(disque):
    if e == ".":
        continue

    s += i*int(e)

print(s)