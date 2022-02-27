
#{ special string : excute os command, not secure function and similar function as other languages }
p `date`    #{ output date }
p `pwd`     #{ output current directory }

#{ here document }
str_here = <<"ES"
    here is a "sample" of 
    the hear document
ES
p str_here      #{ -> "    here is a \"sample\" of \n    the hear document\n"}

#{ partial string }
music = <<EOS
here come the sun.
by beetles
hotel calfornia.
by eagles
EOS

music["here come the sun."] = "abbey road"          #{ this changes only first found string if you want to change all of then, use gsub() function }
music.each_line{
    |i|
    print music[i]
}

#{ repeat strings }
p "------ symbol operator -----"
p "let's do that! "*5

#{ reverse the string }
p "let's do that! ".reverse

#{ format string}
p "----- format print ------"
p sprintf("%03d", 3)
p sprintf("%08.6f", Math::PI)

#{ symbol}
p "------ symbol is unique & light weight -----"
str1 = "ruby"
str2 = "ruby"   #{ different object }

p str1.equal? str2

sym1 = :ruby
sym2 = :ruby    #{ same object }

p sym1.equal? sym2
