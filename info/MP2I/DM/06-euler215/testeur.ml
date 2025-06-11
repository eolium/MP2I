let () = Printf.printf "\n----- Testeur automatique -----\n\n"; flush(stdout)

(*TODO : mettre ici la liste des fonctions des élèves testées 
	 (pour que le testeur marche même si l'élève n'a pas traité la question) *)

(* géré par le header testeur.mli et le code à trous
*)



(* ----- Code général du testeur automatique, ne pas modifier (rdv plus bas) ----- *)

(* variables globales utiles *)
let nb_test = ref 0
let reset r = r := 0
let score = ref 0.
let score_total = ref 0.


(* NE PAS REPETER CHEZ VOUS, nous sommes des professionnels *)
(* Application de fonction à un nombre quelconque d'argument *)
let [@warning "-20"] rec apply f arguments = match arguments with
	[] -> failwith "no argument"
  | [h] -> (Obj.magic f) h
  | h::t -> apply ((Obj.magic f) h) t


(* Tests générique de fonction, où l'on accorde les points sur le critère d'un booléen.
	Utile pour tester autre chose que l'égalité de la sortie d'une fonction avec une valeur prédéterminée.*)
let test_bool func_name cor_use b nb_points =
	incr nb_test;
	(*Printf.printf "%s : " func_name;*)
	if b && not (!cor_use) then begin
		Printf.printf "\027[32m(%.2f/%.2f) [OK]\027[0m" nb_points nb_points;
		score := !score +. nb_points
	end
	else if not b then begin
		Printf.printf "\027[31m(%.2f/%.2f) [KO] \027[0m" 0. nb_points;
		Printf.printf " La fonction \"%s\" a échoué sur le test n°%d." func_name (!nb_test);
	end
	else begin (* Détection d'utilisation de corrigé *)
		Printf.printf "\027[33m(%.2f/%.2f) [KO] \027[0m" 0. nb_points;
		Printf.printf " La fonction \"%s\" utilise son corrigé sur le test n°%d." func_name (!nb_test);
	end;
	print_newline ();
	cor_use := false;
	score_total := !score_total +. nb_points


(* Test de fonction à un nombre quelconque d'argument *)
(* Entrées : le nom de la fonction à tester, 
	 la liste de ses arguments,
	 la sortie attendue
	 et le nombre de points accordés à ce test*)
let test func_name func cor_use input expected_output nb_points =
	test_bool func_name cor_use (apply func input = expected_output) nb_points


let non_implemente func_name nb_points =
	Printf.printf "\027[36m(0/%.2f) La fonction \"%s\" n'est pas implémentée.\n \027[0m" nb_points func_name;
	score_total := !score_total +. nb_points


let plantage func_name nb_points =
	Printf.printf "\027[35m(0/%.2f) La fonction \"%s\" a levé une exception inattendue (elle a sans doute planté).\n \027[0m" nb_points func_name;
	score_total := !score_total +. nb_points




(* TODO : modifier le nom du module élève à ouvrir. *)

(*Ici le fichier testé doit s'appeler "sequent.ml", sinon adapter le nom du module à ouvrir.
	Le fichier corrige.ml fournit les fonctions demandés aux élèves (pour qu'ils puissent sauter une question), 
	mais ces fonctions mettent un booléen "cor_use" à true et les points ne seront pas accordés pour la questions. *)
(* Pour compiler : ocamlopt [fichier des élèves].ml testeur.ml -o test
ATTENTION : ne marche que si on compile ! *)

let name_use = ref ""
let cor_use = ref false


(* ----- Fonction utiles pour les test : ----- *)

(* Mettre ici les fonctions et variables maison appelées par vos tests *)
(* Exemple de fonction utile : test d'égalités entre les éléments de deux listes *)

let ligne_of_binary bin =
	Euler215.{code = int_of_string ("0b"^bin); nb_empl = String.length bin}

let list_sort_cmp l0 l1 =
	Stdlib.compare (List.sort Stdlib.compare l0) (List.sort Stdlib.compare l1)



(* ----- TESTS ----- *)
(* Tout d'abord, copier-coller la structure et la modifier accordément, puis écrire les tests comme suit :
testf [liste des arguments] [résultat attendu] [nb_de_points que vaut le test]
ou
testb [booléen vrai/faux qui doit être vrai si l'élève a réussi] [nb_de_points que vaut le test]
*)


let func_name = "ligne_creuse"
let () = reset nb_test
let () =
	let f = Euler215.ligne_creuse in
	name_use := func_name;
	(* let [@warning "-26"] testf inputs output nb_points = 
		try test func_name f cor_use inputs output nb_points
		with 
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in *)
	let [@warning "-26"] testb = test_bool func_name cor_use in
	Printf.printf "\n----- Test de %s -----\n" func_name;

	(* tests :*)
	
	let nb_points = 0.4 in
	begin try
		testb (f 2 = {code = 3; nb_empl = 2}) nb_points
	with 
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end;

	let nb_points = 0.4 in
	begin try
		testb (f 10 = {code = 513; nb_empl = 10}) nb_points
	with 
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end;

	let nb_points = 0.4 in
	begin try
		testb (f 33 = {code = 4294967297; nb_empl = 33}) nb_points
	with 
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end;

	let nb_points = 0.4 in
	begin try
		ignore @@ f 0;
		testb false nb_points
	with 
		| Invalid_argument _ -> testb true nb_points
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end;

	let nb_points = 0.4 in
	begin try
		ignore @@ f 1;
		testb false nb_points
	with 
		| Invalid_argument _ -> testb true nb_points
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end


let func_name = "est_collision"
let () = reset nb_test
let () =
	let f = Euler215.est_collision in
	name_use := func_name;
	(* let [@warning "-26"] testf inputs output nb_points = 
		try test func_name f cor_use inputs output nb_points
		with 
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in *)
	let [@warning "-26"] testb = test_bool func_name cor_use in
	Printf.printf "\n----- Test de %s -----\n" func_name;

	(* tests :*)
	
	let nb_points = 0.4 in
	begin try
		let p = ligne_of_binary "10001" in
		let q = ligne_of_binary "10011" in
		testb (not @@ f p q) nb_points
	with 
		| Invalid_argument _ -> testb true nb_points
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end;
	
	let nb_points = 0.4 in
	begin try
		let p = ligne_of_binary "10101" in
		let q = ligne_of_binary "10001" in
		testb (not @@ f p q) nb_points
	with 
		| Invalid_argument _ -> testb true nb_points
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end;
	
	let nb_points = 0.4 in
	begin try
		let p = ligne_of_binary "11000000100000001" in
		let q = ligne_of_binary "10000000100000101" in
		testb (f p q) nb_points
	with 
		| Invalid_argument _ -> testb true nb_points
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end;
	
	let nb_points = 0.4 in
	begin try
		let p = ligne_of_binary "11000001100000001" in
		let q = ligne_of_binary "10100000000000111" in
		testb (not @@ f p q) nb_points
	with 
		| Invalid_argument _ -> testb true nb_points
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end;

	let nb_points = 0.2 in
	begin try
		ignore @@ (f Euler215.ligne_b23 Euler215.ligne_b22);
		testb false nb_points
	with 
		| Invalid_argument _ -> testb true nb_points
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end;

	let nb_points = 0.2 in
	begin try
		let p = ligne_of_binary "1" in
		let q = ligne_of_binary "1" in
		ignore @@ (f p q);
		testb false nb_points
	with 
		| Invalid_argument _ -> testb true nb_points
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	end


let func_name = "etend"
let () = reset nb_test
let () =
	let f = Euler215.etend in
	name_use := func_name;
	(* let [@warning "-26"] testf inputs output nb_points = 
		try test func_name f cor_use inputs output nb_points
		with 
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in *)
	let [@warning "-26"] testb res nb_points = 
		try test_bool func_name cor_use res nb_points
		with
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in
	Printf.printf "\n----- Test de %s -----\n" func_name;

	(* tests :*)

	let attendu = 
		Euler215.[
			{code = 585; nb_empl = 10}; {code = 597; nb_empl = 10};
 			{code = 661; nb_empl = 10}; {code = 677; nb_empl = 10};
 			{code = 681; nb_empl = 10}
		] in
	testb (list_sort_cmp (f 10 Euler215.ligne_vide) attendu = 0) 1.;

	let attendu = 
		Euler215.[
		 {code = 21065; nb_empl = 15}; {code = 21077; nb_empl = 15};
		 {code = 21141; nb_empl = 15}; {code = 21157; nb_empl = 15};
		 {code = 21161; nb_empl = 15}; {code = 21653; nb_empl = 15};
		 {code = 21669; nb_empl = 15}; {code = 21673; nb_empl = 15};
		 {code = 21797; nb_empl = 15}; {code = 21801; nb_empl = 15};
		 {code = 21833; nb_empl = 15}; {code = 21845; nb_empl = 15}
		] in
	testb (list_sort_cmp (f 15 Euler215.ligne_b2) attendu = 0) 1.;

	let attendu = 
		Euler215.[
		 {code = 18725; nb_empl = 15}; {code = 18729; nb_empl = 15};
 	   {code = 18761; nb_empl = 15}; {code = 18773; nb_empl = 15}
		] in
	testb (list_sort_cmp (f 15 Euler215.ligne_b33) attendu = 0) 1.;

	let attendu = 
		Euler215.[
			{code = 18725; nb_empl = 15}; {code = 18729; nb_empl = 15};
 			{code = 18761; nb_empl = 15}; {code = 18773; nb_empl = 15};
 			{code = 19017; nb_empl = 15}; {code = 19029; nb_empl = 15};
 			{code = 19093; nb_empl = 15}; {code = 19109; nb_empl = 15};
 			{code = 19113; nb_empl = 15}; {code = 21065; nb_empl = 15};
 			{code = 21077; nb_empl = 15}; {code = 21141; nb_empl = 15};
 			{code = 21157; nb_empl = 15}; {code = 21161; nb_empl = 15};
 			{code = 21653; nb_empl = 15}; {code = 21669; nb_empl = 15};
 			{code = 21673; nb_empl = 15}; {code = 21797; nb_empl = 15};
 			{code = 21801; nb_empl = 15}; {code = 21833; nb_empl = 15};
 			{code = 21845; nb_empl = 15}
		] in
	testb (list_sort_cmp (f 15 Euler215.ligne_vide) attendu = 0) 1.;

	let attendu = 
		Euler215.[
			{code = 599189; nb_empl = 20}; {code = 599205; nb_empl = 20};
 			{code = 599209; nb_empl = 20}; {code = 599333; nb_empl = 20};
 			{code = 599337; nb_empl = 20}; {code = 599369; nb_empl = 20};
 			{code = 599381; nb_empl = 20}; {code = 600357; nb_empl = 20};
 			{code = 600361; nb_empl = 20}; {code = 600393; nb_empl = 20};
 			{code = 600405; nb_empl = 20}; {code = 600649; nb_empl = 20};
 			{code = 600661; nb_empl = 20}; {code = 600725; nb_empl = 20};
 			{code = 600741; nb_empl = 20}; {code = 600745; nb_empl = 20}
		] in
	testb (list_sort_cmp (f 20 Euler215.ligne_b33) attendu = 0) 1.

	
let func_name = "calcule_lignes"
let () = reset nb_test
let () =
	let f = Euler215.calcule_lignes in
	name_use := func_name;
	(* let [@warning "-26"] testf inputs output nb_points = 
		try test func_name f cor_use inputs output nb_points
		with 
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in *)
	let [@warning "-26"] testb res nb_points = 
		try test_bool func_name cor_use res nb_points
		with
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in
	Printf.printf "\n----- Test de %s -----\n" func_name;

	(* tests :*)

	let attendu = 
		Euler215.[
			{code = 585; nb_empl = 10}; {code = 597; nb_empl = 10};
 			{code = 661; nb_empl = 10}; {code = 677; nb_empl = 10};
 			{code = 681; nb_empl = 10}
		] in
	testb (list_sort_cmp (f 9) attendu = 0) 0.1;

	let attendu = 
		Euler215.[
			{code = 18725; nb_empl = 15}; {code = 18729; nb_empl = 15};
 			{code = 18761; nb_empl = 15}; {code = 18773; nb_empl = 15};
 			{code = 19017; nb_empl = 15}; {code = 19029; nb_empl = 15};
 			{code = 19093; nb_empl = 15}; {code = 19109; nb_empl = 15};
 			{code = 19113; nb_empl = 15}; {code = 21065; nb_empl = 15};
 			{code = 21077; nb_empl = 15}; {code = 21141; nb_empl = 15};
 			{code = 21157; nb_empl = 15}; {code = 21161; nb_empl = 15};
 			{code = 21653; nb_empl = 15}; {code = 21669; nb_empl = 15};
 			{code = 21673; nb_empl = 15}; {code = 21797; nb_empl = 15};
 			{code = 21801; nb_empl = 15}; {code = 21833; nb_empl = 15};
 			{code = 21845; nb_empl = 15}
		] in
	testb (list_sort_cmp (f 14) attendu = 0) 0.1
	

let func_name = "sum_map"
let () = reset nb_test
let () =
	let f = Euler215.sum_map in
	name_use := func_name;
	(* let [@warning "-26"] testf inputs output nb_points = 
		try test func_name f cor_use inputs output nb_points
		with 
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in *)
	let [@warning "-26"] testb res nb_points = 
		try test_bool func_name cor_use res nb_points
		with
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in
	Printf.printf "\n----- Test de %s -----\n" func_name;

	(* tests :*)

	let lst = List.init 0 (Fun.id) in
	testb (f (fun _ -> 1)  lst = 0) 0.2;

	let lst = List.init 100_000 (Fun.id) in
	testb (f (fun _ -> 1)  lst = 100_000) 0.3;

	let lst = List.init 10000 (fun i -> i*i) in
	testb (f (fun x -> x/2)  lst = 166641665000) 0.3


let func_name = "euler215"
let () = reset nb_test
let () =
	let f = Euler215.euler215 in
	name_use := func_name;
	(* let [@warning "-26"] testf inputs output nb_points = 
		try test func_name f cor_use inputs output nb_points
		with 
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in *)
	let [@warning "-26"] testb res nb_points = 
		try test_bool func_name cor_use res nb_points
		with
		| Failure s when s = "TODO" -> non_implemente func_name nb_points
		| _ -> plantage func_name nb_points
	in
	Printf.printf "\n----- Test de %s -----\n" func_name;

	(* tests :*)

	testb (f 9 1 = 5) 0.5;

	testb (f 9 3 = 8) 0.5;

	testb (f 9 10 = 66) 0.5;

	testb (f 10 10 = 290) 0.5;

	testb (f 10 32 = 11405776) 1.;

	testb (f 20 20 = 1071840363190412) 1.;

	testb (f 30 10 = 56962090003246) 1.;
	
	testb (f 32 10 = 806844323190414) 1.



(* ----- RESULTAT ----- *)
let () = Printf.printf "\nScore obtenu : %.2f / %.2f\n" !score !score_total(*;
let oc = open_out_gen [Open_append] 666 "../Notes.txt" in
Printf.fprintf oc "%.3f\n" !score;
close_out oc*)