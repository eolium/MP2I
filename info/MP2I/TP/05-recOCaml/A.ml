let better_print_int = fun (x: int) ->
  let _ = print_int x in 
  print_char '\n'

let _ = better_print_int 4

let rec factorielle = fun (n: int) ->
  if n > 0 then n*(factorielle (n-1)) else 1

let _ = Printf.printf "%d\n" (factorielle 1)
let _ = Printf.printf "%d\n" (factorielle 2)
let _ = Printf.printf "%d\n" (factorielle 3)
let _ = Printf.printf "%d\n" (factorielle 4)
let _ = Printf.printf "%d\n" (factorielle 5)

let rec ligne_etoiles = fun (n: int) ->
  if n > 0 then
    let _ = Printf.printf "*" in ligne_etoiles(n-1)
  else
    Printf.printf "\n"

let rec triangle_bas = fun (n: int) ->
  if n > 1 then
    let _ = ligne_etoiles(n) in triangle_bas(n-1)
  else
    ligne_etoiles 1

let _ = triangle_bas 5

let rec triangle_haut = fun (n: int) ->
  if n > 1 then
    let _ = triangle_bas(n) in ligne_etoiles(n-1)
  else
    ligne_etoiles 1

let rec afficher_espaces = fun (n: int) ->
  if n > 0 then
    let _ = Printf.printf " " in
    afficher_espaces (n-1)
  else
    ()

let rec carre_creux_milieu = fun (l: int) (n: int) ->
  if l > 0 then
    let _ = Printf.printf "*" in
    let _ = afficher_espaces (n-2) in
    let _ = Printf.printf "*\n" in
    carre_creux_milieu (l-1) n
  else
    ()

let carre_creux = fun (n: int) ->
  let _ = ligne_etoiles n in
  let _ = carre_creux_milieu (n-2) n in
  ligne_etoiles n

let rec catalan = fun (n: int) -> 
  if n > 0 then
    2*(2*n+1)*(catalan (n-1))/(n+2)
  else
    1

let _ = Printf.printf "%d\n" (catalan 1)
let _ = Printf.printf "%d\n" (catalan 2)
let _ = Printf.printf "%d\n" (catalan 3)
let _ = Printf.printf "%d\n" (catalan 4)
let _ = Printf.printf "%d\n" (catalan 5)
let _ = Printf.printf "%d\n" (catalan 6)
let _ = Printf.printf "%d\n" (catalan 7)


let rec temps_de_vol = fun (n: int) ->
  if n > 1 then
    1 + temps_de_vol (if n mod 2 = 0 then n/2 else 3*n+1)
  else
    0

let _ = Printf.printf "%d\n" (temps_de_vol 27)

let rec prod = fun (x:int) (y: int) ->
  if y > 1 then
    x + prod x (y-1)
  else
    x

let _ = Printf.printf "%d\n" ((prod 57 29) - 57*29)


let rec div = fun x y ->
  if (x < y) then 0 else
    if (x = y) then 1 else
      1 + (div (x-y) y)


let reste = fun x y -> x - y * (div x y)

let reverse_div = fun x y -> prod y (div x y) + (reste x y)

let _ = Printf.printf "%d\n" (reverse_div 10 3)
let _ = Printf.printf "%d\n" (reverse_div 528 5)