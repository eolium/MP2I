let comp = fun f g x -> f (g x)

let carre = fun x -> x*x
let add = fun x -> x+1

let implique = fun a b -> not (a=b)||b

let h = fun x -> -abs(x)

let foo0 = fun f -> (f(0)+.f(1))/.2.
let foo1 = fun f -> fun x -> (f x) *. (f x)
let foo2 = fun f -> fun x -> f (f x)
let foo3 = fun f -> fun x -> f (x+.1.)
let foo4 = fun f -> fun x -> (f ((foo2 f 0. +. foo2 f 1.) /. 2.) +. 3.) ** 4.
