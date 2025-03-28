(* Ce fichier contient des exemples d'ARN *)

(* En mode compilé,
   il faut garder cette ligne. 
   En mode interpreté, enlevez-la. *)
open Arn


(* Fonctions auxiliaires utiles *)
let feuille_rouge x = 
  Node (Rouge, Nil Noir, x, Nil Noir)

let feuille_noire x =
  Node (Noir, Nil Noir, x, Nil Noir)


(* Quelques arbres choisis de mes propres deboguages *)
let arn_ex_gauche = 
  Node (Rouge, Node (Noir, Nil Noir, -1, Nil Noir),
               2,
               Node (Noir, Node (Rouge, Nil Noir, 5, Nil Noir),
                           7,
                           Node (Rouge, Nil Noir, 8, Nil Noir)
                    )
      )
let arn_ex =
  Node (Noir, arn_ex_gauche,
              11,
              Node (Noir, Nil Noir,
                          14,
                          Node (Rouge, Nil Noir, 15, Nil Noir)
                  )
      )

let u =
  Node (Noir,
    Node (Noir, Node (Rouge, Nil Noir, 1, Nil Noir), 2,
    Node (Rouge, Nil Noir, 3, Nil Noir)),
    4, Node (Noir, Nil Noir, 5, Nil Noir))
  
let v = 
  Node (Noir, Node (Noir, Nil Noir, 1, Node (Rouge, Nil Noir, 2, Nil Noir)), 3, Node (Noir, Nil Noir, 4, Nil Noir))


let corrigible = (* a un enfant presque correct en Rouge *)
  Node (Noir, Nil Noir, 20, Node (Rouge, Nil Noir, 30, Node (Rouge, Nil Noir, 40, Nil Noir)))


(* Des cas d'insertion *)
let ex_ins_cas1 = 
  (* bh = 1 *)
  Node (Noir, Node (Rouge, Nil Noir, 20, Node (Rouge, Nil Noir, 25, Nil Noir)), 50, Node (Rouge, Nil Noir, 100, Nil Noir))

let ex_ins_cas2a = 
  (* bh = 1 *)
  Node (Noir, Node (Rouge, Node(Rouge, Nil Noir, 0, Nil Noir),
                           10,
                           Nil Noir
                    ),
              20,
              Nil Noir
        )

let cas2b =
  (* bh = 1 *)
   Node (Noir, Node (Rouge, Nil Noir, 0, Node(Rouge, Nil Noir, 5, Nil Noir)), 10, Nil Noir)

let ex_ins_cas3a = 
  (* bh = 1 *)
  Node (Noir, Nil Noir, 
              10,
              Node (Rouge, Node (Rouge, Nil Noir, 15, Nil Noir),
                            20,
                            Nil Noir
                    )
        )

let ex_ins_cas3b =
  (* bh = 1 *)
   Node (Noir, Nil Noir,
               10,
               Node (Rouge, Nil Noir,
                            15,
                            Node (Rouge, Nil Noir, 20, Nil Noir)
                    )
        )



(* Des cas de suppression *)

let ex_suppr_cas1a col_p =
  (* bh = 2 ou 3 selon col_p *)
  let f = Node (Noir, Node (Noir, Nil Noir, 15, Nil Noir), 20, Node (Noir, Nil Noir, 25, Nil Noir))
  in
  Node (col_p, Node (Doublenoir, Nil Noir, 0, Nil Noir), 10, f)

let ex_suppr_cas1b col_p =
  (* bh = 2 ou 3 selon col_p *)
  let f = Node (Noir, Node (Rouge, feuille_noire 12, 15, feuille_noire 17), 20, Node (Rouge, feuille_noire 22, 25, feuille_noire 27)) 
  in
  Node (col_p, Node (Doublenoir, Nil Noir, 0, Nil Noir), 10, f)

let ex_suppr_cas1c col_p = 
  (* bh = 2 ou 3 selon col_p *)
  let f = Node (Noir, Node (Rouge, feuille_noire 12, 15, feuille_noire 17), 20, Node (Noir, Nil Noir, 25, Nil Noir))
  in
  Node (col_p, Node (Doublenoir, Nil Noir, 0, Nil Noir), 10, f)

let ex_suppr_cas3a col_p =
  (* bh = 2 ou 3 selon col_p *)
  let f = Node (Noir, Node (Noir, Nil Noir, 15, Nil Noir), 20, Node (Noir, Nil Noir, 25, Nil Noir))
  in
  Node (col_p, f, 50, Node (Doublenoir, Nil Noir, 60, Nil Noir))

let ex_suppr_cas3b col_p =
  (* bh = 2 ou 3 selon col_p *)
  let f = Node (Noir, Node (Rouge, feuille_noire 12, 15, feuille_noire 17), 
                      20, 
                      Node (Rouge, feuille_noire 22, 25, feuille_noire 27)
                )
  in
  Node (col_p, f, 50, Node (Doublenoir, Nil Noir, 60, Nil Noir))

let ex_suppr_cas3c col_p =
  let f = Node (Noir, Node (Noir, Nil Noir, 10, Nil Noir), 
                      15,
                      Node (Rouge, feuille_noire 17, 20, feuille_noire 22)
                )
  in
  Node (col_p, f, 50, Node (Doublenoir, Nil Noir, 60, Nil Noir))



(* Petit cadeau bonus pour vous aider à débuguer : une fonction qui teste si un ARN d'entiers est bel et bien un sous-arbre RN correct ;) *)
let est_int_arn t =
  let rec aux mini maxi = function
    | Nil col -> (col = Noir), 0
    | Node (col, g, x, d) ->
        if not (mini < x && x < maxi)
        then false, 0
        else if col = Rouge && (est_rouge g || est_rouge d)
                || col = Doublenoir
        then false, 0
        else 
        (* sinon, on vérifie que arn à gauche,
           arn à droite, et que les hauteurs Noires sont les mêmes
           NB : optimisable en n'explorant pas à droite si la gauche
           n'est pas un ARN. *)
        let bool_g, bh_g = aux mini x g in
        let bool_d, bh_d = aux x maxi d in
        let bool_node = bool_g && bool_d && bh_g = bh_d in
        if not bool_node then false,0
        else if col = Rouge then true, bh_g
        else true, (1+bh_g)
  in
  fst (aux Int.min_int Int.max_int t)

(* Deuxième petit cadeau : génère un tableau d'entiers aléatoires.
   Utile pour générer de gros tests sur des valeurs aléatoires.*)
let big_random_array n =
  Random.self_init ();
  Array.init n (fun n -> Random.full_int Int.max_int)