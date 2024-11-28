(* A - Introduction *)

let better_print_int x =
  let _ = print_int x in
  print_string "\n"

let print_bool x =
  if x then print_string "true\n" else print_string "false\n"

(* D - Premières fonctions *)

let hd l =
  match l with
    | [] -> (-1)
    | h::q -> h

let rec print_int_list l =
  match l with
    | [] -> Printf.printf("\n")
    | h::q -> let _ = Printf.printf "%d\t" h in print_int_list q

let rec length l =
  match l with
    | [] -> 0
    | h::q -> 1 + length q

let rec int_sum l =
  match l with
    | [] -> 0
    | h::q -> h + int_sum q

let rec mem e l =
  match l with
  | [] -> false
  | h::q -> e = t || mem e q

let rec append a b =
  match a with
  | [] -> b
  | h::q -> (h:: (append q b))

(* F - Fonctions de listes et booléens *)

let rec exists f l =
  match l with
  | [] -> false
  | h::q -> (f h) || (exists f q)

let rec for_all f l =
    match l with
    | [] -> false
    | h::q -> (f h) && (exists f q)

let rec filter f l =
  match l with
  | [] -> []
  | h::q when f l -> (h:: l)

let _ = print_int_list (fun x -> x mod 3 = 0) [1;2;3;4;5;6]