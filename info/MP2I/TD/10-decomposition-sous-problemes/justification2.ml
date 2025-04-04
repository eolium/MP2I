open Input

let rec score (length_mots: int array) (length_page: int) =
  (*
    - Définir le coût
    - Algo naïf à partir de la relation de récurrence
    - Mémoïsation
  *)

  let cout (i: int) (j: int) : float =
    let nb_espaces = length_page-(j-i) in
    let sum = ref 0 in
    for k = i to j do
      sum := !sum + length_mots.(k)
    done;

    if nb_espaces - !sum < 0 then
      Float.infinity
    else
      float_of_int (nb_espaces - !sum) ** 2.
  in


  let tab = Array.make (Array.length length_mots + 1) (-1.) in

  let rec naif (i:int) : float =
    if tab.(i) <> -1. then tab.(i) else

      if i = Array.length length_mots then 0. else

      let m = ref Float.infinity in

      for j = i+1 to Array.length length_mots do
        m := min !m ((cout i (j-1)) +. naif j)
      done;

    tab.(i) <- !m;

    !m
  in

  let _ = naif 0 in

  let lst = ref [0] in

  for i = 1 to Array.length tab - 2 do
    if tab.(i) < tab.(i-1) then
      lst := i :: !lst
  done;
  
  List.rev !lst

let ex_sujet = [| 2; 4; 2; 6; 6 |]
let long_sujet = 20

let () = Random.self_init ()
let tab = Array.init 30 (fun _ -> 2 + Random.int 6)
  
let _ = 
  for longueur = 10 to 10 do
    let a = score tab longueur in

    let _ = let f x = Printf.printf "%d " x in List.iter f a in
    Printf.printf "%d, " (List.length a)
  done;

  print_char '\n'

let print_array lst =
  Printf.printf("[ ");
  for i = 0 to Array.length lst-1 do
    Printf.printf "%s; " lst.(i)
  done;
  Printf.printf(" ]")

let print_int_array tab =
  Printf.printf("[ ");
  for i = 0 to Array.length tab-1 do
    Printf.printf "%d; " tab.(i)
  done;
  Printf.printf(" ]")

let taille = 10

let f = open_in "input.txt"
let txt = input_line f
let mots = Array.of_list (String.split_on_char ' ' txt)
let long_mots = Array.init (Array.length mots) (fun i -> String.length mots.(i))

let endlines tab longueur =
  let a = score tab longueur in

  let out = ref [] in

  List.iter (fun x -> out := x :: !out) a;

  List.rev !out

let _ =
  let tab = ref (endlines long_mots 10) in

  print_int_array (Array.of_list !tab);
  print_char '\n';

  for i = 0 to Array.length long_mots-1 do
    Printf.printf "%s " mots.(i);
    if List.hd !tab = i then
      let _ = print_char '\n' in
      tab := List.tl !tab
  done

let _ = print_char '\n'