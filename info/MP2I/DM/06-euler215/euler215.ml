(* Problème 215 du projet Euler *)


(*******************************)
(* Raisonnement sur les lignes *)
(*******************************)

type ligne = {code : int; nb_empl : int}


let ligne_vide = {code = 1 ; nb_empl = 1} (* État initial *)
let   ligne_b2 = {code = 5 ; nb_empl = 3} (* Initial + une 2-brique *)
let   ligne_b3 = {code = 9 ; nb_empl = 4} (* Initial + une 3-brique *)
let  ligne_b22 = {code = 21; nb_empl = 5} (* Initial + 2-brique + 2-brique *)
let  ligne_b23 = {code = 41; nb_empl = 6} (* Initial + 2-brique + 3-brique *)
let  ligne_b32 = {code = 37; nb_empl = 6} (* Initial + 3-brique + 2-brique *)
let  ligne_b33 = {code = 73; nb_empl = 7} (* Initial + 3-brique + 3-brique *)


let print_ligne lgn =
  assert (lgn.code land (1 lsl (lgn.nb_empl-1)) <> 0); (* debug *)
  
  (* Gérer à part le mur de gauche *)
  print_char '|';

  (* Puis afficher tous les autres emplacements.*)
  for i = lgn.nb_empl -2 downto 0 do
    if lgn.code land (1 lsl i) <> 0
    then print_string "_|"
    else print_string "_"
  done


let ligne_creuse nb_empl =
  if nb_empl < 2 then
    raise (Invalid_argument "ligne_creuse")
  else
  
  {code = 2 lsl (nb_empl - 1) + 1; nb_empl = nb_empl}


let est_collision p q =
  failwith "TODO"


let etend nb_max depart =
  failwith "TODO"
    

let calcule_lignes h =
  failwith "TODO"


(**************************)
(* Résolution du problème *)
(**************************)



let rec sum_map f lst =
  failwith "TODO"


let euler215 horizontal vertical =
  failwith "TODO"
