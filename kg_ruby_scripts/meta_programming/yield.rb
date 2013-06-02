def call_block
    puts "Start of the method"
    puts "do something"
    yield
    puts "End of the method"
end

call_block { puts "In the block" }



def a_method(a, b)
	a + yield(a, b)
end

puts a_method(1,2) { |x,y| (x+y)*3 } #=>10




def a_method
	return yield if block_given?
	'no block'
end
a_method
a_method { "here's a block!" }
# => "no block"
# => "here's a block!"
