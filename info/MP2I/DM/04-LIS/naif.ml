(********************)
(* Résolution naïve *)
(********************)

(* Dans ce fichier-ci, les séquences sont représentées par des listes *)
let print_string_list (lst: int list) =
  Printf.printf "[ ";
  List.iter (fun x -> Printf.printf "%d " x) lst;
  Printf.printf "]\n"

(* Teste si une liste est croissante *)
let rec is_increasing l =
  match l with
  | [] -> true
  | [t] -> true
  | t::h::q -> t <= h && is_increasing (h::q)


(* Renvoie toutes les sous-listes d'une liste *)
let rec all_subsequence l =
  match l with
  | [] -> [[]]
  | t::q -> let a = all_subsequence q in
    a @ List.map (fun l -> t::l) a

let rec is_increasing l =
  match l with
  | [] -> true
  | [t] -> true
  | t::h::q -> t <= h && is_increasing (h::q)
  
(* Renvoie toutes les sous-listes croissantes d'une liste *)
let all_sub_increasing l =
  let out = ref [] in

  List.iter (fun x ->
    if is_increasing x then
      out := x :: !out
  ) (all_subsequence l);

  !out


(* Renvoie la longueur d'une plus longue sous-liste croissante *)
let lis l =
  let lst = all_sub_increasing l in
  let out = ref 0 in

  List.iter (fun x ->
    if List.length x > !out then
      out := List.length x
  ) lst;

  !out

let print_int_list lst=
  List.iter (fun x -> Printf.printf "%d " x) lst;
  print_char '\n'

(* Bonus : renvoie la plus longue sous-suite croissante *)
let sol_lis l =
  let lst = all_sub_increasing l in

  List.hd (List.sort (fun x y -> if List.length x < List.length y then 1 else -1) lst)