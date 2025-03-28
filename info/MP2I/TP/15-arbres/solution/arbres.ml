type 'a tree = 
    Nil 
  | Node of 'a tree * 'a * 'a tree


let arbre_exemple = Node( Node(Node(Nil, 5, Nil), 
                          3, 
                          Node(Nil, 7, Nil) ), 
                    42, 
                    Node(Nil, 24, Nil) )



(* Partie A.1 *)

let rec peigne_gauche h =
  if h >= 0 then 
    Node (peigne_gauche (h-1), h, Nil)
  else Nil


let peigne_bonus h =
  
  (** Construit le peigne p..h *)
  let rec construit p =
    if p <= h then 
      Node (construit (p+1), p, Nil)
    else
      Nil
  in

  construit 0


let rec parfait h =
  if h >= 0 then
    let sousarbre = parfait (h-1) in
    Node (sousarbre, h, sousarbre)
  else
    Nil



(* Partie A.2 *)

let rec taille t =
  match t with
  | Nil -> 0
  | Node (g, _, d) -> 1 + (taille g) + (taille d)


let rec hauteur t =
  match t with
  | Nil -> -1
  | Node (g, _, d) -> 1 + max (hauteur g) (hauteur d)


let rec somme it =
  match it with
  | Nil -> 0
  | Node (g,x,d) -> x + (somme g) + (somme d)



(* Partie A.3 *)

let rec ordre_prefixe t =
  match t with
  | Nil -> []
  | Node (g, x, d) -> x :: ((ordre_prefixe g) @ (ordre_prefixe d))


let rec ordre_infixe t =
  match t with
  | Nil -> []
  | Node (g, x, d) -> (ordre_infixe g) @ [x] @ (ordre_infixe d)


let rec ordre_postfixe t =
  match t with
  | Nil -> []
  | Node (g, x, d) -> (ordre_postfixe g) @ (ordre_postfixe d) @ [x]


let prefixe_bonus tree =

  (** Agrandit la liste lst en y ajoutant en tête le
      parcours préfixe de t *)
  let rec agrandit lst t =
    match t with
    | Nil -> lst
    | Node (g, x, d) -> 
        let droite = agrandit lst d in
        let gauchedroite = agrandit droite g in
        x :: gauchedroite
  in

  agrandit [] tree


let infixe_bonus tree =
  (** Agrandit la liste lst en y ajoutant en tête le
      parcours infixe de t *)
  let rec agrandit lst t =
    match t with
    | Nil -> lst
    | Node (g, x, d) -> 
        let droite = agrandit lst d in
        let xdroite = x::droite in
        agrandit xdroite g
  in
  agrandit [] tree


let postfixe_bonus tree =
  (** Agrandit la liste lst en y ajoutant en tête le
      parcours postfixe de t *)
  let rec agrandit lst t =
    match t with
    | Nil -> lst
    | Node (g, x, d) -> 
        let droitex = agrandit (x::lst) d in
        agrandit droitex g
  in
  agrandit [] tree



(* Partie A.4 *)

let rec est_strict t =
  match t with
  | Nil -> false
  | Node (Nil, _, Nil) -> true
  | Node (g, _, d) -> est_strict g && est_strict d


let rec est_parfait t =
  match t with
  | Nil -> true
  | Node (g, _, d) -> est_parfait g && est_parfait d 
                      && hauteur g = hauteur d


let rec est_parfait_bonus tree =
  
  (** Renvoie une paire (est_parfait, h).
      Si est_parfait = true, h vaut la hauteur.
      Sinon, il peut valoir tout et n'importe quoi. *)
  let rec parf_haut t =
    match t with
    | Nil -> (true, -1)
    | Node (g, _, d) ->
        let parf_g, h_g = parf_haut g in
        if not parf_g then (false, -1) else
        let parf_d, h_d = parf_haut d in
        (parf_d && h_g = h_g , 1 + max h_g h_d)
  in

  fst (parf_haut tree)



(* Partie B *)

type 'a arbre =
    Nil_k
  | Node_k of 'a * 'a arbre list


let rec hauteur_k a =
  match a with
  | Nil_k -> -1
  | Node_k (_, enfants) ->
      let h_enf = List.map hauteur_k enfants in
      List.fold_left max (-1) h_enf


(* L'exemple de cours pour lcrs *)
let test_lcrs = 
  let leaf etq = Node_k (etq, []) in
  let a0 = Node_k (2, [leaf 5; leaf 6; leaf 7]) in
  let a1 = Node_k (3, [leaf 8]) in
  let a2 = Node_k (4, [leaf 9; Node_k (10, [leaf 13; leaf 14]);
                        leaf 11; leaf 12])
  in
  Node_k (1, [a0; a1; a2])

(* La verison transformée de l'ex de cours *)
let output_lcrs =
  let peigne_droit lst =
    List.fold_right (fun x t -> Node (Nil, x, t)) lst Nil in
  let b2 =
    Node ( Node (Nil, 
                 9, 
                 Node (peigne_droit [13; 14], 
                       10, 
                       peigne_droit [11; 12])
                ), 
          4, 
          Nil)
  in
  let b1 = Node (Node (Nil, 8, Nil), 3, b2) in
  let b0 = Node (peigne_droit [5; 6; 7], 2, b1) in
  Node (b0, 1, Nil)

let rec lcrs_aux noeud adelphes =
  let transfo_adelphes =
    match adelphes with
    | [] -> Nil
    | t::q -> lcrs_aux t q
  in 
  match noeud with
  | Nil_k -> Nil
  | Node_k(x, []) -> Node (Nil, x, transfo_adelphes)
  | Node_k(x, enf_g::enf_autres) ->
    let transfo_enfants = lcrs_aux enf_g enf_autres in
    Node (transfo_enfants, x, transfo_adelphes)

let transfo_LCRS noeud = lcrs_aux noeud []


let rec srcl_aux noeud =
  match noeud with
  | Nil -> []
  | Node (g, x, d) ->
    let adelphes_x = srcl_aux d in
    let enf_autres = srcl_aux g in
    Node_k (x, enf_autres) :: adelphes_x

let rec srcl arbre =
  match srcl_aux arbre with
  | [] -> Nil
  | [racine] -> racine
  | _ -> raise (Invalid_argument "srcl impossible")


let _ = Printf.printf "%b\n" (transfo_LCRS test_lcrs = output_lcrs)

let _ = Printf.printf "%b\n" (srcl output_lcrs = test_lcrs)