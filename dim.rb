#{}
# map
#{}
acids = ["adenin", "thymine", "guanine", "cytosine"]
signs = acids.map{|array| array[0,1]}           # map{&:some_method} : this(&:) calls some_method
p signs
#{}
# hash
#{}
book_to_author = {
    "python" => "flanagan",
    "programing ruby" => "matz"
}
p book_to_author["programing ruby"]
book_to_author["python"] = "rossum"         # to modify the hash
book_to_author["the ruby way"] = "fulton"   # to add a hash element
p book_to_author
p book_to_author["ruby in nutshell"]        # no matching record returns "nil"
book_to_author.delete("python")             # to delete a hash element
p book_to_author
book_to_author.each do |book, author|       # each records are accessed by each method
    p "#{book} by #{author}"
end
p book_to_author.map{|book, author| "#{book} by #{author}"     # similar to each method
}
