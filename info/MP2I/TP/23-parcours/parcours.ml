(* Utilisation : 
ocamlopt -o exec decouvertes.ml tp22.ml 
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

let g1 = desoriente g0

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


let bfs f g s0 =
  let q = Queue.create () in
  Queue.add s0 q;

  let marquage = Array.make (Array.length g) false in

  while not (Queue.is_empty q) do
    let s = Queue.take q in
    if not marquage.(s) then begin
      marquage.(s)<- true;
      List.iter (fun x -> Queue.add x q) g.(s);
      f s
    end
  done


let bfs2 f g s0 =
  let q = Queue.create () in
  Queue.add s0 q;

  let marquage = Array.make (Array.length g) false in

  let parent = Array.make (Array.length g) None in

  let dist = ref 0 in

  while not (Queue.is_empty q) do
    let s = Queue.take q in
    if not marquage.(s) then begin
      marquage.(s)<- true;
      List.iter (fun x -> 
        Queue.add x q;
        parent.(x) <- Some !dist
      ) g.(s);
      f s;
      dist := !dist+1
    end
  done;

  parent




