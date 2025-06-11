(* Implémentation de tas min en OCaml *)



type 'a t = {
  mutable len : int;     (* Taille du tas *)
  mutable tab : 'a array (* Tableau qui contient les éléments *)
}

exception Empty


(* Taille min des tab *)
let min_size = 8


(* Renvoie l'indice du parent du noeud d'indice i *)
let parent i = (i-1) / 2

(* Renvoie l'indice de l'enfant gauche du noeud d'indice i *)
let gauche i = 2*i+1

(* Renvoie l'indice de l'enfant droite du noeud d'indice i *)
let droite i = 2*i+2


(* Crée un nouveau tas, vide *)
let create () =
  {len = 0; tab = [||]}


let is_empty t =
  t.len = 0


let length t =
  t.len


(* Échange les éléments d'indice [i] et [j] du tableau [tab]. *)
let swap tab i j =
  let tmp = tab.(i) in
  tab.(i) <- tab.(j);
  tab.(j) <- tmp


(* Percolation vers le haut dans le pseudo-tas 
  [t] depuis l'indice [i] *)
let rec percoleHaut t i =
  if i > 0 && t.tab.(parent i) > t.tab.(i) then begin
    swap t.tab i (parent i);
    percoleHaut t (parent i)
  end


(* Renvoie une copie de tab de longueur new_length *)
let redim tab new_length =
  let size = max new_length min_size in
  Array.init size (fun i -> 
    if i < Array.length tab then tab.(i) else tab.(0)
  )

(* Insertion dans un tas binaire *)
let add t x =

  if t.len = 0 then begin
    t.tab <- Array.make min_size x;
    t.len <- 1
  end 
  else begin

    (* Si besoin, doubler le tableau *)
    if t.len + 1 = Array.length t.tab then
      t.tab <- redim t.tab (2 * Array.length t.tab);

    (* Puis insérer en percolant vers le haut *)
    t.tab.(t.len) <- x;
    t.len <- t.len + 1;
    percoleHaut t (t.len-1)
  end

let peek t =
  if t.len = 0 then raise Empty else t.tab.(0)


let peek_opt t =
  if t.len = 0 then None else Some t.tab.(0)


(* Percolation vers le bas dans le tableau 
  [tab] depuis l'indice [i] *)
let rec percoleBas t i =
  if gauche i < t.len then

    (* Calculer l'indice du plus petit enfant*)
    let i_enf_min = 
      if droite i < t.len && t.tab.(gauche i) > t.tab.(droite i)
      then droite i
      else gauche i
    in

    (* Si besoin, échanger et continuer de percoler*)
    if t.tab.(i) > t.tab.(i_enf_min) then begin
      swap t.tab i (i_enf_min);
      percoleBas t i_enf_min
    end


(* Extracition dans un tas binaire *)
let take_min t =
  if t.len = 0 then raise Empty;

  (* Si besoin, contracter le tableau *)
  let size = Array.length t.tab in
  if t.len <= size / 4 && size /2 >= min_size then 
    t.tab <- redim t.tab (size /2);

  let mini = t.tab.(0) in
  swap t.tab 0 (t.len-1);
  t.len <- t.len -1;
  percoleBas t 0;
  mini


let take_min_opt t =
  if t.len = 0 then None else Some (take_min t)


(** Trie en place [arr] *)
let heapSort arr =
  let t = create () in
  for i = 0 to Array.length arr -1 do
    add t arr.(i)
  done;
  for i = 0 to Array.length arr -1 do
    print_int i; print_newline (); flush stdout;
    arr.(i) <- take_min t
  done