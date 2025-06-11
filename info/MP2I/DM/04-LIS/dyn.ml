(***************************)
(* Programmation dynamique *)
(***************************)



(* Valeur d'une solution optimale *)

(* Calcule le max lg.(k) avec k < i et arr.(k) <= arr.(i)
    Si i = 0, renvoie 0 *)
let search arr lg i =
  let lg_out = ref 0 in

  for j = 0 to i-1 do
    if arr.(j) <= arr.(i) && lg.(j) > !lg_out then
      lg_out := lg.(j)
  done;

  !lg_out


let find_opt x arr =
  let out = ref None in
  let l = Array.length arr in

  for i = 0 to l-1 do
    if arr.(i) = x && !out = None then
      out := Some i
  done;

  !out


let print_int_array lst =
  Array.iter (fun x -> Printf.printf "%d " x) lst;
  print_char '\n'


let rec search_indice_aux arr lg i j max_val max_ind =
  if j < 0 then
    max_ind
  else if arr.(j) <= arr.(i) && lg.(j) > max_val then
    search_indice_aux arr lg i (j - 1) lg.(j) (Some j)
  else
    search_indice_aux arr lg i (j - 1) max_val max_ind


let search_indice arr lg i =
  if i = 0 then
    None
  else
    search_indice_aux arr lg i (i-1) 0 None


let lis arr =
  let l = Array.length arr in
  let lg = Array.make l 0 in

  Printf.printf "%d\n" l;

  lg.(0) <- 1;

  let out = ref lg.(0) in

  for i = 0 to l-1 do
    lg.(i)<- 1+search arr lg i;
    if lg.(i) > !out then
      out := lg.(i)
  done;

  !out

(* Solution optimale elle-même *)

let get_max arr len =
  let m = ref arr.(0) in
  let mi = ref 0 in
  for i = 1 to len do
    if arr.(i) > !m then
      mi := i;
      m := arr.(i)
  done;
  !mi

let sol_lis arr =
  let l = Array.length arr in
  let lg = Array.make l 0 in

  Printf.printf "%d\n" l;

  lg.(0) <- 1;

  let out = ref lg.(0) in

  for i = 0 to l-1 do
    lg.(i)<- 1+search arr lg i;
    if lg.(i) > !out then
      out := lg.(i)
  done;

  Array.init l (fun i -> arr.(get_max arr i))