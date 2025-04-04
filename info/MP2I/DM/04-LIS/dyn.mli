(** Programmation dynamique de Longuest Increasing Subsequence

    Ici, on représente une séquence par un tableau.
    On optimise la version naïve par programmation 
    dynamique, et on termine en calculant une
    solution optimale.
*)


(** [search arr lg i] est le [lg.(k)]
    maximal avec [k < i] 
    et [arr.(k) <= arr.(i)].

    S'il n'y a pas de tel [k] renvoie [0].
*)
val search : 'a array -> int array -> int -> int

(** [lis arr] est la longueur de la plus longue
    sous-séquence croissante de [arr]
*)
val lis : 'a array -> int

(** [search_indice arr lg i] vaut [Some k] 
    avec [k = search arr lg i] si [k > 0],
    et vaut [None] sinon.
*)
val search_indice : 'a array -> int array -> int -> int option

(** [sol_lis arr] est la plus longue sous-séquence 
    (sous-tableau) croissante de [arr]
*)
val sol_lis : 'a array -> 'a array
