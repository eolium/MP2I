with open("j3.txt", "r", encoding="utf8") as f:
    msg = f.read()

out = 0

enabled = True

for i in range(len(msg)-4):
    if msg[i]+msg[i+1]+msg[i+2]+msg[i+3] == "do()":
        enabled = True

    try:
        if msg[i]+msg[i+1]+msg[i+2]+msg[i+3]+msg[i+4]+msg[i+5]+msg[i+6] == "don't()":
            enabled = False
    except:
        pass

    if msg[i]+msg[i+1]+msg[i+2]+msg[i+3] == "mul(":
        m = msg[i:].split(")")[0][4:].split(",")

        if len(m) == 2 and m[0].isdigit() and m[1].isdigit() and enabled:
            a, b = int(m[0]), int(m[1])

            out += a*b

print(out)
