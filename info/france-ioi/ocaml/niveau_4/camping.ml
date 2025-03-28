let is_zero a b c d tab =
  let exception Echec in
  try
    for i = a to c do
      for j = b to d do
        if tab.(i).(j) <> 0 then raise Echec
      done
    done;
    true
  with
  | Echec -> false

(*let rec taille_max_co i j tab =
  let s = 
  for a = i to n *)

let a = Array.make_matrix 5 5 10

let () =
  a.(0).(0) <- 0;
  a.(0).(1) <- 0;
  a.(1).(0) <- 0;
  a.(1).(1) <- 0

let rec biggest_zero i j tab =
  let m = min i j in

  let n = Array.length tab in

  if tab.(i).(j) <> 0 then 0 else

  let exception Echec of int in
  try
    for taille = 1 to m do
      for a = i to i + taille do
        if tab.(a).(j) <> 0 then
          raise (Echec (taille-1))
      done;

      for b = j to j + taille do
        if tab.(i).(b) <> 0 then
          raise (Echec (taille-1))
      done
    done;

    n - m
  with
  | Echec b -> b