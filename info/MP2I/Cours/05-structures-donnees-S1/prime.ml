(* Des exemples de pourquoi les listes c'est bien *)

(** Construit la liste des diviseurs positifs et >=k de n .
  * On suppose n >= 0 . *)
let rec construit_lst_diviseurs n k =
  if k > n then 
    []
  else if n mod k = 0 then
    k :: (construit_lst_diviseurs n (k+1))
  else 
    construit_lst_diviseurs n (k+1)


(** Renvoie la liste des diviseurs positifs de n .
  * On suppose n >= 0 . *)
let lst_diviseurs n =
  construit_lst_diviseurs n 1


(** Teste si un nombre positif est premier *)
let est_premier n =
  List.length (lst_diviseurs n) = 2
  (* maths : un nombre est premier SSI il a exactement deux diviseurs *)


(** Renvoie la liste des nombres premiers >= k et <= n .*)
let rec construit_lst_premiers n k =
  if k > n then 
    []
  else if est_premier k then
    k :: (construit_lst_premiers n (k+1))
  else
    construit_lst_premiers n (k+1)


(** Renvoie la liste des nombres premiers <= n .*)
let lst_premiers n =
  construit_lst_premiers n 1


(* La méthode de lst_premiers est la suivant : 
   pour chaque nombre k, tester s'il est premier en O(k).
   Ainsi, elle est en O(n²) . On peut faire mieux !

   Je présente ici une écriture OCaml du crible d'Erathostène.
   N'hésitez pas à me demander si c'est incompréhensible
   (ou si vous ne reconnaissez pas le crible).
 *)

(** Renvoie la liste des nombres premiers <= n.
  * Applique la méthode du crible d'Erathostène. *)
let better_lst_premiers n =

  if n < 2 then [] else

  (** Construit la liste des nombres premiers <= n par la méthode du crible.
    * k est un entier, et lst la liste des premiers < k. *)
  let rec crible k lst =
    if k > n then
      lst
    else if List.exists (fun p -> k mod p = 0) lst then
      (* alors k n'est pas premier car il existe un premier qui le divise *)
      crible (k+1) lst
    else
      (* k n'est divisé par aucun premier, il est donc premier*)
      crible (k+1) (k::lst)
  in

  (* cette méthode construit la liste par ordre décroissant, 
     je la renverse donc pour que ce soit joli *)
  List.rev (crible 2 [])