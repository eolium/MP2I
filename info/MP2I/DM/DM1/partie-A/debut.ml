(* Pour la partie A, complétez les déclarations ci-dessous *)

let x = 42

let y = x mod 4

let z = y*y*y

let pi_carre = 3.14**2.

let square = fun (x: int) -> x*x

let p_8 = fun (x: int) -> square (square (square x))

let p_3 = let x = 3 in 473 * (square (p_8 x)) - 763 * (p_8 x) + 55 * (square x) - 6721123 * x - 42


let s = fun (x: int) -> if (x mod 2 = 0) then (x/2) else (3*x+1)

let babar = s (p_3 - 5)