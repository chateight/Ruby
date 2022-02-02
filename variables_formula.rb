#{}
#{ variables are only refernce to objects. }
#{}
def mod(arg1)
    str = arg1
    p str
    str[1] = ?l
    p str
end
arg = "omni"
mod(arg)
p arg
#{}
#{ constant is also variables, but following redefinition causes Ruby error message. }
#{}
CONS = 3
CONS = 4
puts CONS
# SYSTEM CONSTANT
puts RUBY_VERSION
# pseudo CONSTANT
puts __LINE__       # to show the current line number in the code
puts __ENCODING__
#{}
#{ :: scope resolver }
#{}
class A
    Age = 10
end
class B
    Age = 20
end
class C
    Age = 30
end
puts B::Age
#{}
#{ conditional operator }
#{}
a = false
var = a ? "abc" : "ABC"     # if "a" is ture then var = "abc", else var ="ABC"
puts var
#{}
#{ controlled formula }
#{}
class Sample
    @@color = "green"
    def colo_ret
        return @@color
    end
end
sample = Sample.new
thought = if sample.colo_ret == "green" then
    "safe"
else
    "undefined"
end
puts thought
#{}
#{ for -> each replacement }
#{}
for i in [1, 3, 9, 27] do
    puts i
end
#{ equivalent to the above }    # using a iterator is a common sense in Ruby
[1, 3, 9, 27].each do |i|
    puts i
end
#{ another style of loop handling }
#{ "loop", "times" & "downto" are also typical iterator. }
0.upto(5){|i| puts i }
#{ "break", "redo" and "next" work as an interuptor. }
str = "fdfsgfjljl"
str.each_byte do |byte|
    next if byte == 0x66 or byte == 0x6a
    printf "%x\n", byte
end
str.each_char do |chr|
    next if chr == "d" or chr == "j"
    printf chr + "\n"
end
#{}
#{ exception }
#{ $! : system variable which contains last Exception info. }
#{}
begin
    y = 1/0
rescue ArgumentError => error
    puts error.message
rescue => another_error
    puts another_error.message
ensure
    puts Time.now
end
#{ raise the exception }
begin
    raise "raise the error"
rescue => another_error
    puts another_error.message
end
#{}
#{ global escape which "catch/throw" clause make. }
#{}
catch(:exit){ 
    loop do 
        loop do
            throw :exit     # escape from the catch clause
        end
    end
}
puts "quit"