let mot = char list

let rec mots_ternes_aux mot n =
  if List.length mot = n then mot else
  if List.length mot = n-1 then 'a'::mot else

  match mot with
  | ['a'] -> (mots_ternes 'b'::mot n) @ (mots_ternes 'c' n)
  | 