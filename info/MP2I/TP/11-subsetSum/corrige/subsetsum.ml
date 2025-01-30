(* subset sum *)

(******************************************************************************)
(* Des exemples pour subsetSum *)


(* true *)
let e0, t0 = [5; 3; 7; 5], 13

(* false *)
let e1, t1 = e0, 14

(* true *)
let e2, t2 = [3; 1; 1; 5], 2

(* true *)
let e3, t3 = [2; 1; 2], 4

(* false *)
let e4, t4 = [4; 7; 4; 5], 14

(* false *)
let e5, t5 = 
  [14; 10; 11; 19; 20; 20; 17; 16; 14; 18; 
   18; 13; 11; 14; 17; 17; 19; 12; 15; 12
  ], 
  298

(* Moyennement long, true *)
let e6, t6 = 
  [867;  13; 644; 108; 996; 997; 594; 121; 726; 420; 
   298; 593; 231; 692; 996; 382; 364; 252; 770; 386; 
   576; 485; 796; 825; 945; 791; 702; 338; 384; 400;
   707; 717; 242; 837; 727; 527; 854;  81;  41;   4; 
   841; 569; 718; 729; 592; 541;  24; 103; 181; 184; 
    93; 898; 270; 697; 953; 811; 972; 531; 602; 382
  ], 
  31846

(* Moyennement long, false *)
let e7, t7 = e6, 31847

(* long, true *)
let e8, t8 =
  [9470; 7005; 4828; 4286; 4535; 5827; 5782; 3427;  463; 3265; 
    205; 3930; 5462; 3802; 9264; 1196; 2099; 4463; 9255; 1714; 
   4282; 2675; 5733; 6419; 5837;  391;  425; 7937; 2451; 3700; 
   6854;  442; 4010; 9607; 4090; 1238; 9582;  174; 7688; 5726;
    268; 5164; 9862; 8834; 2233; 8646; 3167; 2913; 8294;  409; 
   5038; 1481; 4085; 8802;  982; 5293; 7414; 3404;  404; 5171; 
   9526;  834; 2035; 4461; 1075; 2474; 5165; 3199; 2173; 5153; 
   5106; 2375; 9627; 7296; 8717; 6497; 9522; 7076; 7514; 4125; 
    800; 5481; 9437; 6545; 2502; 7830; 3904; 1420; 3004; 4487; 
   6405; 9112;  986; 7880; 8373; 1346; 7636; 3186;  198; 4405; 
   3795; 6418; 3462; 7919; 7719; 3745; 7982; 3616; 5884; 8498; 
   7601; 6372; 7078; 8003; 9894; 2029; 8664; 5943; 4065; 4083; 
   5140; 1588;  499; 1328; 3022; 3489; 3726; 7265;  483; 8904; 
   9063; 3316; 3494;  969; 2032; 6725; 7382; 5602; 8331; 8392; 
   4485; 1508; 5974; 8266;  687; 6308; 9330; 7845; 3825;  620; 
   3608; 2781; 2952;  703; 5736; 5014; 8093; 7194; 5175; 6395; 
    816; 7053; 5123; 9373; 7667; 9639; 1290; 2638; 3617; 8226; 
   8590; 1315; 7444; 8236;  520; 5830; 6094; 9844; 9175; 5000; 
   2281; 7349; 8210; 3436; 7792; 4799; 6497; 1589; 6327; 5373; 
   1318; 6355;  845; 3445; 5930; 2155; 9332; 5424;  907; 2472
  ], 
  988010


(* long, false *)
let e9, t9 = e8, 988011



(* generateur de listes de n entiers aléatoires dans [|0; borne[| *)
let () = Random.self_init ()
let generateur n borne =
  List.init n (fun _ -> Random.int borne)



(******************************************************************************)
(* Les fonctions demandées *)

(* Rmq : vous pouvez échanger les appels récursifs pour tester ce 
   qui est le plus rapide et pourquoi ! *)

let rec ss_rec ens target =
  if target = 0 then
    true
  else
    match ens with
    | [] -> false
    | x :: ens' -> ss_rec ens' (target+x) || ss_rec ens' target


(* Pré-condition : tous les entiers sont positifs *)
let rec ss_backtrack ens target =
  if target < 0 then 
    false
  else if target = 0 then 
    true
  else 
    match ens with
    | [] -> false
    | x :: ens' -> ss_rec ens' (target+x) || ss_rec ens' target


let tri_decroissant = List.sort (fun x y -> y-x)


let ss_faster ens target =
  ss_backtrack (tri_decroissant ens) target


(* Commenter l'un ou l'autre selon quel algo je veux mesurer *)
(* let () =
  assert (ss_rec e7 t7 = false)

let () =
  assert (ss_backtrack e7 t7 = false) *)

let () =
  assert (ss_faster e7 t7 = false)