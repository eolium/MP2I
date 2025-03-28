let difference = fun y -> fun x -> abs(x-y)

let mini = fun y -> fun x -> if (x > y) then x else y

let mini3 = fun z -> fun y -> fun x -> mini (mini x y) z

let est_multiple = fun d -> fun m -> (m mod d = 0)