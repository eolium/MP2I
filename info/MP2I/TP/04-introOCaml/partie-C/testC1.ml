open Fonctions

let test_double () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "double(%d) = %d\n" 0 (double 0) in
      let _ = Printf.printf "double(%d) = %d\n" 3 (double 3) in
        Printf.printf "double(%d) = %d\n" (-2) (double (-2))

let test_cst_0 () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "cst_0(%d) = %d\n" 0 (cst_0 0) in
      let _ = Printf.printf "cst_0(%d) = %d\n" 3 (cst_0 3) in
        Printf.printf "cst_0(%d) = %d\n" (-2) (cst_0 (-2))


let test_id () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "id(%d) = %d\n" 0 (id 0) in
      let _ = Printf.printf "id(%d) = %d\n" 3 (id 3) in
        Printf.printf "id(%d) = %d\n" (-2) (id (-2))

let test_partie () =
  let _ = print_endline "---------------------" in
    let print_est_pair = fun n ->  if est_pair n then Printf.printf "%d est pair\n" n else Printf.printf "%d est impair\n" n in
      let _ = print_est_pair 0 in
        let _ = print_est_pair 3 in
          print_est_pair (-2)

let test_est_bissextile () =
  let _ = print_endline "---------------------" in
    let print_est_bissextile = fun n ->  if est_bissextile n then Printf.printf "%d est bissextile\n" n else Printf.printf "%d n'est pas bissextile\n" n in
      let _ = print_est_bissextile 1900 in
        let _ = print_est_bissextile 1999 in
            let _ = print_est_bissextile 2000 in
              let _ = print_est_bissextile 2001 in
                let _ = print_est_bissextile 2002 in
                  let _ = print_est_bissextile 2003 in
                    let _ = print_est_bissextile 2004 in
                      print_est_bissextile 2025

let _ =
  let _ = test_double () in
  let _ = test_cst_0 () in
  let _ = test_id () in
  let _ = test_partie () in
  test_est_bissextile ()