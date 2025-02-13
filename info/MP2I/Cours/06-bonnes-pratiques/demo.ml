(* Des exemples de codes OCaml *)

let rec mem x lst =
  match lst with
  | t :: q -> t = x || (mem x q)
  | [] -> false


(** Affiche 2*x et le renvoie *)
let foo x =
  let _ = print_int (2*x) in
  let _ = print_char '\n' in
  2*x

(** Renvoie 3*x *)
let bar x =
  (* on appelle x trois fois *)
  x + x + x

let y = bar (foo 1)