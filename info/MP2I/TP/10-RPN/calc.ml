(** Calculatrice en notation polonaise inversée *)


(** Réalise le calcule récursif. *)
let rec calcule instr pile =
  match instr with
  | [] ->       failwith "TODO"
  | "+" :: q -> failwith "TODO"
  | "-" :: q -> failwith "TODO"
  | "*" :: q -> failwith "TODO"
  | "/" :: q -> failwith "TODO"
  | str :: q -> failwith "TODO"


(** Réalise le calcul décrit par instr *)
let calculatrice instr =
  failwith "TODO"




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
      let instr = String.split_on_char ' ' lgn in
      let resultat = calculatrice instr in
      let () = Printf.printf "Résulat : %d\n" resultat in
			let () = flush stdout in
      loop ()
  in
  loop ()

let () = main ()
