(* Perles de Dijkstra *)


(*********************************************************)
(* Des fonctions servant à tester la présence d'un carré *)
(*********************************************************)


(** Renvoie le préfixe de longueur n de lst. *)
let rec take n lst =
  if n = 0 then [] 
  else match lst with
  | [] ->  raise (Invalid_argument "take")
  | t::q -> t :: (take (n-1) q)

(** Renvoie la liste lst privée de ses n premiers éléments *)
let rec drop n lst =
  if n = 0 then lst
  else match lst with
  | [] -> raise (Invalid_argument "drop")
  | t::q -> drop (n-1) q


(** Renvoie true si et seulement si pref est préfixe de lst *)
let rec est_prefixe pref lst =
  match pref with
  | []  -> true
  | t :: q ->    lst <> [] 
              && t = List.hd lst 
              && est_prefixe q (List.tl lst)


(** Renvoie true si et seulement si la liste lst débute par un carré *)
let debute_carre lst =
  let len = List.length lst in

  (* On cherche un carré de longueur n *)
  let rec loop n =
    if 2*n > len then false
    else 
      let pref = take n lst in
      est_prefixe pref (drop n lst) || loop (n+1)
  in

  loop 1


(** Renvoie true si et seulement si lst contient un carré *)
let rec contient_carre lst =
  match lst with
  | [] -> false
  | t::q -> debute_carre lst || contient_carre q




(**************************)
(* Recherche d'un collier *)
(**************************)


type perle = Bleu | Blanc | Rouge

let string_of_perle p =
  match p with
  | Bleu  -> "Bleu"
  | Blanc -> "Blanc"
  | Rouge -> "Rouge"

let print_perle p =
  print_string (string_of_perle p)

let rec print_collier lst =
  match lst with
  | [] -> Printf.printf "\n"
  | t :: q -> let _ = print_perle t in
              let _ = Printf.printf "; " in
              print_collier q


let rec backtrace lst target =
  if List.length lst = target then lst else
    if contient_carre lst then [] else

  (* On print le collier temporaire et on print le debute_carre/contient_carre *)
  let _ = print_collier lst in
  let _ = Printf.printf "%b\n" (contient_carre lst) in

  let a = backtrace (Bleu::lst) target in
  if List.length a = target then a else
    let b = backtrace (Blanc::lst) target in
    if List.length b = target then b else
      let c = backtrace (Rouge::lst) target in
      if List.length c = target then c else
        []

let make_collier n = backtrace [] n

let n = (int_of_string Sys.argv.(1))

let lst = make_collier n

let _ = Printf.printf "%d\n" (List.length lst)

let _ = print_collier lst
