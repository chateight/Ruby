#{ hash }
book_author = {"ruby" => "thomas", "program" => "matz"}
p book_author["ruby"]
book_author["way"] = "fulton"
p book_author
book_author["way"] = ["fulton", "mils"]
p book_author
book_author["way"] = "new"
p book_author


