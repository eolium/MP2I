for i in range(25):
    chaine = input("").split(" ")
    if len(chaine) != 25:
        print(i+1, len(chaine))

    for e in chaine:
        try:
            int(e)
        except:
            print(i, e)