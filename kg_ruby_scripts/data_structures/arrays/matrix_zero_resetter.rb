require_relative "matrix"

def set_column_row_to_zero(matrix)
	# iterate and collect all elements
	row_size = matrix.size - 1
	column_size = matrix[0].size - 1
	reset_tracker = []

	(0..row_size).each do |row_index|
		(0..column_size).each do |column_index|
			reset_tracker << [row_index, column_index] if matrix[row_index][column_index] == 0
		end
	end

	reset_tracker_rows = []
	reset_tracker_columns = []
	reset_tracker.each do |element|
		reset_tracker_rows << element[0]
		reset_tracker_columns << element[1]
	end

	reset_tracker_rows.uniq.each { |row_number| matrix = set_row_to_zero(matrix, row_number) }
	reset_tracker_columns.uniq.each { |column_number| matrix = set_column_to_zero(matrix, column_number) }

	matrix
end

def set_row_to_zero(matrix, row_number)
	(0..matrix.size - 1).each do |column_index|
		matrix[row_number][column_index] = 0
	end
	matrix
end
def set_column_to_zero(matrix, column_number)
	(0..matrix.size - 1).each do |row_index|
		matrix[row_index][column_number] = 0
	end
	matrix
end


matrix = [	[5,6,7,8],
						[9,3,0,2],
						[3,6,8,6],
						[5,3,3,1]  ]
puts "\n ****** Before reseting *******"
Matrix::pretty_print(matrix)
puts "\n ****** after reseting *******"
Matrix::pretty_print(set_column_row_to_zero(matrix))