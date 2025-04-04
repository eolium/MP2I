(*****************************)
(* Lecture depuis un fichier *)
(*****************************)

let print_string_list (lst: string list) =
  Printf.printf "[\n";
  List.iter (fun x -> Printf.printf "\t%s;\n" x) lst;
  Printf.printf "]\n\n"
  

let rec get_lines_aux file lst =
  try
    let out = (input_line file)::lst in
    get_lines_aux file out
  with
    | End_of_file -> lst


(* Lit toutes les lignes d'un fichier et renvoie la liste des lignes *)
let get_lines filename =
  List.rev (get_lines_aux (open_in filename) [])


(* Convertit une string en int list
   (en coupant sur les espaces) *)
let intlist_of_line line =
  let lst = String.split_on_char ' ' line in
  List.map int_of_string lst
 

let get_intlist filename =
  List.map intlist_of_line (get_lines filename)


(* Convertit une string en int array
    (en coupant sur les espaces) *)
let intarray_of_line line =
  let tab = Array.of_list (String.split_on_char ' ' line) in
  Array.map int_of_string tab


let get_intarray filename =
  List.map intarray_of_line (get_lines filename)