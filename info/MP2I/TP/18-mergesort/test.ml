open Mergesort

let _ =
  if is_sorted [3; 4; 0; 1] then failwith "Erreur q1." else

  let test_is_sorted n =
    let a = random_list (1 + Random.int 10) (1 + Random.int 10) in
    Printf.printf "%b\n" (is_sorted a)
  in

  boucle test_is_sorted 0

let _ =
  let test_divide n =
    let a = random_list (1 + Random.int 10) (1 + Random.int 10) in
    let _ = print_list a in
    let b, c = divide a in
    let _ = print_list b in
    let _ = print_list c in

    Printf.printf "\n"
  in

  boucle test_divide 0

let _ =
  let test_mergesort n =
    let a = random_list 10000 1000 in

    if not ((List.sort Int.compare a) = (mergesort a)) then
      failwith "Erreur dans le test_mergesort"
    else
      ()
  in

  boucle test_mergesort 1000

let _ = Printf.printf "Compilation successed\n"