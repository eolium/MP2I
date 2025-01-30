from random import *

with open("list_diff copy.md", "r", encoding="utf8") as f:
    lst = list(map(lambda e: e.replace("\n", "").split(" | "), f.readlines()))

    while True:
        i = randrange(0, len(lst))
        print(len(lst))
        c = lst.pop(i)
        print(c[0])
        input()
        print(c[1], "\n")