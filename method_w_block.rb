#{ method with block }

def block_method
    yield "a"
    yield "b"
    yield "c"
end
  
block_method do |x|
    puts x
end
