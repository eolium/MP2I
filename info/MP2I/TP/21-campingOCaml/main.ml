let id x = x


let get_int_line nbC =
  let tab = Array.make nbC 0 in

  for i = 0 to nbC-1 do
    tab.(i) <- (Scanf.scanf " %d" id)
  done;
  tab


let get_matrix nbL nbC =
  let mat = Array.make_matrix nbL nbC 0 in

  for i = 0 to nbL-1 do
    for j = 0 to nbC-1 do
      mat.(i).(j) <- Scanf.scanf " %d" id
    done
  done;

  mat


let print_tab tab =
  for i = 0 to Array.length tab -1 do
    Printf.printf "%d " tab.(i)
  done;

  Printf.printf "\n"


let print_matrix mat =
  for i = 0 to Array.length mat-1 do
    print_tab mat.(i)
  done

let rec biggest_zero_aux mat i j (tab:int array array) =
  if tab.(i).(j) <> -1 then tab.(i).(j) else

  let n = Array.length mat -1 in

  
  if i = n || j = n then
    let a = 1 - mat.(i).(j) in
    tab.(i).(j) <- a;
    a
  else

  if mat.(i).(j) = 1 then 0 else
    let a = 1 + min (min (biggest_zero_aux mat (i+1) j tab) (biggest_zero_aux mat i (j+1) tab)) (biggest_zero_aux mat (i+1) (j+1) tab) in
    tab.(i).(j) <- a;
    a

let matrix_max mat =
  let out = ref mat.(0).(0) in

  for i = 0 to Array.length mat -1 do
    for j = 0 to Array.length mat -1 do
      let a = mat.(i).(j) in
      if a > !out then out := a
    done
  done;

  !out

let biggest_zero mat =
  let tab = Array.make_matrix (Array.length mat) (Array.length mat) (-1) in

  let _ = biggest_zero_aux mat 0 1 tab in
  let _ = biggest_zero_aux mat 1 0 tab in
  let _ = biggest_zero_aux mat 0 0 tab in

  matrix_max tab

let nbL = Scanf.scanf " %d" id
let nbC = Scanf.scanf " %d" id

let mat = get_matrix nbL nbC

let _ = Printf.printf "%d\n" (biggest_zero mat)