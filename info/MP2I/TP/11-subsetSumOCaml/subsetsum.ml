let rec Enumere tabE total =
  match tabE with
  | [] -> Print.printf "%d\n" total
  | x :: tabEp -> let _ = Enumere tabEp total in
    Enumere tabEp (total+x)
  | _ -> ()

let _ = Enumere [1; 2 ; 3] 0

(* Des exemples pour subsetSum *)

(*
(* true *)
let e0, target0 = [5; 3; 7; 5], 13

(* false *)
let e1, target1 = [5; 3; 7; 5], 14

(* true *)
let e2, target2 = [3; 1; 1; 5], 2

(* true *)
let e3, t3 = [2; 1; 2], 4

(* false *)
let e4, t4 = [4; 7; 4; 5], 14

(* false *)
let e5, t5 = [14; 10; 11; 19; 20; 20; 17; 16; 14; 18; 18; 13; 11; 14; 17; 17; 19; 12; 15; 12], 298
*)
