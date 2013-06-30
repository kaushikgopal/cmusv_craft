# simple binary search of an array of integers using recursion
class BinarySearchArrayRecursion
	NOT_FOUND = "not found"
	attr_reader :integers

	def initialize
		@integers = [1, 6, 9, 13, 14, 32, 86, 99, 120, 190, 220]
	end

	def find_me num, min_position = 0, max_position = @integers.size

		mid = ((max_position - min_position) / 2).floor + min_position

		comparison = num <=> @integers[mid]

		if max_position == min_position && comparison != 0
			NOT_FOUND
		end

		case comparison
		when -1
			max_position = mid-1
			if min_position > max_position
				NOT_FOUND
			else
				find_me num, min_position, max_position
			end
		when 1
			min_position = mid+1
			if min_position > max_position
				NOT_FOUND
			else
				find_me num, min_position, max_position
			end
		when 0
			mid
		end

	end
end


bs = BinarySearchArrayRecursion.new

puts "99 is at index: #{bs.find_me 99}"
puts "6 is at index: #{bs.find_me 6}"
puts "10 is at index: #{bs.find_me 10}"
puts "220 is at index: #{bs.find_me 220}"


# Key takeaway : your max and min should respectively be - and +