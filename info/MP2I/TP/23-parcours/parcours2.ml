(* Utilisation : 
ocamlopt -o exec civ.ml parcours.ml 
 *)

type sommet = int
type graphe = sommet list array


(** Renvoie une version non-orientée d'une liste d'adjacence *)
let desoriente (g : graphe) : graphe =
  let get_adja s = 
    (** Calcule la liste des voisins de s en non-orienté, sans doublons *)
    let adja = ref g.(s) in
    Array.iteri (fun i adja_i -> if List.mem s adja_i then adja := i::!adja) g;
    List.sort_uniq Int.compare !adja
  in
  Array.init (Array.length g) get_adja



(** Fonctions d'affichage pour l'ouverture/fermeture d'un sommet *)
let ouvre : sommet->unit =
  Printf.printf "Ouvre sommet %d\n"
let ferme : sommet->unit =
  Printf.printf "Ferme sommet %d\n"


(* Préambule *)

let g0 = [|
  [1; 6];       (* 0  *)
  [2; 3];       (* 1  *)
  [1; 3; 4; 5]; (* 2  *)
  [2];          (* 3  *)
  [2];          (* 4  *)
  [9; 12];      (* 5  *)
  [7];          (* 6  *)
  [6; 8];       (* 7  *)
  [];           (* 8  *)
  [10];         (* 9  *)
  [11];         (* 10 *)
  [10];         (* 11 *)
  [13];         (* 12 *)
  [12]          (* 13 *)
|]

let g2 = [|
  [1; 2];    (* 0  *)
  [0; 2];    (* 1  *)
  [0; 1; 3]; (* 2  *)
  [2];       (* 3  *)
  [5];       (* 4  *)
  [4; 6];    (* 5  *)
  [5];       (* 6  *)
  [];        (* 7  *)
  [9; 11];   (* 8  *)
  [8; 10];   (* 9  *)
  [9; 11];   (* 10 *)
  [8; 10]    (* 11 *)
|]

(* BFS *)

(** [bfs visite g s0] parcourt en largeur [g] depuis [s0]
    et applique [visite] à chaque noeud découvert.
    
    Renvoie l'arbre de parenté du parcours
*)
let bfs (visite : sommet->unit) g s0 =
  let marque = Array.make (Array.length g) false in
  let parent = Array.make (Array.length g) None in
  let f = Queue.create () in
  Queue.push (s0, s0) f;
  marque.(s0) <- false; (* marquage anticipé ! *)

  while not (Queue.is_empty f) do
    let (pu, u) = Queue.take f in
    visite u;
    parent.(u) <- Some pu;
    let ajoute_voisin v =
      if not marque.(v) then begin 
         Queue.add (u, v) f;
         marque.(v) <- true (* marquage anticipé ! *)
      end
    in List.iter ajoute_voisin g.(u)
  done;

  parent.(s0) <- None;
  parent


(** [composantes_connexes g] est la liste des composantes
    connexes de [g], chacune d'entre elle étant une liste
    de sommets
*)
let composantes_connexes g =
  let n = Array.length g in
  let marque = Array.make n false in

  let dfs s0 =
    let comp = ref [] in
    let pile = Stack.create () in
    Stack.push s0 pile;
    while not (Stack.is_empty pile) do
      let u = Stack.pop pile in
      if not marque.(u) then begin
        comp := u :: !comp;
        marque.(u) <- true;
        List.iter (fun v -> if not marque.(v) then Stack.push v pile) g.(u)
      end
    done;
    !comp
  in

  let composantes = ref [] in
  for s = 0 to n-1 do
    if not marque.(s) then composantes := (dfs s) :: !composantes
  done;
  !composantes
