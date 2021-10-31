#{ iterator }
(1..100).each do |i|
    case i % 15
    when 0 then puts "fitbu"
    when 3, 6, 9, 12 then puts "fit"
    when 5, 10 then puts "bu"
    else puts i
    end
end

