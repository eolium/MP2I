let cree_fun_mult =
  fun p ->
    fun x -> p*x

let _ = Printf.printf "%d\n" ((cree_fun_mult 4) 4)