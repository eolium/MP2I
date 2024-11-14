(* Exemples plus avancés *)

(** Renvoie x^n (avec n >= 0) *)
let rec exp_rap x n =
  if n > 0 then
    let x_p = exp_rap x (n/2) in (* x puissance p avec p = n/2 *)
    if n mod 2 = 0 then x_p *. x_p else x *. x_p *. x_p
  else
    1.



(** Somme des entiers jusqu'à n inclus *)
let somme_entiers n =
  let rec boucle somme i =
    if i <= n then 
      boucle (somme+i) (i+1) 
    else 
      somme
  in
  boucle 0 0


(** Renvoie k parmi n *)
let rec binom n k =
  if k = 0 || k = n then 
    1 
  else
    ( binom (n-1) k ) + ( binom (n-1) (k-1) )


(* main *)

let _ =
  let x = 2.0 in
  let n = 4 in
  let _ = Printf.printf "%f^%d = %f\n" x n (exp_rap x n) in

  let n = 5 in
  let _ = Printf.printf "1+2+...+%d = %d\n" n (somme_entiers n) in

  let _ = Printf.printf " binom 3 2 = %d\n" (binom 3 2) in
  Printf.printf " binom 5 2 = %d\n" (binom 5 2)
