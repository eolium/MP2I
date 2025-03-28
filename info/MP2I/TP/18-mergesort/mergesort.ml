(* mergesort *)

let () = Random.self_init ()

(** Crée une liste de [len] éléments inférieurs à [maxi] *)
let random_list maxi len =
  List.init len (fun _ -> Random.int maxi)
  
let rec print_list = function
  | [] -> Printf.printf "\n"
  | t::q -> let _ = Printf.printf "%d " t in print_list q

let rec is_sorted = function
  | [] -> true
  | [t] -> true
  | t::q -> t <= (List.hd q) && is_sorted q
  
let rec boucle f n =
  if n > 0 then let _ = f n in boucle f (n-1)


let rec divide = function
  | [] -> [], []
  | [t] -> [t], []
  | t::h::q -> let a, b = divide q in t::a, h::b

let rec merge a b = match a, b with
  | q, []
  | [], q -> q
  | t1::q1, t2::q2 ->
    if t1 < t2 then
      t1::(merge q1 b)
    else
      t2::(merge a q2)

let rec mergesort lst = match lst with
  | [] -> []
  | [t] -> [t]
  | _ ->
    let a, b = divide lst in
    merge (mergesort a) (mergesort b)