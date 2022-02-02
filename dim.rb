#{}
# map
#{}
acids = ["adenin", "thymine", "guanine", "cytosine"]
signs = acids.map{|array| array[0,1]}           # map{&:some_method} : this(&:) calls some_method
p signs
