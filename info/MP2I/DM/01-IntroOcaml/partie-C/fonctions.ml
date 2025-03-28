let double = fun x -> 2*x

let cst_0 = fun x -> 0

let id = fun x -> x

let est_pair = fun x -> (x mod 2) = 0

let est_bissextile = fun x -> (x mod 400 = 0 || (x mod 4 = 0 && x mod 100 > 0))