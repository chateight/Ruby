p self  # -> main
#{}
#{ definition and usage }
#{ using "inject" : convolutional function }
#{}
def fact(n); (1..n).inject(1){|p,i| p*i} end
p fact(10)
#{}
#{ to return multiple values }
#{}
def some_method(a)
    [a, 1, 2, 4]
end
a, b, *c = some_method(0)
puts a, b, c
#{}
#{ symbol could be used as follows, just as symbol operator }
#{}
array = 1..6
p array.inject(:+)      # return the total sum of the array
#{}
#{ default arugments }
#{ complex formula can be used for defining the default value }
#{}
def d_method(a, b=10)
    p a+b
end
d_method(10)
d_method(10, 20)
#{}
#{ method with block }
#{}

hello_1 = Proc.new do |name|
    puts "Hello, #{name}"
end

hello_2 = proc do |name|            # "proc" equals to "Proc.new"
    puts "Hello, #{name}"
end
  
hello_1.call("bob")
hello_2.call("cathy")
#{}
#{ in this case "self" means "some_method" }
#{}
def some_method
    3.times { p self }
end
some_method()
#{ enum }
[:a, :b, :c].enum_for(:each).map{|i|
    puts i
}
#{}
#{ keeping the instance of the method with block }
#{}
def counter 
    count = 1
    return Proc.new do
        count += 1
        p count
    end
end
count = counter
count2 = counter
p count.class
count.call      # call excute Proc block
count.call
count2.call
#{}
#{ yield }
#{}
def foo
    %w(foo bar baz).each do |item|      # "%w" is used to express array
        yield item
    end
end
foo do |it|                             # block is executed by "yield"
    puts it
end
#{ same as above "foo" method}
def foo1
    return enum_for(foo bar baz) unless block_given?
    %w(foo bar baz).each do |item|
        yield item
    end
end
foo1 do |it|
    puts it
end
#{}
#{ using Proc object }
#{ argument &handler stores caller block as a Proc object }
#{ so, & + call == yield }
#{ following two examples show same meaning. }
#{}
class SleepyPerson
    def register_handler(&handler)
        @event_handler = handler
    end
    def wake_up!
        @event_handler.call Time.now, "woke up"
    end
end
john = SleepyPerson.new
john.register_handler {|time, message| p [time, message]}
john.wake_up!
# using Proc instead of &
class SleepyPerson1
    def register_handler(handler)
        @event_handler = handler
    end
    def wake_up!
        @event_handler.call Time.now, "woke up"
    end
end
handle = Proc.new {|time, message| p [time, message]}   # to make Proc object from the block instead of define the "&"" variable
lenon = SleepyPerson1.new
lenon.register_handler(handle)
lenon.wake_up!

#{}
#{ "->"" is a lambda literal }
#{}
add_proc = ->(a, b) { a + b }       # "->(a, b) { a + b }" equals to "lambda { |a, b| a + b }"
p add_proc.call(1, 2)               # lambda expression also make a Proc object 
