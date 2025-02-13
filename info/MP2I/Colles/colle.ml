let rec tri_fusion l0 l1 =
  match (l0, l1) with
  | [], [] -> []
  | [], _ -> l1
  | _, [] -> l0
  | t0::q0, t1::q1 ->
    if t0 <= t1 then t0 :: (merge q0 l1)
    else t1 :: merge (l0 q1)