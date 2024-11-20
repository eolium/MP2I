#!/usr/bin/python3
from collections import Counter

"""

Le problème revient à prendre une liste de chaines, et retirer autant de doublons que possibles.
Finalement, à la fin, pour chaque chaine possible, il reste :
    - 1 chaine s'il y avait un nombre impair de chaines égales
    - 0 chaine s'il y en avait un nombre pair

On réalise donc un compteur (d'où le fait que j'ai choisi python qui intègre déjà ça) des chaines,
puis on affiche la somme des comptes %2 (0 si pair, 1 si impair).

"""

# Nombre de lignes
N = int(input(""))
# Taille des lignes
M = int(input(""))

# On récupère les lignes
lignes = [input("") for _ in range(N)]

# On réalise un counter
C = Counter(lignes)

print(sum([e%2 for e in C.values()]))