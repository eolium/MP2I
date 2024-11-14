let cst_0 = fun x -> 0

let id = fun x -> x

let parite = fun x -> if (x mod 2 = 0) then (true) else (false)

let min = fun x y -> if (x < y) then (x) else (y)

let min_3 =
  fun x y z -> 
    if (x < y) then (
      if (x < z) then (x) 
      else (z)
    ) else (
      if (y < z) then (y)
      else (z)
    )

let bissextile = fun n -> (n mod 400 = 0) || (n mod 4 = 0 && n mod 100 <> 0)

let _ =
  let _ = Printf.printf "%B\n" (bissextile 2020) in
  let _ = Printf.printf "%B\n" (bissextile 2000) in
  let _ = Printf.printf "%B\n" (bissextile 1900) in
  let _ = Printf.printf "%B\n" (bissextile 2024) in
  let _ = Printf.printf "%B\n" (bissextile 2025) in
  Printf.printf "%B\n" (bissextile 2021)
(* ÇA MARCHE :D *)

let f = fun (x: int) (y: int) -> x+y

let _ = Printf.printf "%d\n" (f 4 3)

let _ = Printf.printf "%B\n" (if true then true else false)


let h = let f = fun x->x in let g = fun x->(-x) in min (f g)

let positif = fun (x: int) -> x / (min x (-x)) / 2 + 1