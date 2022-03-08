exp = ARGV.join(' + ')
sum = 0
ARGV.each {|ar| sum = sum + ar.to_i }
# sum = ARGV.inject(0){|subtotal, arg| subtotal + arg.to_i}      #shorter description using inject()
puts "#{exp} = #{sum}"
#
# file r/w
File.open("text.txt", 'a'){|f|
    f.puts Time.now
}

File.open("text.txt", 'r'){|f|
    f.each_line do |line|
        puts "#{f.lineno}: #{line}"
    end
}