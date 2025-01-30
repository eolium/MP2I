(* Évaluateur de sommes *)

type plus_expr =
  | Cst of int
  | Plus of plus_expr * plus_expr

(* 1 + 2 *)
let ud = Plus (Cst 1, Cst 2)

(* (1+2)+3 *)
let ud_t = Plus (Plus (Cst 1, Cst 2), Cst 3)

(* 1 + (2+3) *)
let u_dt = Plus (Cst 1, Plus(Cst 2, Cst 3))


let rec print_plus_expr e =
  match e with
  | Cst n -> print_int n
  | Plus (e0, e1) -> 
      let _ = print_plus_expr e0 in
      let _ = print_string " + " in
      print_plus_expr e1


let is_int e =
  match e with
  | Cst n -> true
  | _ -> false


let rec eval expr =
  match expr with
  | Cst n -> n
  | Plus (e0, e1) -> (eval e0) + (eval e1)


let _ = Printf.printf "%b\n" (is_int (Plus (Cst 8, Cst 5)))


let _ = Printf.printf "%d\n" (eval (Plus (Cst 8, Cst 5)))