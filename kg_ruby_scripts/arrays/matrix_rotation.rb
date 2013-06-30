require_relative "matrix"

# Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees.
# Can you do this in place?
# Assuming matrix is of size nxn

##############################
# Using another data structure
##############################
def rotate_by_90(matrix)
	matrix_rotated = []
	column_index = matrix.size - 1
	while column_index >= 0
		row = []
		(0..matrix.size - 1).each do |row_index|
			row << matrix[row_index][column_index]
		end
		matrix_rotated << row
		column_index -= 1
	end
	matrix_rotated
end

###################
# Doing it in place
###################
def rotate_by_90_in_place(matrix)
	n = matrix.size
	# rotation must be done n/2 times = number of layers
	(0..((n / 2) - 1)).each do |layer|  # this loop goes diagnolly
		(layer..n - 2 - layer).each do |row_index|  	# this loop goes across elements in the column
																			# you don't have to go till n -1 since last elemnt already done cyclically
			matrix = run_element_replacement(matrix, row_index, layer)
		end
  end
  matrix
end

def run_element_replacement(matrix, start_row_index, start_column_index)
	n = matrix.size
	next_row_index = start_row_index
	next_column_index = start_column_index

	start_element_value = matrix[start_row_index][start_column_index]

	3.times do
		matrix[next_row_index][next_column_index] = matrix[next_column_index][n - 1 - next_row_index]

		tmp =  next_row_index
		next_row_index = next_column_index
		next_column_index = n - 1 - tmp
	end
	matrix[next_row_index][next_column_index] = start_element_value
	matrix
end


matrix = [	[5,6,7,8],
						[9,3,4,2],
						[3,6,8,6],
						[5,9,3,1]  ]

Matrix::pretty_print(matrix)

puts "\n Matrix after rotation"
Matrix::pretty_print(rotate_by_90(matrix))

puts "\n Matrix after rotation (in place)"
Matrix::pretty_print(rotate_by_90_in_place(matrix))