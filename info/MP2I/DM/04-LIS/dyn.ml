(***************************)
(* Programmation dynamique *)
(***************************)



(* Valeur d'une solution optimale *)

(* Calcule le max lg.(k) avec k < i et arr.(k) <= arr.(i)
    Si i = 0, renvoie 0 *)
let search arr lg i =
  let lg_out = ref 0 in
  let a = arr.(i) in

  for j = 0 to i-1 do
    if arr.(j) <= a && lg.(j) > !lg_out then
      lg_out := lg.(j)
  done;

  !lg_out

let search_indice arr lg i =
  let lg_out = ref 0 in
  let out = ref (-1) in
  let a = arr.(i) in

  for j = 0 to i-1 do
    if arr.(j) <= a && lg.(j) > !lg_out then
      lg_out := lg.(j);
      out := j
  done;

  if !out = (-1) then
    None
  else
    Some !out
  

let lis arr =
  failwith "TODO"



(* Solution optimale elle-même *)

let sol_lis arr =
  failwith "TODO"