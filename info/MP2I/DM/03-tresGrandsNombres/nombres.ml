(* Adapté de TP algo ENS 2017 *)
open Suites


(***************************)
(* Le type et les exemples *)
(***************************)


(** Le type proposé par l'énoncé.
    Notez qu'un noeud a trois enfants et aucune étiquettes. *)
type inttree =
  | Zero
  | Un
  | Node of inttree * inttree * inttree (* g, p, d *)


(* L'exemple de l'énoncé et ses sous-arbres.
   Très utile pour tester !
*)
let      deux = Node (Zero, Zero, Un)
let     trois = Node (Un, Zero, Un)
let cinquante = Node (deux, deux, trois)
let    ex_818 = Node (cinquante, trois, trois)



(***************************)
(* Fonctions de conversion *)
(***************************)

(** [eval tree] est l'entier encodé par [tree] *)
let rec eval tree =
  match tree with
  | Zero -> 0
  | Un -> 1
  | Node(g, p, d) -> (eval g) + (x (eval p)) * (eval d)
  

let rec log2 x =
  match x with
  | 1 -> 0
  | _ -> 1 + log2 (x / 2)

(** [trouve_p n] vaut la valeur de p dans le triplet (g, p, d)
    correspondant à [n] *)
let trouve_p n =
  log2 (log2 n)
  

(** [of_int n] est l'arbre ternaire associé à [n] *)
let rec of_int n =
  match n with
  | 0 -> Zero
  | 1 -> Un
  | 2 -> Node (Zero, Zero, Un)
  | 3 -> Node (Un, Zero, Un)
  | _ ->
    let p = trouve_p n in
    let a = x p in
    let d = n / a in
    let g = n mod a in

    Node(of_int g, of_int p, of_int d)


(***************************)
(* Signature et générateur *)
(***************************)

(** [signature tree] est la signature de tree *)
let rec signature tree =
  match tree with
  | Zero -> 0
  | Un -> (u 10) mod 97
  | Node (g, p, d) ->
    if (eval p) mod 2 = 0 then
      (signature g + (u 30) * signature d) mod 97
    else
      (signature g + (u 20) * signature d) mod 97


let sig_v k n =
  signature (of_int (v k n))


let sig_h k =
  let valeur = of_int (h (v k (7*k))) in

  match valeur with
  | Zero -> 0
  | Un -> (u 10)
  | Node(g, p, d) ->
    (signature g + (u 30) * signature d) mod 97


let rec sig_gen_aux k n =
  let u_n = u n in

  if k = 0 then
    if u_n mod 7 = 0 then
      0
    else
      1
  else
    let kp = max 0 (k-1-(u_n mod 2)) in
    let g = sig_gen_aux kp ((n+1) mod 997) in
    let p = v kp n in
    let d = sig_gen_aux kp ((n+2) mod 997) in

    if d = 0 then
      g
    else
      g + (x p) * d

let sig_gen k n =
  sig_gen_aux k n


let _ = Printf.printf "%d\n" (sig_gen 6 35)

(*******************)
(** Décrémentation *)
(*******************)

let sig_dec_gen k =
  failwith "TODO"


(*******************)
(** Incrémentation *)
(*******************)

let sig_inc_gen k =
  failwith "TODO"