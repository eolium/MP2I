(* Files de priorité min *)

(** Le type d'une file de priorité min.
  Les comparaisons sont lexicographiques sur
  (priorité x valeur).

  La priorité est un float.
*)
type 'a t

(** Levée quand [minQueue.peek] ou [minQueue.take_min] est 
    appliqué à une file min vide. *)
exception Empty

(** [create ()] est une file min vide *)
val create : unit -> 'a t

(** [is_empty q] est [true] si [q] est vide, [false] sinon *)
val is_empty : 'a t -> bool

(** [length t] est le nombre d'éléments de la file min [t] *)
val length : 'a t -> int

(** [add q p x] modifie la file min [q] 
  pour insérer avec priorité [p] l'élément [x]
*)
val add : 'a t -> float -> 'a -> unit

(** [peek q] est la paire (priorité, élément) de [q] dont 
  la priorité est minimale. En cas d'ex-aequo, c'est celle 
  dont l'élément est minimal.

  Il s'agit de l'élément qui serait défile par [take].

  Lève [minQueue.Empty] si [q] est vide.
*)
val peek : 'a t -> float * 'a

(** Comme [peek], mais avec des Options au lieu de l'exception. *)
val peek_opt : 'a t -> (float * 'a) option

(** [take_min t] est la paire (priorité, élément) de [q] dont 
  la priorité est minimale. En cas d'ex-aequo, c'est celle 
  dont l'élément est minimal. L'appel modifie [q] pour 
  supprimer l'occurence (priorité, élément) en question.

  Lève [minQueue.Empty] si [q] est vide.
*)
val take_min : 'a t -> float * 'a

(** Comme [take_min], mais avec des Options au lieu de l'exception. *)
val take_min_opt : 'a t -> (float * 'a) option