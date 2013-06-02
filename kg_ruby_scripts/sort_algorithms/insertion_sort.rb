# given an array [21, 54, 20, 99, 34, 27, 27], using insertion sort
# algorithm get a sorted list out

def insertion_sort(array)
	return array if array.size < 2

	(1).upto(array.size - 1) do |new_element_index|
		current_index = new_element_index
		new_element = array[new_element_index]
		while new_element < array[current_index - 1] && current_index > 0
			array[current_index] = array[current_index - 1]
			current_index -= 1
		end
		array[current_index] = new_element
	end
	array
end