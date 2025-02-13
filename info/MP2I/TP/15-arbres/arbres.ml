(* Structure *)
type 'a tree = 
		Nil 
	| Node of 'a tree * 'a * 'a tree


(* Constructeurs *)
let rec peigne_gauche h =
	if h = 0 then Nil else

		Node(peigne_gauche (h-1), h, Nil)

let rec peigne_gauche_aux h h_max =
	if h = h_max then Nil else

		Node (peigne_gauche_aux (h+1) h_max, h, Nil)

let peigne_gauche_bonus h = peigne_gauche_aux 0 h

let rec parfait h =
	if h = 0 then Nil else
	let ss_arbre = parfait (h-1) in
	Node (ss_arbre, h, ss_arbre)

(* Grandeurs *)
let rec taille arbre =
	match arbre with
	| Nil -> 0
	| Node (g, _, d) -> 1 + (taille g) + (taille d)
	
let rec hauteur arbre =
	match arbre with
	| Nil -> 0
	| Node (g, _, d) -> 1 + max (hauteur g) (hauteur d)
	
let rec somme arbre =
	match arbre with
	| Nil -> 0
	| Node (g, e, d) -> e + (somme g) + (somme d)


(* Recherches *)
let rec ordre_prefixe arbre =
	match arbre with
	| Nil -> []
	| Node (g, e, d) -> e:: ((ordre_prefixe g) @ (ordre_prefixe d))

let rec ordre_infixe arbre =
	match arbre with
	| Nil -> []
	| Node (g, e, d) -> (ordre_infixe g) @ ([e] @ (ordre_infixe d))

let rec ordre_postfix arbre =
	match arbre with
	| Nil -> []
	| Node (g, e, d) -> (ordre_postfix g) @ ((ordre_postfix d) @ [e])


(* Arbres particuliers *)
let rec est_strict arbre =
	match arbre with
	| Nil -> true
	| Node (_, _, Nil)
	| Node (Nil, _, _) -> false
	| Node (g, _, d) -> (est_strict g) && (est_strict d)

let rec est_parfait arbre =
	match arbre with
	| Nil -> true
	| Node (g, _, d) -> hauteur g = hauteur d && (est_parfait g) && (est_parfait d)


(* Arbres d'arité quelconque*)

type 'a arbre = Nil_b | Node_b of 'a * 'a arbre list

let rec list_max lst =
	match lst with
	| [] -> 0
	| t::q -> max t (list_max q)

let rec hauteur_arbre arbre =
	match arbre with
	| Nil_b -> 0
	| Node_b (e, lst) -> list_max (List.map hauteur_arbre lst)

let rec transfo_LCRS arbre =
	match arbre with
	| Nil_b -> Nil
	| Node_b (e, lst) -> match lst with
		| t::q -> Node(transfo_LCRS t, e, transfo_LCRS (Node_b e q))