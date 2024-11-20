open FunCurry



let test_difference () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "difference(5)(5) = %d\n" (difference 5 5) in
      let _ = Printf.printf "difference(4)(1) = %d\n" (difference 4 1) in
        Printf.printf "difference(1)(4) = %d\n" (difference 1 4)

let test_mini3 () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "mini3(5)(6)(7) = %d\n" (mini3 5 6 7) in
      let _ = Printf.printf "mini3(5)(7)(6) = %d\n" (mini3 5 7 6) in
        let _ = Printf.printf "mini3(6)(5)(7) = %d\n" (mini3 6 5 7) in
          let _ = Printf.printf "mini3(6)(7)(5) = %d\n" (mini3 6 7 5) in
            let _ = Printf.printf "mini3(7)(5)(6) = %d\n" (mini3 7 5 6) in
              Printf.printf "mini3(7)(6)(5) = %d\n" (mini3 7 6 5)

let test_est_multiple () =
  let _ = print_endline "---------------------" in
    let print_est_multiple = fun d -> fun m -> if est_multiple d m then Printf.printf "%d est multiple de %d\n" m d else Printf.printf "%d n'est pas multiple de %d\n" m d in
      let _ = print_est_multiple 3 10 in
        let _ = print_est_multiple 3 11 in
          print_est_multiple 3 12

let _ =
  let _ = test_difference () in
  let _ = test_mini3 () in
  test_est_multiple ()