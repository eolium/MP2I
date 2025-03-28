let print_2_int a b =
  print_int a;
  print_char '\n';
  print_int b;
  print_char '\n'


let affiche_plein_entiers n =
  for i = 1 to n do
    print_int i;
    print_char '\n'
  done


let print_carre n =
  for i = 1 to n do
    print_char '*'
  done;

  print_char '\n';

  for a = 2 to n-1 do
    print_char '*';
    for b = 2 to n-1 do
      print_char ' '
    done;
    print_char '*';
    print_char '\n'
  done;

  if n > 1 then begin
    for i = 1 to n do
      print_char '*'
    done;

    print_char '\n'
  end


let array_sum tab =
  let s = ref 0 in
  
  for i = 0 to Array.length tab - 1 do
    s := !s + tab.(i)
  done;

  !s


let lit_n_entiers n =
  let tab = Array.make n 0 in

  for i = 0 to Array.length tab - 1 do
    tab.(i) <- Scanf.scanf " %d" Fun.id
  done;

  tab

let print_tab tab =
  for i = 0 to Array.length tab -1 do
    Printf.printf "%d\n" tab.(i)
  done

let tab = lit_n_entiers 10

let _ = print_tab tab

let _ = print_int (array_sum tab)