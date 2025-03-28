let rec print_first_lines_aux file n =
  if n <> 0 then
    try
      let _ = Printf.printf "%s\n" (input_line file) in
      print_first_lines_aux file (n-1)
    with
      | End_of_file -> ()

let print_first_lines filename n =
  let f = open_in filename in

  let _ = print_first_lines_aux f n in

  close_in f

let _ = print_first_lines "le_lac_lamartine.txt" 0

let rec copy_file filename new_filename =
  let f1 = open_in filename in
  let f2 = open_out new_filename in

  let _ = copy_file_aux f1 f2 in

  let _ = close_in f in
  let 

  try
    let l = input_line f1 in
    let _ = output_string f2 l in
    copy_file f1 f2
  with
    | End_of_file -> 
      let _ = close_in f1 in
      close_out f2

let _ = copy_file "le_lac_lamartine.txt" "v2.txt"