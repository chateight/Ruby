exp = ARGV.join(' + ')
sum = 0
ARGV.each {|ar| sum = sum + ar.to_i }
#sum = ARGV.inject(0){|subtotal, arg| subtotal + arg.to_i}      #shorter description using inject()
puts "#{exp} = #{sum}"
