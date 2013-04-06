class MoveRules


	def self.get_next_position(current_rover_position, command, boundary)

		@final_rover_position = RoverPosition.new(current_rover_position.x_coordinate, current_rover_position.y_coordinate, current_rover_position.direction)
		@boundary = boundary

		case current_rover_position.direction
		when "N"
			move_when_facing_north command
		when "S"
			move_when_facing_south command
		when "E"
			move_when_facing_east command
		when "W"
			move_when_facing_west command
		end
		return @final_rover_position
	end

	private

	def self.move_when_facing_north command
		turn_east if command == "r"
		turn_west if command == "l"
		increase_y_coordinate if command == "f"
		decrease_y_coordinate if command == "b"
	end

	def self.move_when_facing_south command
		turn_west if command == "r"
		turn_east if command == "l"
		if command == "f"
			decrease_y_coordinate
		end
		if command == "b"
			increase_y_coordinate
		end
	end

	def self.move_when_facing_east command
		turn_south if command == "r"
		turn_north if command == "l"
		if command == "f"
			increase_x_coordinate
		end
		if command == "b"
			decrease_x_coordinate
		end
	end

	def self.move_when_facing_west command
		turn_north if command == "r"
		turn_south if command == "l"
		if command == "f"
			decrease_x_coordinate
		end
		if command == "b"
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
		@final_rover_position.x_coordinate = boundary_x_coordinate if @final_rover_position.x_coordinate < 0  	# Eb Wf
	end

	def self.correct_out_of_bounds_y
		boundary_y_coordinate = @boundary[1]
		@final_rover_position.y_coordinate = 0 if @final_rover_position.y_coordinate > boundary_y_coordinate					# Nf;Sb
		@final_rover_position.y_coordinate = boundary_y_coordinate if @final_rover_position.y_coordinate < 0  			# Nb Sf
	end


end