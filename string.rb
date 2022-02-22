
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
hotel calforrnia.
eagles
EOS

music.each_char{
    |i|
    p music[i]
}
