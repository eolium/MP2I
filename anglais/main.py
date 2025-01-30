with open("liste.txt", "r", encoding="utf8") as f:
    lst = list(map(lambda e: e[:-1], f.readlines()))

    for i in range(0, len(lst), 2):
        print(f"|{lst[i]} | {lst[i+1]}|")
