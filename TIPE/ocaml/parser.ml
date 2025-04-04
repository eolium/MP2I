open Hashtbl

type fonction = Sin | Cos | Tan | Asin | Acos | Atan | Sh | Ch | Th
type operateur = Add | Rem | Mul | Div

type operande = Valeur of float | Variable of string | Fonction of fonction | Operateur of operateur

type expr = operande list

type equation = string * expr


let parser_bloc bloc =
  if bloc = "" then
    failwith "parser : la chaine contient des doubles-espaces"
  else

  match bloc with
  | "sin" -> Fonction(Sin)
  | "cos" -> Fonction(Cos)
  | "tan" -> Fonction(Tan)
  | "asin" -> Fonction(Asin)
  | "acos" -> Fonction(Acos)
  | "atan" -> Fonction(Atan)
  | "sh" -> Fonction(Sh)
  | "ch" -> Fonction(Ch)
  | "th" -> Fonction(Th)
  | "+" -> Operateur(Add)
  | "-" -> Operateur(Rem)
  | "*" -> Operateur(Mul)
  | "/" -> Operateur(Div)
  | _ -> match float_of_string_opt bloc with
    | None -> Variable(bloc)
    | Some x -> Valeur(x)

let parser_expr chaine = 
  List.map parser_bloc (String.split_on_char ' ' chaine)


let calcul a b op =
  match op with
  | Add -> a+.b
  | Rem -> a-.b
  | Mul -> a*.b
  | Div -> a/.b

let eval expr valeurs =
  let stc = Stack.create () in

  List.iter (fun bloc ->
    match bloc with
    | Operateur(op) ->
      let a = Stack.pop stc in
      let b = Stack.pop stc in
      let c = calcul b a op in
      Printf.printf "%f\n" c;
      Stack.push c stc
    | Valeur(x) -> Stack.push x stc
    | Variable(v) -> Stack.push (Hashtbl.find valeurs v) stc
    | _ -> failwith "WHUT ?!"

  ) expr;

  Stack.pop stc


let print_hashtble tab =
  Printf.printf "{\n";
  Hashtbl.iter (fun k v -> Printf.printf "\t\"%s\": %f\n" k v) tab;
  Printf.printf "}\n"

let t = Hashtbl.create 20
let _ = Hashtbl.add t "" 0.

let _ = Hashtbl.add t "mx" 1.
let _ = Hashtbl.add t "my" 1.
let _ = Hashtbl.add t "x" 1.
let _ = Hashtbl.add t "y" 1.
let _ = Hashtbl.add t "y''" 1.
let _ = Hashtbl.add t "x''" 1.

let expr = parser_expr "mx my * y x - y x - * /"

let r = eval expr t