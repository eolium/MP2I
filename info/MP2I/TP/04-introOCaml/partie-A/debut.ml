(* Pour la partie A, complétez les déclarations ci-dessous *)

let x = 42
let y = x mod 4
let z = y*y*y

let pi_carre = 3.14**2.



(* Déclaration qui a pour effet secondaire d'afficher les variables.
   Vous comprendrez bientôt comment elle marde.
 *)
let _ =
  let _ = Printf.printf "x=%d\n" x in
  let _ = Printf.printf "y=%d\n" y in
  let _ = Printf.printf "z=%d\n" z in
  Printf.printf "pi_carre=%f\n" pi_carre
