(***********************************)
(* Fichier main, pour vos tests.   *)
(* Je n'exécuterai pas ce fichier. *)
(***********************************)


(*******************************)
(* Deux fonctions d'affichage, *)
(* ça vous servira peut-être   *)
(* (ou peut-être pas)          *)
(*******************************)

(** Affiche une [int list] *)
let print_intlist lst =
  if lst = [] 
  then print_string "[]"
  else begin
    let open Printf in (* cette ligne est HP, vous n'avez pas à la comprendre *)
    printf "[%d" (List.hd lst);
    List.iter (printf "; %d") (List.tl lst);
    printf "]"
  end

(** Affiche un [int array] *)
let print_intarray arr =
  if Array.length arr = 0 
  then print_string "[||]"
  else begin 
    let open Printf in (* cette ligne est HP, vous n'avez pas à la comprendre *)
    printf "[|%d" arr.(0);
    for i = 1 to Array.length arr -1 do
      printf "; %d" arr.(i)
    done;
    printf "|]"
  end



(************)
(* À vous ! *)
(************)

let () =
  print_endline "test.txt :";
  let all_lines = Load.get_intlist "test.txt" in
  let all_lis = List.map Naif.lis all_lines in
  List.iteri (Printf.printf "Ligne %d : lis=%d\n") all_lis