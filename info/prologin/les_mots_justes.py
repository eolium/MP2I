from collections import Counter

N = int(input(""))

a = [input("") for _ in range(N)]

b = [input("") for _ in range(N)]

phrase = []
for ai in a:
    for bi in b:
        phrase.append(ai+bi)

tab = [e for e in Counter(phrase).values()]
t = Counter(tab).most_common()[0][0]

print(sum([abs(e - t) for e in tab]))