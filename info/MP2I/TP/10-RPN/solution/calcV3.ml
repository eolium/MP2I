(** Calculatrice en notation polonaise inversée *)

(* - Je gère le cas où str n'est pas un entier
   - je limite la duplication de code
   - j'utilise fold_left
*)

(** Convertit str en fonction *)
let fun_of_string str =
  match str with
  | "+" -> ( + )
  | "-" -> ( - )
  | "*" -> ( * )
  | "/" -> ( / )
  | "%" -> ( mod )
  | _ -> raise (Invalid_argument "fun_of_string")


(** Met à jour la pile suite à l'instruction str *)
let rec update_pile pile str =
  try int_of_string str :: pile
  with Failure _ ->
      let a, b = List.hd pile, List.hd (List.tl pile) in
      let pile_depilee = List.tl (List.tl pile) in
      (fun_of_string str a b) :: pile_depilee


(** Réalise le calcul décrit par instr *)
let calculatrice instr =
  let pile_finale = List.fold_left update_pile [] instr in
  List.hd pile_finale




(** Petit main qui :
    - lit une ligne (où les termes sont séparés par des espaces),
    - réalise le calcul correspondant,
    - affiche le résultat,
    - recommence

  Entrez "FIN" pour terminer.
*)
let main () =
  let rec loop () =
		let () = print_endline "Entrez un calcul ou FIN, et validez avec Entrée" in 
		let () = print_endline "Pour un calcul, tapez le sans guillemets. Par exemple : 3 1 + 2 -" in
    let lgn = input_line stdin in
    if String.uppercase_ascii lgn <> "FIN" then
      let instr = String.split_on_char ' ' lgn 
								  |> List.filter ((<>) "")     in
      let resultat = calculatrice instr in
      let () = Printf.printf "Résulat : %d\n" resultat in
			let () = flush stdout in
      loop ()
  in
  loop ()

let () = main ()