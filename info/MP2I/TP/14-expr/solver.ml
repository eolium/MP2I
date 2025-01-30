(* Solver d'équations linéaires à 1 inconnue *)

type expr =
  | Cst of int
  | Var of int * string (* Var (n, "x") représente le prod scal n.x *)
  | Add of expr*expr

type equation = expr * expr

let ordonner a b =
  match a, b with
  | Cst b, Var (a_c, a_x) -> (a_c, a_x), b
  | Add (e0, e1), Var (a_c, a_x) -> (a_c, a_x), Var (e0, a1)
  | Add (e0, e1), Cst a -> a, Var (e0, e1)
  | _ -> a, b


  let rec simplifier e =
  match e with
  | Cst a -> a
  | Var a -> a

  | Add e0, e1 -> (
    match ordonner a, b with
      | Cst a, Cst b -> Cst (a + b)
    | Var (a_c, a_x), Var (b_c, c_x) -> (a_c + b_c), a_x
    | Cst a, Var b -> a, b

    | Cst a, Add (e0, e1) -> simplifier (simplifier a, e0) e1
    | Var a, Add (e0, e1) -> simplifier (simplifier a, e0), e1
    )


let rec print_expr e =
  match e with
  | Cst n -> print_int n
  | Add (e0, e1) ->
      let _ = print_string "(" in
      let _ = print_expr e0 in
      let _ = print_string (") + (") in
      let _ = print_expr e1 in
      print_string ")"