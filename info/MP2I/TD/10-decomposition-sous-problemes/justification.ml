(* On représente les données par un tableau lmots *)

let ex_sujet = [| 2.; 4.; 2.; 6.; 6. |]
let long_sujet = 10.


let score lmots long_max =
  let d_mem = Array.make (Array.length lmots +1) None in
  
  let cout i j =
    let esp = float_of_int j -. float_of_int i in
    let sum = ref (long_max -. esp) in
    for k = i to j do
      sum := !sum -. lmots.(k)
    done;
    if !sum < 0. 
    then Float.infinity
    else !sum ** 2.
  in
  
  let rec d i =
    if d_mem.(i) = None then begin
      if i = Array.length lmots
      then d_mem.(i) <- Some 0.
      else begin
        (* initialiser le min avec j = i+1 *)
        let mini = ref (d (i+1) +. cout i i) in
        (*caculer le min *)
        for j = i+2 to Array.length lmots do
          let c = cout i (j-1) in
          mini := min !mini (d j +. c)
        done;
        d_mem.(i) <- Some !mini
      end
    end
    ;
    Option.get d_mem.(i)
  in
  
  d 0 


let _ = Printf.printf "%f\n" (score ex_sujet long_sujet)