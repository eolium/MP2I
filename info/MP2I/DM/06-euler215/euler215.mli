(* Interface de la solution du problème 215 du projet Euler *)


(*******************************)
(* Raisonnement sur les lignes *)
(*******************************)

(** Un type pour manipuler des lignes de briques.

  Une ligne est une succession de [nb_empl] 
  emplacements, soit vides soit pleins. 
  
  On stocke la succession d'emplacements 
  comme une succession de 0/1 : on la stocke ainsi
  dans les [nb_empl] bits de poids faible de [code].
*)
type ligne = { code : int; nb_empl : int}

(** Affiche une ligne *)
val print_ligne : ligne -> unit

(** [ligne creuse nb_empl] est la ligne creuse à [nb_empl]
  emplacements dont les seuls 1 sont au premier et dernier
  emplacement.

  Lève [Invalid_argument "ligne_creuse"] si [nb_empl <= 1].
*)
val ligne_creuse : int -> ligne

(* A fin de débogage : quelques lignes particulières *)
val ligne_vide : ligne (** Ligne vide *)
val ligne_b2   : ligne (** Uniquement une 2-brique *)
val ligne_b3   : ligne (** Uniquement une 3-brique *)
val ligne_b22  : ligne (** Une 2-brique puis une autre *)
val ligne_b23  : ligne (** Une 2-brique puis une 3-brique *)
val ligne_b32  : ligne (** Une 3-brique puis une 2-brique *)
val ligne_b33  : ligne (** Une 3-brique puis une autre *)

(** [est_collision p q] est [true] si [p] et [q] ont 
  une collision, [false] sinon.

  Lève [Invalid_argument "est_collision"] si [p] et [q]
  n'ont pas le même nombre d'emplacements.
*)
val est_collision : ligne -> ligne -> bool 

(** [etend nb_goal lgn] est la liste des lignes
  de longueur [nb_goal] qui sont des extensions de
  la ligne [lgn]
*)
val etend : int -> ligne -> ligne list

(** [calcule_lignes h] est la liste des codes 
  des lignes de dimension horizontale [h]. 
*)
val calcule_lignes : int -> ligne list


(**************************)
(* Résolution du problème *)
(**************************)

(** [sum_map f [x1; ...; xN]] est [f x1 + ... + f xN] *)
val sum_map : ('a -> int) -> 'a list -> int

(** [euler215 horizontal vertical] est la solution 
  du problème 215 du projet Euler en dimension 
  [horizontal] x [vertical]
*)
val euler215 : int -> int -> int
