let rec f = fun x -> f(x)

let _ = Printf.printf "%d\n" (f 0)