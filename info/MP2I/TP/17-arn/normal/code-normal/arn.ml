(*           Implémentation des arbres rouges noirs           *)
(* Sujet à trous version Normal *)



(* Rappel : la documentation est dans l'interface. *)



type couleur =  Rouge 
              | Noir

type 'a arn =  Nil
             | Node of couleur * 'a arn * 'a * 'a arn



(* Initialisateurs *)

let empty () = 
  Nil


(* Accès aux attributs / propriétés *)


(* Propriétés d'un noeud*)

let etiquette = function
  | Node (_,_,x,_) -> x
  | _ -> failwith "etiquette Nil"

let gauche = function
  | Node(_, g,_, _) -> g
  | _ -> failwith "gauche Nil"

let droite = function
  | Node(_, _, _, d) -> d
  | _ -> failwith "droite Nil"

let est_rouge = function
  | Nil -> false (* les feuilles sont Noires *)
  | Node(c, _, _, _) -> c = Rouge

let est_noir = function
  | Nil -> true (* les feuilles sont Noires *)
  | Node(c, _, _, _) -> c = Noir


(* Propriétés d'un arbre *)

let rec hauteur = function
  | Nil -> -1
  | Node(_, g, _, d) -> 1 + (max (hauteur g) (hauteur d))
  
(* Petite technicité : notre hauteur est définie par
   le nb d'arêtes, et notre hauteur_noire par un nb de noeuds.
   D'où les initialisations différentes. *)

let rec hauteur_noire = function
  | Nil -> 0
  | Node (Rouge, g, _, d) -> max (hauteur g) (hauteur d)
  | Node (Noir, g, _, d) -> 1 + max (hauteur g) (hauteur d)

let rec recherche x t =
  match t with
  | Nil -> failwith "recherche sur nil"
  | Node(_, g, e, d) -> x = e || (recherche x g) || (recherche x d)

  
let rec minimum = function
  | Nil -> failwith "minimum sur nil"
  | Node(_, Nil, e, _) -> e
  | Node(_, g, _, _) -> minimum g
  
let rec maximum = function
  | Nil -> failwith "maximum sur nil"
  | Node(_, _, e, Nil) -> e
  | Node(_, _, _, d) -> minimum d


(* Transformateurs *)


(* Recoloriages *)

let devient_rouge = function
  | Nil -> failwith "devient_rouge Nil"
  | Node (_, g, x, d) -> Node(Rouge, g, x, d)

let devient_noir = function
  | Nil -> failwith "devient_noir Nil"
  | Node (_, g, x, d) -> Node(Noir, g, x, d)


(* Rotations *)

(* Notations :
           y                          x
          / \         droite         / \
         x   c        ----->        a   y
        / \           <-----           / \
       a   b	        gauche          b   c    
*)

let rotation_droite t = match t with
  | Node (y_c, Node (x_c, a, x, b), y, c) -> Node(x_c, a, x, Node(y_c, b, y, c))
  | _ -> failwith "rot gauche sur arbre vide ou vide à droite"

let rotation_gauche t = match t with
  | Node (col_x, a, x, Node (col_y, b, y, c)) ->
      Node (col_y, Node (col_x, a, x, b), y, c)
  | _ -> failwith "rot gauche sur arbre vide ou vide à droite"



(* Transformateurs *)


(* Insertion *)

let corrige_rouge t = match t with
  | Node (
    Rouge,
    Node (
      Rouge,
      Node (
        Rouge,
        alpha,
        x,
        beta
      ),
      y,
      gamma
    ),
    z,
    delta)

  | Node (
    Noir,
    alpha,
    x,
    Node (
      Rouge,
      beta,
      y,
      Node (
        Rouge,
        gamma,
        z,
        delta)
    )
  )

  | Node (
    Noir,
    Node (
      Rouge,
      alpha,
      x,
      Node (
        Rouge,
        beta,
        y,
        gamma
      )
    ),
    z,
    delta
  )

  | Node (
    Noir,
    alpha,
    x,
    Node (
      Rouge,
      Node (
        Rouge,
        beta,
        y,
        gamma
      ),
      z,
      delta
    )
  )

  -> Node (
    Rouge,
    Node (
      Noir,
      alpha,
      x,
      beta
    ),
    y,
    Node (
      Noir,
      gamma,
      z,
      delta
    )
  )

  | _ -> t

let rec insere_aux x t = match t with
  | Nil -> Node(Rouge, Nil, x, Nil)
  | Node (col_y, g, y, d) ->
      if x = y (* x est déjà présent *)
      then t
      else if x < y (* on doit insérer à gauche *)
      then corrige_rouge (Node (col_y, insere_aux x g, y, d))
      else (* on doit insérer à droite *)
           corrige_rouge (Node (col_y, g, y, insere_aux x d))


let insere x t =
  devient_noir (insere_aux x t)