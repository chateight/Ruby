#{}
#{ '' vs "" }
#{}
y = 10
puts 'y = #{y}'
puts "y = #{y}"

#{}
#{ here document & partial string }
#{}
str = <<EOS
Solmon,
Christ,
Sapiens,
Took.
EOS
#{ counts \n as a char }
p str[0], str[1, 4], str[str.length - 1], str[str.length]
#{ replacing char }
str["Solmon"] = "Sapiens"
p str
#{ replace all matched strings destructively }
str.gsub!(/Sapiens/, "Homo")
p str
#{ iterator }
str.each_line do |line|
    print line
end
#{ format }
puts "%04d" % 32
#{}
#{ symbol effectiveness, so symboles are immmutable }
#{}
str1 = "ruby"
str2 = "ruby"
p str1.equal? str2
sym1 = :ruby
sym2 = :ruby
p sym1.equal? sym2

