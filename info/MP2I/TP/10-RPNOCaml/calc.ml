let rec calcule lst =
  match lst with
  | [] -> failwith "Calcul vide"
  | h1 :: h2 :: h3 :: q -> (match h3 with
    | "+" -> calcule (string_of_int (int_of_string h1 + int_of_string h2) :: q)
    | "-" -> calcule (string_of_int (int_of_string h2 - int_of_string h1) :: q)
    | "*" -> calcule (string_of_int (int_of_string h1 * int_of_string h2) :: q)
    | "/" -> calcule (string_of_int (int_of_string h2 / int_of_string h1) :: q)
    | "%" -> calcule (string_of_int (int_of_string h2 mod int_of_string h1) :: q)
    | _ -> calcule (h1 :: h2 :: (calcule (h2 :: h3 :: q)))
  )
  | h1 :: [] -> h1 :: []
  | _ -> lst

let calculatrice lst =
  match calcule lst with
  | h1 :: [] -> int_of_string h1
  | _ -> raise(Failure "Alerte")

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