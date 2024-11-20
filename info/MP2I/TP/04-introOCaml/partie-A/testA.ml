open Debut


let test_xyz () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "x=%d\n" x in
      let _ = Printf.printf "y=%d\n" y in
        Printf.printf "z=%d\n" z

let test_pi_carre () =
  let _ = print_endline "---------------------" in
    Printf.printf "pi² = %f\n" pi_carre

let test_p_3 () =
  let _ = print_endline "---------------------" in
    Printf.printf "P(3) = %d (vérif : 20335930074)\n" p_3

let test_babar () =
  let _ = print_endline "---------------------" in
    Printf.printf "s(P(3)) = %d (verif : 61007790208)\n" babar


let () =
  let _ = test_xyz () in
    let _ = test_pi_carre () in
      let _ = test_p_3 () in
        test_babar ()