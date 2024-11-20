open FunSup


let id =
  fun x -> x
let carre = 
  fun x -> x*x
let cube =
  fun x -> x*x*x


let test_off_by_one () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "off_by_one(id)(0) = %d\n" (off_by_one id 0) in
      let _ = Printf.printf "off_by_one(carre)(2) = %d\n" (off_by_one carre 2) in
        Printf.printf "off_by_one(cube)(-2) = %d\n" (off_by_one cube (-2))

let test_divise () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "divise(2.)(4.) = %f\n" (divise 2. 4.) in
      let _ = Printf.printf "divise(2.)(5.) = %f\n" (divise 2. 5.) in
        Printf.printf "divise(2.)(3.14) = %f\n" (divise 2. 3.14)


let test_affine () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "affine(1)(0)(3) = %d\n" (affine 1 0 3) in
      let _ = Printf.printf "affine(1)(20)(3) = %d\n" (affine 1 20 3) in
        let _ = Printf.printf "affine(2)(-3)(5) = %d\n" (affine 2 (-3) 5) in
          Printf.printf "affine(3)(-4)(10) = %d\n" (affine 3 (-4) 10)

let test_mini () =
  let _ = print_endline "---------------------" in
    let _ = Printf.printf "mini(1)(2) = %d\n" (mini 1 2) in
      Printf.printf "mini(2)(1) = %d\n" (mini 2 1)

let _ =
  let _ = test_off_by_one () in
  let _ = test_divise () in
  let _ = test_affine () in
  test_mini ()
