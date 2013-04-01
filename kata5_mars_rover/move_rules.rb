class MoveRules


	def self.get_next_position(current_rover_position, move, boundary)

		@final_rover_position = RoverPosition.new(current_rover_position.x_coordinate, current_rover_position.y_coordinate, current_rover_position.direction)
		@boundary = boundary

		case current_rover_position.direction
		when "N"
			move_from_north move
		when "S"
			move_from_south move
		when "E"
			move_from_east move
		when "W"
			move_from_west move
		end
		return @final_rover_position
	end

	private

	def self.move_from_north move
		turn_east if move == "r"
		turn_west if move == "l"
		if move == "f"
			increase_y_coordinate
		end
		if move == "b"
			decrease_y_coordinate
		end
	end

	def self.move_from_south
		turn_west if move == "r"
		turn_east if move == "l"
		if move == "f"
			decrease_y_coordinate
		end
		if move == "b"
			increase_y_coordinate
		end
	end

	def self.move_from_east
		turn_south if move == "r"
		turn_north if move == "l"
		if move == "f"
			increase_x_coordinate
		end
		if move == "b"
			decrease_x_coordinate
		end
	end

	def self.move_from_west
		turn_north if move == "r"
		turn_south if move == "l"
		if move == "f"
			decrease_x_coordinate
		end
		if move == "b"
			increase_x_coordinate
		end
	end

	def self.increase_x_coordinate
		@final_rover_position.x_coordinate += 1
		correct_out_of_bounds_x
	end

	def self.decrease_x_coordinate
		@final_rover_position.x_coordinate -= 1
		correct_out_of_bounds_x
	end

	def self.increase_y_coordinate
		@final_rover_position.y_coordinate += 1
		correct_out_of_bounds_y
	end

	def self.decrease_y_coordinate
		@final_rover_position.y_coordinate -= 1
		correct_out_of_bounds_y
	end

	def self.turn_east
		@final_rover_position.direction = "E"
	end

	def self.turn_west
		@final_rover_position.direction = "W"
	end

	def self.turn_south
		@final_rover_position.direction = "S"
	end

	def self.turn_north
		@final_rover_position.direction = "N"
	end

	def self.correct_out_of_bounds_x
		boundary_x_coordinate = @boundary[0]
		@final_rover_position.x_coordinate = 0 if @final_rover_position.x_coordinate > boundary_x_coordinate			# Ef Wb
		@final_rover_position.x_coordinate = boundary_x_coordinate if @final_rover_position.x_coordinate == -1  	# Eb Wf
	end

	def self.correct_out_of_bounds_y
		boundary_y_coordinate = @boundary[1]
		@final_rover_position.y_coordinate = 0 if @final_rover_position.y_coordinate > boundary_y_coordinate					# Nf;Sb
		@final_rover_position.y_coordinate = boundary_y_coordinate if @final_rover_position.y_coordinate == -1  			# Nb Sf
	end


end