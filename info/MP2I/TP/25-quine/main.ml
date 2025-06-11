type prop =
  | Bot
  | Top
  | Var of int
  | Non of prop
  | Et of prop * prop
  | Ou of prop * prop
  | Imp of prop * prop


let rec taille prop =
  match prop with
  | Bot | Top | Var(_) -> 1
  | Non(p) -> 1 + taille p
  | Et(a, b) | Ou(a, b) | Imp(a, b) -> 1 + taille a + taille b


let phi = Et(Imp(Et(Var 0, Var 2), (Et(Var 0, Non (Ou(Var 1, Non (Var 2)))))), Var 0)

let rec print_formule p =
  match p with
  | Top -> print_string "Vrai "
  | Bot -> print_string "Faux "
  | Var(x) -> Printf.printf "x%d" x
  | Non(v) ->
    print_string " ";
    print_formule v
  | Et(a, b) ->
    print_string "(";
    print_formule a;
    print_string " ∧ ";
    print_formule b;
    print_string ")"
  | Ou(a, b) -> 
    print_string "(";
    print_formule a;
    print_string " ∨ ";
    print_formule b;
    print_string ")"
  | Imp(a, b) ->
    print_string "(";
    print_formule a;
    print_string " → ";
    print_formule b;
    print_string ")"

    
type valuation = bool array

let rec eval (p: prop) (v: valuation) =
  match p with
  | Top -> true
  | Bot -> false
  | Var(i) -> v.(i)
  | Non(a) -> not (eval a v)
  | Et(a, b) -> eval a v && eval b v
  | Ou(a, b) -> eval a v || eval b v
  | Imp(a, b) -> (not (eval a v)) || (eval b v)

let rec substitue entree i sub =
  match entree with
  | Top | Bot -> entree
  | Var(x) -> if x = i then sub else entree
  | Non(a) -> Non(substitue a i sub)
  | Et(a, b) -> Et(substitue a i sub, substitue b i sub)
  | Ou(a, b) -> Ou(substitue a i sub, substitue b i sub)
  | Imp(a, b) -> Imp(substitue a i sub, substitue b i sub)

let rec simplifie p =
  let out =
    match p with
    | Non(a) -> Non(simplifie a)
    | Et(a, b) -> Et(simplifie a, simplifie b)
    | Ou(a, b) -> Ou(simplifie a, simplifie b)
    | Imp(a, b) -> Imp(simplifie a, simplifie b)
    | _ -> p
  in

  match out with
  | Et(Bot, a) | Et(a, Bot) -> Bot
  | Et(Top, a) | Et(a, Top) -> a
  | Ou(Top, a) | Ou(a, Top) -> Top
  | Ou(Bot, a) | Ou(a, Bot) -> Bot
  | Non(Bot) -> Top
  | Non(Top) -> Bot
  | Imp(a, Top) | Imp(Bot, a) -> Top
  | Imp(a, Bot) -> Non a
  | _ -> out


let rec var_max p =
  match p with
  | Top | Bot -> 0
  | Var(x) -> x
  | Non(a) -> var_max a
  | Et(a, b) -> max (var_max a) (var_max b)
  | Ou(a, b) -> max (var_max a) (var_max b)
  | Imp(a, b) -> max (var_max a) (var_max b)

let rec sat_quine p =
  let s = simplifie p in
  
  match s with
  | Top -> true
  | Bot -> false
  | _ ->
    let x = var_max s in
    (sat_quine (substitue p x Bot)) || (sat_quine (substitue p x Top))


let _ = Random.self_init ()
let rec gen_prop (n:int) =
  if n < 1 then Var(0) else

  match Random.int 6 with
  | 0 -> Non (gen_prop n)
  | 1 -> Non(gen_prop n)
  | 2 -> Et(gen_prop (n-1), gen_prop (n-1))
  | 3 -> Ou(gen_prop (n-1), gen_prop (n-1))
  | 4 -> Imp(gen_prop (n-1), gen_prop (n-1))
  | 5 -> (
  match Random.int 3 with
    | 0 -> Bot
    | 1 -> Top
    | 2 -> Var(Random.int n)
    | _ -> failwith "absurde"
    )
  | _ -> failwith "absurde"


let p = gen_prop 2

let _ = print_string "arbre généré\n"

let _ = Printf.printf "%b\n" (sat_quine p)