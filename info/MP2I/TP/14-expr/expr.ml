(* Évaluateur d'expressions arithmétiques *)

type expr =
  | Cst of int
  | Add of expr*expr
  | Sub of expr*expr
  | Mul of expr*expr
  | Div of expr*expr
  | Mod of expr*expr


let rec eval expr =
  match expr with
  | Cst n -> n
  | Add (a, b) -> (eval a) + (eval b)
  | Sub (a, b) -> (eval a) - (eval b)
  | Mul (a, b) -> (eval a) * (eval b)
  | Div (a, b) -> (eval a) / (eval b)
  | Mod (a, b) -> (eval a) mod (eval b)

let rec complexite expr =
  match expr with
  | Cst n -> 0
  | Add (e0, e1) | Sub (e0, e1) | Mul (e0, e1) | Div (e0, e1) | Mod (e0, e1) ->
    (complexite e0) + (complexite e1) + 1


let rec nb_par_max expr =
  match expr with
  | Cst n -> 0
  | Add (e0, e1) | Sub (e0, e1) | Mul (e0, e1) | Div (e0, e1) | Mod (e0, e1) ->
    max (nb_par_max e0) (nb_par_max e1) + 1


let string_of_op op =
  match op with
  | Add _ -> "+" | Sub _ -> "-" | Mul _ -> "*" | Div _ -> "/" | Mod _ -> "mod"
  | Cst _ -> raise (Invalid_argument "string_of_op")


let rec print_expr e =
  match e with
  | Cst n -> print_int n
  | Add (e0, e1) | Sub (e0, e1) | Mul (e0, e1) | Div (e0, e1) | Mod (e0, e1) ->
      let _ = print_string "(" in
      let _ = print_expr e0 in
      let _ = print_string (") " ^ string_of_op e ^ " (") in
      let _ = print_expr e1 in
      print_string ")"

(* vaut 2 *)
let test0 = Div (Add (Cst 20, Sub (Cst 1, Cst 5)), Add (Cst 3, Cst 5))

let _ = print_expr test0

let _ = Printf.printf " = %d\n" (eval test0)

let _ = Printf.printf "%d\n" (complexite test0)


let _ = Printf.printf "%d\n" (nb_par_max test0)