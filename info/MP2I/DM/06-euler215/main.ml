(* Main. Ce fichier est à vous, faites-y ce que vous voulez. *)


(* Lecture de horizontal et vertical depuis 
  la ligne de commande de lancement.

  Pour rappel, argv (ici Sys.argv) est le tableau des
  mots utilisés dans le terminal pour lancer le programme.
  Par exemple : 
    ./main.exe 32 10
  donne le tableau :
    [|"./main.exe"; "32"; "10"|]
*)
let () =
  if Array.length Sys.argv <> 3 then begin
    Printf.printf "Usage :\n%s horizontal vertical\n" Sys.argv.(0);
    flush stdout;
    failwith "input_error"
  end;
  let horizontal = int_of_string Sys.argv.(1) in
  let vertical = int_of_string Sys.argv.(2) in

  let nb = Euler215.euler215 horizontal vertical in
  Printf.printf "Solution en %dx%d : %d\n" horizontal vertical nb