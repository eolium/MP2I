(** Affichage d'un triangle de Sierpinski **)

(* ***************************************************************** *
 * Pour compiler :                                                   *
 * ocamlfind ocamlopt -package graphics,unix -linkpkg sierpinski.ml  *
 *                                                                   *
 * Pour démarrer le dessin :                                         *
 * appuyer sur la touche 's' ou 'S'                                  *
 * Pour quitter :                                                    *
 * attendre que la fractale soit finie, puis appuqyer sur 'q' ou 'Q' *
 * ***************************************************************** *)


(** Un point est une paire d'entiers.
  *
  * Rmq : ce sont des int car les demi-pixels n'existent pas.
  *)
type point = int*int



(* ***************************************** *
 * Fonctions/variables fournies par l'énoncé *
 * ***************************************** *)

(** Couleur et profondeur du triangle *)
let couleur_fond = Graphics.black
let couleur_creux = Graphics.white
let prof_max : int =
  (* On va lire la profondeur sur la ligne de commande.
     On affiche un message d'erreur si elle n'y est pas. *)
  try 
    int_of_string Sys.argv.(1)
  with Invalid_argument _ -> 
    failwith ("Usage : " ^ Sys.argv.(0) ^ " prof_max")


(** Les dimensions (en pixels) de la fenêtre graphique *)
let x_max = 1500  (* largeur de la fenêtre (horizontale) *)
let y_max = 700   (* hauteur de la fenêtre (verticale)   *)
let y_marge = 100 (* marge verticale au-dessus et en-dessous du triangle *)


(** Les coordonnées des trois sommets a b et c du triangle. *)
let semi_base : int = (* maths d'un triangle *)
  int_of_float ( (float_of_int (y_max - 2*y_marge)) *. Float.tan (Float.pi /. 6.) ) 
let a : point = 
  (x_max/2, y_max-1 - y_marge)
let b : point = 
  (x_max/2 - semi_base, 0 + y_marge)
let c : point = 
  (x_max/2 + semi_base, 0 + y_marge)


(** Fonction qui crée une fenêtre graphique à l'aide des
  * paramètres ci-dessus, crée dedans le triangle abc
  * et remplit ce triangle de noir.
  *)
let init () = 
  let _ = Graphics.open_graph "" in
  let _ = Graphics.resize_window x_max y_max in
  let _ = Graphics.set_color Graphics.black in
  Graphics.fill_poly [|a;b;c|]
 

(** Fonction qui attend qu'une des touches de la liste l
  * soit enfoncée. 
  *
  * Sert à attendre que l'utilisateur·ice appuie sur s ou S
  * pour débuter, puis sur q ou Q pour quitter.
  *)
let rec wait_keys (l : char list) : unit = 
  let s = (Graphics.wait_next_event [Key_pressed]) in
  if s.keypressed && (List.mem s.key l) then () else wait_keys l


(** Fonction qui colorie le triangle uvw avec la
  * couleur couleur_creux, puis attend 0.5s 
  *)
let colorie_creux u v w =
  let _ = Graphics.set_color couleur_creux in
  let _ = Graphics.fill_poly [|u; v; w|] in
  Unix.sleepf 0.5
  
  


(* *************************************************** *
 * Fonctions où vous devez coder.                      *
 * *************************************************** *)


(** Renvoie le point milieu entre (x0,y0) et (x1,y1). *)
let milieu (x0,y0) (x1,y1) =
  ( 0 , 0 )


(** Creuse le triangle p q r pour en faire un triangle de
  * Sierpinski de profondeur prof.
  *) 
let rec sierpinski p q r prof =
	()




(* *************************************************** *
 * << main >> qui utilise ce qui précède pour afficher *
 * un triangle de sierpinski de profondeur prof_max.   *
 * *************************************************** *)

(** main *)
let _ =
  let _ = init () in
  let _ = wait_keys ['s'; 'S'] in
  let _ = sierpinski a b c prof_max in
  let _ = wait_keys ['q'; 'Q'] in
  Graphics.close_graph ()