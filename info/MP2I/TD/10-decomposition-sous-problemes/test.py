from random import randint

tab = [randint(1, 10) for _ in range(10**3)]

print("let gros_morceau = [| ", end="")

for i in range(len(tab)-1):
    print(tab[i], end="; ")

print(tab[-1], " |]")