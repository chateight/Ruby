#{}
#{ spaceship operator }
#{}
if (10 <=> 8) == 1 then     #{ redundant, only for confirmation }
    p "large"
end
p 3 <=> 3   # => 0
p 7 <=> 20  # => -1

#{}
#{ arithmetic function }
#{}
p Math.acos(0)              #{ PI/2 }
p Math.log(2.7182)          #{ almost 1 }
p Math::log(2.7182)         #{ different expression }

#{}
20.downto(0) do |i|
    print 3[i]              #{ print out from msb to lsb, Ruby handle bit array as infinite stream }
end

