# encoding: Shift_JIS
#{ char code setting: magic comment need to be scribed at the top of files }
require "fileutils"
#{}
#{ argument sample}
#{ usage sample "ruby in_out.rb 3 6 10"}
#{ inject() initialize the 'subtotal' }
#{}
exp = ARGV.join(' + ')
sum = ARGV.inject(0){|subtotal, arg| subtotal + arg.to_i}
puts "#{exp} = #{sum}"
#{}
#{ file append and read}
#{}
File.open("file.txt", 'a'){|f|
    f.puts Time.now
}
#{}
File.open("file.txt", 'r'){|f|
    contents = f.read
    puts contents
}
#{}
#{ bit constant, in this case RDONLY & using iterator }
#{}
puts "\n"
File.open("file.txt", File::RDONLY){|f|
        f.each_line do |line|
        puts "#{f.lineno}: #{line}"
    end
}
#{}
#{ read the last line of a file, probablly not so fast }
#{}
puts "\n"
File.open("file.txt", File::RDONLY){|f|
    puts f.readlines[f.count-1]
}
#{}
#{ duck typing }
#{ use like "in_out.rb file.txt"}
#{}
puts "\n"
def read_two_bytes(io)
    return [io.read(1), io.read(1)]
end
File.open(ARGV[0]){|f| read_two_bytes(f)}
puts read_two_bytes(ARGF)
#{}
#{ StringIO is the wrapper class of the IO class }
#{ this is one example of the duck typing }
#{}
require 'stringio'
buffer = String.new
sio = StringIO.new(buffer)
$stderr = $stdout = sio
puts "untuh"
warn "outed"
puts "\n"
puts buffer
$stdout =STDOUT
puts buffer         #{ buffer is empty }
#{}
#{ char coding }
#{}
s = "さがみおおやま"
puts s.encoding     #{ => Shift_JIS }



