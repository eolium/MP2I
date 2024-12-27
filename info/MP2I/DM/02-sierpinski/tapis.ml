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


(** Les coordonnées des trois sommets a b et c du triangle. *)
let semi_base : int = (* maths d'un triangle *)
  int_of_float ( (float_of_int y_max) *. Float.tan (Float.pi /. 6.) ) 

let a : point = (x_max / 3, y_max / 3)
let b : point = (2 * x_max / 3, y_max / 3)
let c : point = (x_max / 3, 2 * y_max / 3)
let d : point = (2 * x_max / 3, 2 * y_max / 3)

(** Fonction qui crée une fenêtre graphique à l'aide des
  * paramètres ci-dessus
  *)
let init () = 
  let _ = Graphics.open_graph "" in
  Graphics.resize_window x_max y_max 

(** Fonction qui attend qu'une des touches de la liste l
  * soit enfoncée. 
  *
  * Sert à attendre que l'utilisateur·ice appuie sur s ou S
  * pour débuter, puis sur q ou Q pour quitter.
  *)
let rec wait_keys (l : char list) : unit = 
  let s = (Graphics.wait_next_event [Key_pressed]) in
  if s.keypressed && (List.mem s.key l) then () else wait_keys l


(* Fonction qui remplie un carré *)
let colorie_carre a b c d =
  let _ = Graphics.set_color couleur_fond in
  let _ = Graphics.fill_poly [|a; b; c; d|] in
  ()
  (*Unix.sleepf 0.5*)
  


(* *************************************************** *
 * Fonctions où vous devez coder.                      *
 * *************************************************** *)


(** Renvoie le point milieu entre (x0,y0) et (x1,y1). *)
let milieu (x0,y0) (x1,y1) =
  ((x0 + x1) / 2 , (y0 + y1) / 2)

let milieu_2 (x0, y0) (x1, y1) =
  ((2 * x0 + x1) / 3, (2 * y0 + y1) / 3)


(**
  * Remplit un tapis a b c d de Sierpinsky de profondeur prof.
*)

let rec tapis a b c d prof =
  if prof > 0 then
    let m1 = milieu_2 a b in
    let m2 = milieu_2 b a in
    let m3 = milieu_2 b c in
    let m4 = milieu_2 c b in
    let m5 = milieu_2 c d in
    let m6 = milieu_2 d c in
    let m7 = milieu_2 d a in
    let m8 = milieu_2 a d in

    let a1 = milieu_2 m1 m6 in
    let a2 = milieu_2 m2 m5 in
    let a3 = milieu_2 m6 m1 in
    let a4 = milieu_2 m5 m2 in

    let _ = colorie_carre a1 a2 a3 a4 in

    let _ = tapis a m1 a1 m8 (prof-1) in
    let _ = tapis m1 m2 a2 a1 (prof-1) in
    let _ = tapis m2 b m3 a2 (prof-1) in
    let _ = tapis a2 m3 m4 a3 (prof-1) in
    let _ = tapis a3 m4 c m5 (prof-1) in
    let _ = tapis a4 a3 m5 m6 (prof-1) in
    let _ = tapis m7 a4 m6 d (prof-1) in
    let _ = tapis m8 a1 a4 m7 (prof-1) in
    ()




(* *************************************************** *
 * << main >> qui utilise ce qui précède pour afficher *
 * un triangle de sierpinski de profondeur prof_max.   *
 * *************************************************** *)

(** main *)
let _ =
  let _ = init () in
  let _ = wait_keys ['s'; 'S'] in
  let _ = tapis a b c d prof_max in
  let _ = wait_keys ['q'; 'Q'] in
  Graphics.close_graph ()