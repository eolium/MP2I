(*           Implémentation des arbres rouges noirs           *)
(* Sujet à trous version Étoile (sujet étoile) *)



(* Rappel : la documentation est dans l'interface. *)



type couleur =  Rouge 
              | Noir 
              | Doublenoir (* état temporaire de la suppression *)

type 'a arn =  Nil of couleur (* Noires sauf temporairement 
                                 durant la suppression *)
             | Node of couleur * 'a arn * 'a * 'a arn



(* Initialisateurs *)

let empty () = 
  Nil Noir


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
  | Nil _ -> false (* les feuilles sont Noires *)
  | Node(c, _, _, _) -> c = Rouge

let est_noir = function
  | Nil _ -> true (* les feuilles sont Noires *)
  | Node(c, _, _, _) -> c = Noir

let est_doublenoir = function
  | Node(col, _, _, _) -> col = Doublenoir
  | Nil _ -> failwith "est_doublenoir sur nil"


(* Propriétés d'un arbre *)

let rec hauteur = function
  | Nil _ -> -1
  | Node(_, g, _, d) -> 1 + (max (hauteur g) (hauteur d))

(* Petite technicité : notre hauteur est définie par
   le nb d'arêtes, et notre hauteur_noire par un nb de noeuds *)

let rec hauteur_noire = function
  | Nil Noir -> 0
  | Nil Doublenoir -> 1
  | Nil Rouge -> failwith "hauteur_noire : Nil Rouge"
  | Node (Rouge, g, _, _) -> failwith "TODO"
  | Node (Noir, g, _, _) -> failwith "TODO"
  | Node (Doublenoir, g, _, _) -> failwith "TODO"

let rec hauteur_noire = function
  | Nil _ -> 0
  | Node (Rouge, g, _, d) -> max (hauteur g) (hauteur d)
  | Node (Noir, g, _, d) -> 1 + max (hauteur g) (hauteur d)

let rec recherche x t =
  match t with
  | Nil -> "recherche sur nil"
  | Node(_, g, e, d) -> x = e || (recherche x g) || (recherche x d)
  | _ -> false

  
let rec minimum t = function
  | Nil -> failwith "minimum sur nil"
  | Node(_, Nil, e, _) -> e
  | Node(_, g, _, _) -> minimum g
  
let rec maximum t = 
  | Nil -> failwith "maximum sur nil"
  | Node(_, _, e, Nil) -> e
  | Node(_, _, _, d) -> minimum d



(* Transformateurs *)


(* Recoloriages *)

let devient_rouge = function
  | Nil _ -> failwith "devient_rouge Nil"
  | Node (_, g, x, d) -> failwith "TODO"

let devient_noir = function
  | Nil _-> failwith "devient_noir Nil"
  | Node (_, g, x, d) -> failwith "TODO"

let noircir = function
  | Nil Noir-> Nil Doublenoir
  | Nil _ -> failwith "noircir Nil non-noir"
  | Node (Doublenoir,_, _,_) -> failwith "noircit Doublenoir"
  | _ -> failwith "TODO"

let eclaircir = function
  | Nil Doublenoir -> Nil Noir
  | Nil _ -> failwith "eclaircir Nil non-Dn"
  | Node (Rouge, g, x, d) -> failwith "eclaircir Rouge"
  | _ -> failwith "TODO"


(* Rotations *)

(* Notations :
           y                          x
          / \         droite         / \
         x   c        ----->        a   y
        / \           <-----           / \
       a   b	        gauche          b   c    
*)

let rotation_droite t =
  failwith "TODO" 

let rotation_gauche t = match t with
  | Node (col_x, a, x, Node (col_y, b, y, c)) ->
      Node (col_y, Node (col_x, a, x, b), y, c)
  | _ -> failwith "rot gauche sur arbre vide ou vide à droite"



(* Transformateurs *)


(* Insertion *)

(* Rappel : les notations sont dans l'interface-énoncé *)

let ins_cas1 = function
  (* Cas 1 : p et f sont rouges. *)
  | Node (Noir, p, pp, f) -> failwith "TODO"
  | _ -> failwith "insertion cas1"

(* Dans les cas2, p est rouge et à gauche, et f noir et à droite. 
   Les cas avec p à droite et f à gauche seront appelés cas3 *)

  let ins_cas2a t =
  (* Cas2a : x est fils gauche de p. *)
  failwith "TODO"

let ins_cas2b t =
  (* Cas 2b : x est fils droit de p. On se ramène au cas prec. *)
  failwith "TODO"

(* Dans les cas 3, f est noir et à gauche, et p est rouge et à droite *)

let ins_cas3a t = match rotation_gauche t with
  (* Cas 3a : x est fils droit de p. *)
  | Node (Rouge, pp, p, x) -> Node (Noir, devient_rouge pp, p, x)
  | _ -> failwith "insertion cas3a"

let ins_cas3b = function
  (* Cas 3b : x est fils gauche de p. On se ramène au cas prec. *)
    | Node (Noir, f, pp, p) ->
      ins_cas3a (Node (Noir, f, pp, rotation_droite p))
    | _ -> failwith "insertion cas3b"


let corrige_rouge t = 
  (* On utilise les fonctions auxiliaires précédentes :
   détermine le cas et appelle la bonne fonction.
   Faire des schémas !!
  *)
  match t with
  (* Cas 1. p et f sont rouges, et l'un des deux a un enfant rouge.
     Cette rédaction couvre p est à gauche et p à droite =) *)
  | Node (Noir, Node (Rouge, a, _, b), _, Node (Rouge, c, _, d)) 
    when est_rouge a || est_rouge b || est_rouge c || est_rouge d 
    -> failwith "TODO"
  (* Cas2. Remarquez que p est à gauche de pp.
     Remarquez aussi que si [est_rouge p] alors p n'est pas Nil. *)
  | _ -> failwith "TODO"
  (* Cas 3. Remarquez que p est à droite de pp.
     Même rmq sur [est_rouge p] *)
  | Node (Noir, f, pp, p)
    when est_rouge p && est_noir f && est_rouge (droite p)
    -> ins_cas3a t
  | Node (Noir, f, pp, p)
    when est_rouge p && est_noir f && est_rouge (gauche p)
    -> ins_cas3b t
  (* Sinon : pas de problème ! Youpi !*)
  | _ -> t

let rec insere_aux x t = match t with
  | Nil Noir -> failwith "TODO"
  | Nil _ -> failwith "insere_aux : Nil non-noir"
  | Node (col_y, g, y, d) ->
      if x = y (* x est déjà présent *)
      then t
      else if x < y (* on doit insérer à gauche *)
      then corrige_rouge (Node (col_y, insere_aux x g, y, d))
      else (* on doit insérer à droite *)
           corrige_rouge (Node (col_y, g, y, insere_aux x d))

(* On va garantir (4) : cela traite le problème éventuel
   de l'enchainement de Rouges à la racine *)
let insere x t =
  failwith "TODO"


(* Suppression *)

(* Rappel : les notations sont dans l'interface-énoncé *)

let suppr_casfNil = function
  (* Cas impossible sinon la ppté (2) est rompue ! *)
  | _ -> failwith "TODO"

(* Dans les cas 1, [x] est fils gauche et [f] est noir.
   Les cas avec [x] à droite seront appelés cas 3 et 4 *)

let suppr_cas1a = function
  (* Cas1a : si [g] et [d] sont noirs. *)
  | Node (col_p, x, p, f) ->
      noircir (Node (col_p, eclaircir x, p, eclaircir f))
  | _ -> failwith "suppression cas1a"

let suppr_cas1b t =
  (* Cas1b : si [d] est rouge *)
  failwith "TODO"

let suppr_cas1c t =
  (* Cas1c : si [g] est rouge et [d] est noir *)
  failwith "TODO"

(* Dans les cas3, [x] est fils droit et [f] est noir.
   NB : le cas 2 est avec le cas 4 plus loin. *)

let suppr_cas3a = function
  (* Cas3a : si [g] et [d] sont noirs. *)
  | Node (col_p, f, p, x) ->
      noircir (Node (col_p, devient_rouge f, p, eclaircir x))
  | _ -> failwith "suppression cas3a"

let suppr_cas3b t = match rotation_droite t with
  (* Cas3b : si [g] est rouge *)
  | Node (col_f, g, f, Node (col_p, d, p, x)) ->
      Node (col_p, devient_noir g, f, Node (Noir, d, p, eclaircir x))
  | _ -> failwith "suppression cas2b"

let suppr_cas3c = function
  (* Cas3c : si [g] est noir et [d] est rouge *)
  | Node (col_p, Node (Noir, g, f, d), p, x) ->
      begin match rotation_gauche (Node (Noir, g, f, d)) with
        | Node (col_d, f, d ,z) ->
            suppr_cas3b (Node (col_p, Node (Noir, devient_rouge f, d, z), p, x))
        | _ -> failwith "suppr_cas3c : rotg renvoie Nil"
      end
  | _ -> failwith "suppr_cas3c"


(* Les cas 2 et 4 sont particuliers car on ne se ramène pas
   à un cas précis : d'où la corecursion avec corrige_doublenoir, 
   qui est l'aiguillage vers les cas. *)

let rec suppr_cas2 t =
  (* Cas2 : [f] est rouge et à droite *)
  failwith "TODO"

and suppr_cas4 t = match rotation_droite t with
  (* Cas4 : [f] est rouge et à gauche *)
  | Node (col_f, g, f, p) ->
      let tmp_p = corrige_doublenoir (devient_rouge p) in
      Node (Noir, g, f, tmp_p)
  | _ -> failwith "suppr_cas4"

and corrige_doublenoir t =
  (* On aiguille sur les fonctions auxiliaires précédentes.
    À lire avec un schéma sous les yeux. *)
  match t with
    (* cas frère Nil *)
    | Node (_, x, _, Nil _) when est_doublenoir x	-> suppr_casfNil t
    | Node (_, Nil _, _, x) when est_doublenoir x -> suppr_casfNil t
    (* les cas 1 *)
    | Node (_, x, _, f) when est_doublenoir x && est_noir f -> 
          failwith "TODO"
    (* le cas 2 *)
    | _ -> failwith "TODO"
    (* les cas 3 *)
    | Node (col_p, f, p, x) when est_doublenoir x && est_noir f -> 
          let g,d = gauche f, droite f in
          if est_noir g && est_noir d
          then suppr_cas3a t
          else if est_rouge g
          then suppr_cas3b t
          else suppr_cas3c t
    (* le cas 4 *)
    | Node (_, _, _, x) when est_doublenoir x -> suppr_cas4 t
    (* Sinon pas de doublenoir ! Youpi ! *)
    | _ -> t




(** Supprime <x> de <t>.
  * Rétablit les propriétés d'ARN grâce aux deux
  * fonctions précédentes; sauf à la racine qui peut-être
  * Doublenoir. *)
let rec supprime_aux x = function
  | Nil Noir -> failwith "TODO"
  | Nil _ -> failwith "supprime_aux : Nil non-noir"
  (* si on a trouvé x : on le supprime directement si
     il n'a pas deux enfants. Sinon on a recourt
     à la ruse de sioux qui consiste à faire remonter
     le minimum à la place de x, et supprimer 
     le minimum d'origine qui lui n'a pas de fils gauche. *)
  | Node (col_y, g, y, d) when x = y ->
        if g = Nil Noir
        then begin
             if col_y = Rouge
             then d
             else noircir d
             end
        else if d = Nil Noir
        then begin
             if col_y = Rouge
             then g
             else noircir g
             end
        else (* Sinon : on remplace x par le min à droite
                et on va supprimer ce dernier. *)
             let m = minimum d in
             let tmp_d = supprime_aux m d in
             corrige_doublenoir (Node (col_y, g, m, tmp_d))
  (* Si on a pas trouvé x : on va le chercher pour le supprimer
     à gauche ou à droite. *)
  | Node (col_y, g, y, d) when x < y ->
        let tmp_g = supprime_aux x g in
        corrige_doublenoir (Node (col_y, tmp_g, y, d))
  | Node (col_y, g, y, d) -> (* x > y*)
        let tmp_d = supprime_aux x d in
        corrige_doublenoir (Node (col_y, g, y, tmp_d))

let supprime x t =
  failwith "TODO"