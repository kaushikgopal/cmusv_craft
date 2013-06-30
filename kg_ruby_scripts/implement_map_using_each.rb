#####################################################
# implement map using each
#####################################################


class Array
	def my_map
		new_array = []
		self.each do |el|
			new_array << yield(el)
		end
		new_array
	end
end

mapped = [1, 2, 3].my_map{|i| i + 1}
puts mapped.inspect
# => [2, 3, 4]


class Array
	def my_map &block
		new_array = []
		self.each do |el|
			new_array << instance_exec(el, &block)
		end
		new_array
	end
end

mapped = [1, 2, 3].my_map{|i| i + 1}
puts mapped.inspect
# => [2, 3, 4]