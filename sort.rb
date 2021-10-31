#{ sort }

Array_str = ["23", "123", "67", "12"]
p Array_str.sort
#{ sort after converting to integer }
p Array_str.sort{|x, y| x.to_i <=> y.to_i}

