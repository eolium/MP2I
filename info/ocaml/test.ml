let rec for_ a b f = if a < b then let _ = f a in for_ (a+1) b f
