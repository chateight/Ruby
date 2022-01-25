#{}
#{ attr_accessor & meta class }
#{ class method is a singular method of a Class object. }
#{}
class Duration
    def initialize(since, till)
        @since = since
        @till = till
    end
    attr_accessor :since, :till     # attr_accessor is a meta expression generating some methods internally
end
class Duration  # ruby is a open class language, so you can extend the class.
    class << self       # meta class is defined as a singular class of a Class object.
        def a_week_from(from)   # same as "def Duration.a_week_from(from)".
            return self.new(from, from+7*24*60*60)
        end
    end
end
duration = Duration.new(Time.now, Time.now + 3600)
puts duration.till                  # actually, "till" and "since" are methods using accessor, not variables
puts duration.since = Time.now
puts Duration.a_week_from(Time.now).till    # the return object contains instance variables.
#{}
#{ alias and redefiniton of the predefined method }
#{}
class Fixnum
    alias original_addition +
    def +(base)
        original_addition(base).succ   # succ returns succeeded number
    end
end
puts 1+1
#{}
#{ access right }
#{}
class SomeOne
    def public_method; end
    private
    def private_one; end
    def public_one
        return private_one  # in this case, "private_one" is callable since it exists inside of the class.
    end
    public :public_one  # override the difinition
end
some=SomeOne.new
some.public_one
#some.private_one    # NoMethodError will be occured since "privte_one" has no access permission from outside of the class.
#{}
#{ singular method & singleton }
#{}
CENTRAL_REPOSITORY = Object.new  # "CENTRAL_REPOSITORY" is an instance of the Object class.
                                #
                                # if singular class difinition is needed, "class << CENTRAL_REPOSITORY" is a description.
                                # and in case of method definition, you don't need to use a class name. i.e. "def register(target)"
def CENTRAL_REPOSITORY.register(target) # define the singular method(register). singular method is an instance method of the singular class.
    @registerd_objects ||=[]    # ||=[] is a self-assignment operator ( if "@registerd_objects" is false or nil, an empty array would be defined, else nothing happens. )
    unless @registerd_objects.include? target
        p @registerd_objects << target    #  -> [1], add to the last position of arrangement "@registerd_objects" 
    end
end
def CENTRAL_REPOSITORY.unregister(target)   # define the singular method(unregister).
    @registerd_objects ||=[]
    @registerd_objects.delete(target)
    p @registerd_objects    
end
CENTRAL_REPOSITORY.register(1)
CENTRAL_REPOSITORY.register(1)      # this will be rejected by "include? target"
CENTRAL_REPOSITORY.unregister(1)    # -> []
#{}
#{ module is called using "include" }
#{ module is introduced to avoid multiple inheritance, provide similar function to the class. }
#{}
class SizeMatters   # https://ruby-doc.org/core-3.1.0/Comparable.html
    include Comparable
    attr :str       # "attr" is a instance mothod which provides read access for instance variables.
    def <=>(other)  # "module" using class need to implement basic operator "<=>" of the Coparable class.
      str.size <=> other.str.size
    end
    def initialize(str)
      @str = str
    end
    def inspect     # "inspect" is an Object class method which returns a readable string.
      @str
    end
end
s1 = SizeMatters.new("Z")
s2 = SizeMatters.new("YY")
s3 = SizeMatters.new("XXX")
s4 = SizeMatters.new("WWWW")
s5 = SizeMatters.new("VVVVV")
p s1 < s2                       # -> true
p s4.between?(s1, s3)           # -> false
p s4.between?(s3, s5)           # -> true
p [ s3, s2, s5, s4, s1 ].sort   # -> [Z, YY, XXX, WWWW, VVVVV]
p Comparable.ancestors          # -> [Comparable] : since "Comparable" is a module, not a class.
                                # module is a function set. so it could not be instantiated.
