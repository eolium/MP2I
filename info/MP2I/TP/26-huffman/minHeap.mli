(* Tas min impératifs *)

(** Le type d'un tas min. L'ordre utilisé est l'ordre
    par défaut sur le type ['a]
*)
type 'a t


(** Levée quand [minHeap.peek] ou [minHeap.take_min] est 
    appliqué à une file min vide. *)
exception Empty


(** [create ()] est un tas min vide *)
val create : unit -> 'a t

(** [is_empty t] est [true] si [t] est valide, [false] sinon *)
val is_empty : 'a t -> bool

(** [length t] est le nombre d'éléments du tas min [t] *)
val length : 'a t -> int

(** [add t x] modifie le tas min [t] pour insérer [x] *)
val add : 'a t -> 'a -> unit

(** [peek t] est le minimum du tas min [t]. Laisse [t] inchangé.

  Lève [minHeap.Empty] si [t] est vide.
*)
val peek : 'a t -> 'a

(** Comme [peek], mais avec des Options au lieu de l'exception. *)
val peek_opt : 'a t -> 'a option

(** [take_min t] est le minimum du tas min [t]. L'appel modifie [t]
    pour supprimer l'occurence en question du minimum.

  Lève [minHeap.Empty] si [t] est vide.
*)
val take_min : 'a t -> 'a

(** Comme [take_min], mais avec des Options au lieu de l'exception. *)
val take_min_opt : 'a t -> 'a option

(** [heapSort arr] modifie [arr] pour le trier. 
    S'exécute en n log n comparaisons avec n le nombre d'éléments.

  Ce n'est pas un tri en place, car j'utilise ici des tas
  min et non des tas max. On pourrait utiliser des astuces
  pour s'en sortir, je ne l'ai pas fait pour rester simple.
*)
val heapSort : 'a array -> unit