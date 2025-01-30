from itertools import permutations
from tqdm import tqdm
from os import system
from math import inf
from time import time
from multiprocessing import Process, Manager

tab = [
  [-1, 2],
  [1, 2],
  [2, 1],
  [2, -1],
  [1, -2],
  [-1, -2],
  [-2, -1]
]

def f(L, tab):
  a = " ".join([str(e[0]) for e in tab])
  b = " ".join([str(e[1]) for e in tab])

  t1 = time()
  system(f"echo '5\n3\n3\n{a}\n{b}' | ./cavalier")
  t2 = time()

  if t2-t1 < L[0]:
    L[0] = t2 - t1
    L[1] = tab

with Manager() as manager:
  L = manager.list()
  L.append(inf)
  L.append([])

  for e in tqdm(permutations(tab)):
    p = []
    for i in range(8):
      e2 = list(e).copy()
      e2.insert(i, [-2, 1])

      p.append(Process(target=f, args=(L, e2)))
      p[-1].start()

    for i in range(8):
      p[i].join()

  print(L)