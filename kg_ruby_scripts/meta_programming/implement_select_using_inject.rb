#####################################################
# implement select using inject
#####################################################

# Using Yield
class Array
	def my_select
		# use inject here
		self.inject ([]) do |result, element|
			result << element if yield element
			result
		end
	end
end

temp = [1, 2, 3].my_select { |elem| elem % 2 == 0 }
puts temp.inspect