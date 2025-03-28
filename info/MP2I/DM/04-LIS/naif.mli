(** Version naïve de Longuest Increasing Subsequence 

    Ici, on représente une séquence par une liste.
    On travaille avec des algorithmes récursifs naïfs.
*)


(** [is_increasing l] vaut [true] ssi
    [l] est triée par ordre croissant
*)
val is_increasing : 'a list -> bool

(** [all_subsequence l] est la liste des
    sous-séquences (sous-listes) de [l]
*)
val all_subsequence : 'a list -> 'a list list

(** [all_subsequence l] est la liste des
    sous-séquences (sous-listes) de [l]
*)
val all_sub_increasing : 'a list -> 'a list list

(** [lis l] est la longueur de la plus longue
    sous-séquence (sous-liste) croissante de [l]
*)
val lis : 'a list -> int

(** [sol_lis l] est la plus longue sous-séquence 
    (sous-liste) croissante de [l]
*)
val sol_lis : 'a list -> 'a list