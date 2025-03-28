(** Lecture de séquences depuis un fichier.

    L'objectif est de renvoyer chaque ligne
    comme une liste d'entiers ou comme
    un tableau d'entiers; et chaque fichier
    comme une liste de lignes.
*)

(** [get_lines filename] est la liste des lignes
    du fichier [filename], toutes stockées comme
    des [string]
*)
val get_lines : string -> string list

(** [intlist_of_line] transforme une string contenant
    des entiers séparés par des espaces en la liste
    de ces entiers.

    Par exemple, [intlist_of_line "43 4 5"] vaut [[43; 4; 5]]
*)
val intlist_of_line : string -> int list

(** Si [filename] est un fichier dont chaque ligne
    est une succession d'entiers séparés par des espaces,
    [get_intlist filename] est la liste des lignes du fichier,
    toutes stockées comme des [int list]
*)
val get_intlist : string -> int list list

(** [intarry_of_line] transforme une string contenant
    des entiers séparés par des espaces en le tableau
    de ces entiers.

    Par exemple, [intarray_of_line "43 4 5"] vaut [[|43; 4; 5|]]
*)
val intarray_of_line : string -> int array

(** Si [filename] est un fichier dont chaque ligne
    est une succession d'entiers séparés par des espaces,
    [get_intarray filename] est la liste des lignes du fichier,
    toutes stockées comme des [int array]
*)
val get_intarray : string -> int array list