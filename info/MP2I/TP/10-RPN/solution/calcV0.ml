(** Calculatrice en notation polonaise inversée *)


(** Réalise le calcule récursif. *)
let rec calcule instr pile =
  match instr with
  | [] ->
      (* On renvoie le sommet de la pile *)
      List.hd pile
  | "+" :: q ->
      (* On "dépile" les deux sommets de la pile, et on empile le résultat *)
      let a = List.hd pile in
      let b = List.hd (List.tl pile) in
      let pile_depilee = List.tl (List.tl pile) in
      calcule q ((a+b) :: pile_depilee)
  | "-" :: q ->
      (* Idem *)
      let a = List.hd pile in
      let b = List.hd (List.tl pile) in
      let pile_depilee = List.tl (List.tl pile) in
      calcule q ((a-b) :: pile_depilee)
  | "*" :: q ->
      (* Idem *)
      let a = List.hd pile in
      let b = List.hd (List.tl pile) in
      let pile_depilee = List.tl (List.tl pile) in
      calcule q ((a*b) :: pile_depilee)
  | "/" :: q ->
      (* Idem *)
      let a = List.hd pile in
      let b = List.hd (List.tl pile) in
      let pile_depilee = List.tl (List.tl pile) in
      calcule q ((a/b) :: pile_depilee)
  | "%" :: q ->
      (* Idem *)
      let a = List.hd pile in
      let b = List.hd (List.tl pile) in
      let pile_depilee = List.tl (List.tl pile) in
      calcule q ((a mod b) :: pile_depilee)
  | str :: q ->
      let n = int_of_string str in
      calcule q (n :: pile)


(** Réalise le calcul décrit par instr *)
let calculatrice instr =
  calcule instr []




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