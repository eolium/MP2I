(* Interface des arbres ternaires *)


(** Le type des arbres ternaires d'entiers. *)
type inttree =
| Zero
| Un
| Node of inttree * inttree * inttree (* g, p, d *)


(** [eval tree] est l'entier encodé par [tree].

  /!\ peut vite overflow
*)
val eval : inttree -> int

(** [trouve_p n] vaut la valeur de p dans le triplet (g, p, d)
    correspondant à [n] *)
val trouve_p : int -> int

(** [of_int n] est l'arbre ternaire associé à [n] *)
val of_int : int -> inttree


(** [signature tree] est la signature de tree *)
val signature : inttree -> int

(** [sig_v k n] est la signature de (l'arbre de) v(k,n) *)
val sig_v : int -> int -> int

(** [sig_h k] est la signature de (l'arbre de) h(v(k, 7k)) *)
val sig_h : int -> int

(** [sig_gen k n] est la signature de (l'arbre de) gen(k,n) *)
val sig_gen : int -> int -> int

(** [sig_dec_gen k] est la signature de (l'arbre de)
    gen(k, 19k mod 997)-1 *)
val sig_dec_gen : int -> int

(** [sig_inc_gen k] est la signature de (l'arbre de)
    gen(k, 19k mod 997)+1 *)
val sig_inc_gen : int -> int