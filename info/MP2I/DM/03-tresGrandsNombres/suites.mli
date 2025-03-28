(* Suites et constantes de l'énoncé *)

(** [m] est 2 puiss 31  -1 *)
val m : int


(** [set_u_0 seed] fixe u_0 = [seed] 
  pour les appels suivants de [u] *)
val set_u_0 : int -> unit

(** [u n] est le terme d'indice [n] de la suite u.

  Déclenche [Invalid_argument "u"] si [n < 0] ou [n > 1000]*)
val u : int -> int

(** [v k n] est le terme d'indice [(k,n)] de la suite v

  Déclenche [Invalid_argument "v"] si [n < 0] ou [n > 1000]
  ou [k < 0] ou [k > 61] *)
val v : int -> int -> int

(** [x p] vaut x(p), çad 2 puiss (2 puiss p).

  Déclenche [Invalid_argument "x"] si x(p) overflow *)
val x : int -> int

(** [h p] vaut h(p).

  Déclenche [Invalid_argument "h"] si h(p) overflow *)
val h : int -> int
