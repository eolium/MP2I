(* Graphes *)

type sommet = int
type graphe = sommet list array  (* listes d'adjacence *)

type arbre = sommet option array (* tableau de parenté *)


(** [bfs g s0] est l'arbre de parcours 
    en largeur de [g] depuis [s0] 
*)
let bfs (g : graphe) (s0 : sommet) : arbre =
  let n = Array.length g in
  let parent = Array.make n None in
  let marque = Array.make n false in
  let file = Queue.create () in
  (* La file contient des arcs [(pu,u)] avec 
     [pu] le sommet qui enfile [u] dans la file *)
  Queue.add (s0, s0) file;
  marque.(s0) <- true; (* marquage anticipé !*)
  
  while not (Queue.is_empty file) do
    let (pu, u) = Queue.take file in
    parent.(u) <- Some pu;

    let insere v =
      if not marque.(v) then begin
        Queue.add (u,v) file;
        marque.(v) <- true (* marquage anticipé ! *)
      end
    in
    List.iter insere g.(u)
  done;

  parent.(s0) <- None;
  parent


(** [dfs g s0] est l'arbre de parcours 
    en profondeur de [g] depuis [s0] 
*)
let dfs (g : graphe) (s0 : sommet) : arbre =
  let n = Array.length g in
  let parent = Array.make n None in
  let marque = Array.make n false in
  let pile = Stack.create () in
  (* La pile contient des arêtes [(pu,u)] avec 
     [pu] le sommet qui empile [u] dans la pile *)
  Stack.push (s0, s0) pile;
  
  while not (Stack.is_empty pile) do
    let (pu, u) = Stack.pop pile in
    if not marque.(u) then begin
      marque.(u) <- true;
      parent.(u) <- Some pu;
      List.iter (fun v -> if not marque.(v) then Stack.push (u,v) pile) g.(u)
    end
  done;

  parent.(s0) <- None;
  parent


(** [dfs g s0] est l'arbre de parcours 
    en profondeur de [g] depuis [s0] 
*)
let dfs (g : graphe) (s0 : sommet) : arbre =
  let n = Array.length g in
  let marque = Array.make n false in
  let parent = Array.make n None in

  let rec dfs_rec pu u =
    if not marque.(u) then begin
      marque.(u) <- true;
      parent.(u) <- Some pu;
      List.iter (fun v -> if not marque.(v) then dfs_rec u v) g.(u)
    end
  in

  dfs_rec s0 s0;
  parent.(s0) <- None;
  parent


(** [dates g] est une paire [d,f] avec [d]
    les dates d'ouverture et [f] de fermeture
    lors d'un DFS complet de [g]
*)
let dates (g : graphe) : int array * int array =
  let n = Array.length g in
  let ouverture = Array.make n (-1) in
  let fermeture = Array.make n (-1) in
  let time = ref 0 in
  let marque = Array.make n false in

  let rec dfs_rec u =
    if not marque.(u) then begin
      marque.(u) <- true;
      ouverture.(u) <- !time; incr time;

      List.iter (fun v -> if not marque.(v) then dfs_rec v) g.(u);
      
      fermeture.(u) <- !time; incr time
    end
  in

  for s0 = 0 to n-1 do 
    if not marque.(s0) then dfs_rec s0 
  done;
  ouverture, fermeture


(** [composantes g] est un tableau qui 
    étiquette chaque sommet par le numéro de 
    sa composante, c'est à dire que c'est un
    tableau [c] tel que [c.(x) = c.(y)] si
    et seulement si les sommets [x] et [y]
    sont dans la même composante connexe. 
*)
let composantes (g : graphe) : int array =
  let n = Array.length g in
  let comp = Array.make n (-1) in
  let num_comp = ref 0 in
  let marque = Array.make n false in

  let bfs s0 =
    let file = Queue.create () in
    Queue.add s0 file;
    marque.(s0) <- true; (* marquage anticipé ! *) 
    while not (Queue.is_empty file) do
    let u = Queue.take file in
      marque.(u) <- true;
      comp.(u) <- !num_comp;
      let insere v =
        if not marque.(v) then begin
          Queue.add v file;
          marque.(v) <- true (* marquage anticipé ! *)
        end
      in
      List.iter insere g.(u)
    done
  in

  for s0 = 0 to n-1 do
    if not marque.(s0) then begin 
      bfs s0;
      incr num_comp
    end
  done;
  comp


(** [ordre_topo g] est un tableau des sommets
    de [g] triés selon un ordre topologique.

    Lève [Cycle] si le graphe n'est pas un DAG.
*)
exception Cycle

let ordre_topo (g : graphe) : sommet array =
  let n = Array.length g in
  let fermeture = Array.make n (-1) in
  let time = ref 0 in
  let marque = Array.make n false in

  let rec dfs_rec u =
    if not marque.(u) then begin
      marque.(u) <- true;

      let check_voisin v =
        if marque.(v) && fermeture.(v) = -1
        then raise Cycle
        else if not marque.(v) then dfs_rec v
      in
      List.iter check_voisin g.(u);

      fermeture.(u) <- !time; incr time
    end
  in

  (* Calculer toutes les fermetures *)
  for u = 0 to n-1 do
    if not marque.(u) then dfs_rec u
  done;
  
  (* Construire l'ordre à partir des fermetures *)
  let ordre = Array.make n (-1) in
  for u = 0 to n-1 do ordre.(n-1 - fermeture.(u)) <- u done;
  ordre