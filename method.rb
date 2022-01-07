p self  # -> main
#{}
#{ definition and usage }
#{ using "inject"}
#{}
def fact(n); (1..n).inject(1){|p,i| p*i} end
p fact(10)
#{}
#{ to return multi values }
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
p array.inject(:+)
#{}
#{ default arugments }
#{ complex formula can be used for the default value }
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

hello_2 = proc do |name|
    puts "Hello, #{name}"
end
  
hello_1.call("bob")
hello_2.call("cathy")
#{}
#{ in this case "self" means some_method, not 3 }
#{}
def some_method
    2.times { p self }
end
some_method()
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
count.call
count.call
count2.call
#{}
#{ yield }
#{}
def foo
    %w(foo bar baz).each do |item|
        yield item
    end
end
foo do |it|
    puts it
end
#{ enum }
[:a, :b, :c].enum_for(:each).map{|i|
    puts i
}
#{ same as above "foo" }
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

