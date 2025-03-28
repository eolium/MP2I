let off_by_one = fun f -> (fun x -> f (x+1))

let divise = fun (d: float) -> (fun x -> x/.d)

let affine = fun (a: int) -> (fun (b: int) -> (fun x -> a*x+b))

let mini = fun x -> (fun y -> if (x > y) then x else y)