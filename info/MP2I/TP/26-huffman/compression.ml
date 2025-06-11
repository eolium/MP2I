open Francais

(*let () = affiche_arbre arbre_francais; print_newline ()*)

(* 1100->a, 10->' ' *)

let mirroir str = 
  let r = ref "" in

  for i  = 0 to String.length str -1 do
    r := String.make 1 str.[i] ^ !r
  done;

  !r


(*
let _ = Printf.printf "%s\n" (mirroir "mot")
*)

let rec arbre_to_dico_aux tree code dico =
  match tree with
  | F(c) -> Hashtbl.add dico c code
  | N(g, d) -> begin
    arbre_to_dico_aux g (code^"0") dico;
    arbre_to_dico_aux d (code^"1") dico
  end


let arbre_to_dico tree =
  let dico = Hashtbl.create 16 in
  arbre_to_dico_aux tree "" dico;
  dico


let compresse_message str tree =
  let dico = arbre_to_dico tree in

  let lst = List.init (String.length str) (function c -> Hashtbl.find dico str.[c]) in

  String.concat "" lst


let compressed = compresse_message "hello world" arbre_francais

(*
let _ = Printf.printf "%b\n" (compressed = "11100000011110111101111101001111101111111000011110111010")
*)


let rec decompresse_char str tree i =
  match tree with
  | F(c) -> (c, i)
  | N(g, d) ->
    if str.[i] = '0' then
      decompresse_char str g (i+1)
    else
      decompresse_char str d (i+1)


let decompresse_message str tree =
  let lst = ref [] in

  let i_bin = ref 0 in

  while !i_bin < String.length str do
    let c, n = decompresse_char str tree !i_bin in
    i_bin := n;
    lst := (String.make 1 c) :: !lst;
  done;

  String.concat "" (List.rev !lst)


let decompressed = decompresse_message compressed arbre_francais

(*
let _ = Printf.printf "%s\n" decompressed

let _ = Printf.printf "%s\n" (decompresse_message mystere arbre_francais)
let _ = Printf.printf "%s\n" (decompresse_message mystere2 arbre_francais)
let _ = Printf.printf "%s\n" (decompresse_message mystere3 arbre_francais)
*)


let codage_huffman lst =
  let out = ref (List.map(fun (c, f) -> (f, F c)) lst) in 

  let fusion (f1, c1) (f2, c2) = (f1+.f2), N(c1, c2) in

  while List.length !out > 1 do
    out := List.sort Stdlib.compare !out;

    match !out with
    | t1::t2::q -> out := (fusion t1 t2 :: q)
    | _ -> failwith "absurde"
  done;

  match !out with
  | [(f, c)] -> c
  | _ -> failwith "encore plus absurde"


let code = codage_huffman lettres_avec_frequences

(*
let _ = Printf.printf "%b\n" (code = arbre_francais)
*)

let trouve_frequences str = 
  let lst = ref [] in
  
  let rec update_freq el lst =
    match !lst with
    | [] -> lst := [el, 1]
    | t::q -> if fst t = el then lst := (el, snd t)::q else update_freq el lst
  in

  for i = 0 to String.length str -1 do
    Printf.printf "%d\n" i;
    update_freq str.[i] lst;
  done;

  let s = float_of_int (String.length str) in

  List.map (fun (c,n) -> c, (float_of_int n /. s)) !lst

  
let decode = decompresse_message mystere3 arbre_francais


let lst = trouve_frequences decode

let arbre = codage_huffman lst

(*
let code = compresse_message decode (codage_huffman lst)
*)

let _ = List.iter (fun (c, t) -> Printf.printf "%c - %f" c t) lst
