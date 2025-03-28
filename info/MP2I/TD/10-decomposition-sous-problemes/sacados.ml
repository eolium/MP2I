

(** Récurrence naïve *)
let sac_naif p v pmax =

  let rec f k d =
    if k = 0 then
      (* cas de base *)
      0
    else if d - p.(k-1) < 0 then
      (* je ne peux pas prendre l'obj k-1 *)
      f (k-1) d
    else
      (* je teste le mieux entre prendre et ne pas prendre *)
      let sans = f (k-1) d in
      let avec = v.(k-1) + f (k-1) (d - v.(k-1)) in 
      max avec sans
  in

  f (Array.length p) pmax



(** Version mémoïsée de la fonction précédente *)
let sac_dyn p v pmax =
  let n = Array.length p in
  let f_mem = Array.make_matrix (n+1) (pmax+1) None in

  let rec f k d =
    if f_mem.(k).(d) = None then begin
      if k = 0 then
        f_mem.(k).(d) <- Some 0
      else if d - p.(k-1) < 0 then
        f_mem.(k).(d) <- Some (f (k-1) d)
      else
        let sans = f (k-1) d in
        let avec = v.(k-1) + f (k-1) (d - v.(k-1)) in
        f_mem.(k).(d) <- Some (max avec sans)
    end
    ;
    Option.get f_mem.(k).(d)
  in

  f n pmax