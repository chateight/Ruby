#{}
#{ attr_accessor }
#{}
class Duration
    def initialize(since, till)
        @since = since
        @till = till
    end
    attr_accessor :since, :till
end
duration = Duration.new(Time.now, Time.now + 3600)
puts duration.till              # actually, till and since are methods, not variables
puts duration.since = Time.now  # attr_accessor is meta expression generating some methods internally
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
