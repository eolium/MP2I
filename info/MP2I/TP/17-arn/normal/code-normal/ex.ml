(* Ce fichier contient des exemples d'ARN *)

(* En mode compilé,
   il faut garder cette ligne. 
   En mode interpreté, enlevez-la. *)
open Arn


(* Fonctions auxiliaires utiles pour faire des exemples *)
let feuille_rouge x = 
  Node (Rouge, Nil, x, Nil)

let feuille_noire x =
  Node (Noir, Nil, x, Nil)


(* Quelques arbres choisis de mes propres deboguages *)
let arn_ex_gauche = 
  Node (Rouge, Node (Noir, Nil, -1, Nil),
               2,
               Node (Noir, Node (Rouge, Nil, 5, Nil),
                           7,
                           Node (Rouge, Nil, 8, Nil)
                    )
      )
let arn_ex =
  Node (Noir, arn_ex_gauche,
              11,
              Node (Noir, Nil,
                          14,
                          Node (Rouge, Nil, 15, Nil)
                  )
      )

let u =
  Node (Noir,
    Node (Noir, Node (Rouge, Nil, 1, Nil), 2,
    Node (Rouge, Nil, 3, Nil)),
    4, Node (Noir, Nil, 5, Nil))
  
let v = 
  Node (Noir, Node (Noir, Nil, 1, Node (Rouge, Nil, 2, Nil)), 3, Node (Noir, Nil, 4, Nil))


let corrigible = (* a un enfant presque correct en Rouge *)
  Node (Noir, Nil, 20, Node (Rouge, Nil, 30, Node (Rouge, Nil, 40, Nil)))


(* Des cas d'insertion *)
let ex_ins = 
  (* bh = 1 *)
  Node (Noir, Node (Rouge, Nil, 20, Node (Rouge, Nil, 25, Nil)), 50, Node (Rouge, Nil, 100, Nil))

let ex_ins_bis = 
  (* bh = 1 *)
  Node (Noir, Node (Rouge, Node(Rouge, Nil, 0, Nil),
                           10,
                           Nil
                    ),
              20,
              Nil
        )

let ex_ins_ter =
  (* bh = 1 *)
   Node (Noir, Node (Rouge, Nil, 0, Node(Rouge, Nil, 5, Nil)), 10, Nil)

let ex_ins_quat = 
  (* bh = 1 *)
  Node (Noir, Nil, 
              10,
              Node (Rouge, Node (Rouge, Nil, 15, Nil),
                            20,
                            Nil
                    )
        )

let ex_ins_quint =
  (* bh = 1 *)
   Node (Noir, Nil,
               10,
               Node (Rouge, Nil,
                            15,
                            Node (Rouge, Nil, 20, Nil)
                    )
        )



(* Petit cadeau bonus pour vous aider à débuguer : une fonction qui teste si un ARN d'entiers est bel et bien un sous-arbre RN correct *)
let est_int_arn t =
  let rec aux mini maxi = function
    | Nil -> true, 0
    | Node (col, g, x, d) ->
        if not (mini < x && x < maxi)
        then false, 0
        else if col = Rouge && (est_rouge g || est_rouge d)
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

(* Deuxième petit cadeau : génère une liste d'entiers aléatoires.
   Utile pour générer de gros tests sur des valeurs aléatoires.*)
let big_random_array n =
  Random.self_init ();
  List.init n (fun n -> Random.full_int Int.max_int)