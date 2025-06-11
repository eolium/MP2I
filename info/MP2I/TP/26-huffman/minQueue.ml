(* File de priorité min. *)

(* On utilise une implém par tas min,
   ainsi que le fait que la comparaison par
   défaut est lexicographique. Ainsi, quand on compare
   (p0, v0) et (p1, v1) , les priorités pi sont comparées
   avant les valeurs vi.
*)

type 'a t = (float * 'a) MinHeap.t

exception Empty

let create = MinHeap.create

let is_empty = MinHeap.is_empty

let length = MinHeap.length

let add q prio x =
  MinHeap.add q (prio, x)

let peek q = 
  try MinHeap.peek q
  with MinHeap.Empty -> raise Empty

let peek_opt = MinHeap.peek_opt

let take_min q = 
  try MinHeap.take_min q
  with MinHeap.Empty -> raise Empty

let take_min_opt = MinHeap.take_min_opt