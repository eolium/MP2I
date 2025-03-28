(* Des suites mémoïsées *)


(* Constante définie par l'énoncé *)
let m = (1 lsl 31) - 1

(* Valeur maximale de k et n pour les suites *)
let n_max = 1001
let k_max = 61

(* Les deux mémoires *)
let u_mem = Array.make (n_max+1) None
let v_mem = Array.make_matrix (k_max+1)  (n_max +1) None 

let set_u_0 seed =
  let reset arr =
    Array.(fill arr 0 (length arr) None)
  in
  reset u_mem;
  u_mem.(0) <- Some seed;
  Array.iter reset v_mem



(******************)
(* Calcul de u(n) *)
(******************)

(* par défaut u_0 vaut 42 *)
let () = set_u_0 42 

let rec get_u n =
  match u_mem.(n) with
  | Some u_n -> u_n
  | None -> 
      let u_nm1 = get_u (n-1) in
      let u_n = (16_807 * u_nm1 + 17) mod m in
      u_mem.(n) <- Some u_n;
      u_n

let u n =
  if 0 <= n && n <= n_max 
  then get_u n
  else invalid_arg "u" 


(* q1 du sujet ENS pour valider *)
let q1 n =
  u n mod 101
let () =
  let output = List.map q1 [5; 100; 997] in
  assert (output = [33; 9; 86])
  


(******************)
(* Calcul de v(n) *)
(******************)

(* Nb : je stocke les 61000 possibilités,
   c'est pas si couteux en RAM que ça. 
   Si ça peut compenser un code lent 
   des élèves, worth it.
*)

let get_v k n =
  match v_mem.(k).(n) with
  | Some v_kn -> v_kn
  | None ->
      let v_kn = (u n mod (1 lsl k)) + (1 lsl k) in
      v_mem.(k).(n) <- Some v_kn;
      v_kn

let v k n =
  if    0 <= n && n <= n_max
     && 0 <= k && k <= k_max
  then get_v k n
  else invalid_arg "v" 

(* q2 du sujet ENS pour valider *)
let q2 k =
  v k (97*k mod 997) mod 101
let () =
  let output = List.map q2 [5; 30; 61] in
  assert (output = [44; 34; 36])



(******************)
(* Calcul de x(p) *)
(******************)

(* Calcul instantané ou presque, 
   inutile de mémoïser 
*)
let x p =
  if p > 5
  then invalid_arg "x"
  else 1 lsl (1 lsl p)



(******************)
(* Calcul de h(n) *)
(******************)

(* Ca overflow tellement vite que 
   ça ne sert à rien de mémoïser... 
*)
let rec get_h n = 
  if n = 0 then 1
  else
    let h_n_m_1 = get_h (n-1) in
    h_n_m_1 + (x h_n_m_1) * h_n_m_1 

let h n =
  if n > 2
  then invalid_arg "h"
  else get_h n