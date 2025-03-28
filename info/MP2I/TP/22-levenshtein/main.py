from random import choices, randrange
import string
from os import system

alpha = string.ascii_letters + string.digits

n = 10**4

a = "".join(choices(alpha, k = randrange(n, 10*n)))
b = "".join(choices(alpha, k = randrange(n, 10*n)))

print(f"./main {a} {b}")