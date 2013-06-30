def merge_sort array
	# Divide
	return array if array.size < 2   # break condition for Divide
	left = array[0..(array.size / 2) - 1]
	right = array[(array.size/2)..array.size - 1]

	# Combine
	combine_sort(merge_sort(left), merge_sort(right))
end

def combine_sort(left_a, right_a)
	sorted_a = []
	left_a.push(Float::MAX)
	right_a.push(Float::MAX)

	while left_a.size > 1 || right_a.size > 1
		if left_a.first <= right_a.first
			sorted_a << left_a.shift
		else
			sorted_a << right_a.shift
		end
	end
	sorted_a
end