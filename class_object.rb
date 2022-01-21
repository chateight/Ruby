#{}
#{ attr_accessor & meta class }
#{ class method is a singular method of Class object. }
#{}
class Duration
    def initialize(since, till)
        @since = since
        @till = till
    end
    attr_accessor :since, :till     # attr_accessor is a meta expression generating some methods internally
    class << self       # meta class
        def a_week_from(from)   # "def self.a_week_from(from)" is a class method style.
            return self.new(from, from+7*24*60*60)
        end
    end
end
duration = Duration.new(Time.now, Time.now + 3600)
puts duration.till                  # actually, "till" and "since" are methods, not variables
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
        return private_one  # in this case, private_one is callable since it exists inside of the class.
    end
    public :public_one  # override the difinition
end
some=SomeOne.new
some.public_one
#some.private_one    # NoMethodError is occured since privte_one has no access permission from outside of the class.
#{}
#{ singular method & singleton }
#{}
CENTRAL_REPOSITORY =Object.new  # "CENTRAL_REPOSITORY" is an instance of the Object class.
def CENTRAL_REPOSITORY.register(target) # define the singular method(register). singular method is an instance of a singular class.
    @registerd_objects ||=[]    # ||=[] is a self-assignment operator ( if "@registerd_objects" is false or nil empty array would be defined, else nothing happens. )
    unless @registerd_objects.include? target
        p @registerd_objects << target    #  -> [1], add to the last position of the arrangement "@registerd_objects" 
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
