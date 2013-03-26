class MoveRules


	def self.get_next_position(current_rover_position, move, boundary)

		final_rover_position = RoverPosition.new(current_rover_position.x_coordinate, current_rover_position.y_coordinate, current_rover_position.direction)

		case current_rover_position.direction

			when "N"
				final_rover_position.direction = "E" if move == "r"
				final_rover_position.direction = "W" if move == "l"
				if move == "f"
					final_rover_position.y_coordinate+=1
					final_rover_position.y_coordinate = 0 if final_rover_position.y_coordinate > boundary[1]
				end
				if move == "b"
					final_rover_position.y_coordinate = current_rover_position.y_coordinate - 1
					final_rover_position.y_coordinate = boundary[1] if final_rover_position.y_coordinate == -1
				end

			when "S"
				final_rover_position.direction = "W" if move == "r"
				final_rover_position.direction = "E" if move == "l"
				if move == "f"
					final_rover_position.y_coordinate = current_rover_position.y_coordinate - 1
					final_rover_position.y_coordinate = boundary[1] if final_rover_position.y_coordinate == -1
				end
				if move == "b"
					final_rover_position.y_coordinate = current_rover_position.y_coordinate + 1
					final_rover_position.y_coordinate = 0 if final_rover_position.y_coordinate > boundary[1]
				end

			when "E"
				final_rover_position.direction = "S" if move == "r"
				final_rover_position.direction = "N" if move == "l"
				if move == "f"
					final_rover_position.x_coordinate = current_rover_position.x_coordinate + 1
					final_rover_position.x_coordinate = 0 if final_rover_position.x_coordinate > boundary[0]
				end
				if move == "b"
					final_rover_position.x_coordinate = current_rover_position.x_coordinate - 1
					final_rover_position.x_coordinate = boundary[0] if final_rover_position.x_coordinate == -1
				end

			when "W"
				final_rover_position.direction = "N" if move == "r"
				final_rover_position.direction = "S" if move == "l"
				if move == "f"
					final_rover_position.x_coordinate = current_rover_position.x_coordinate - 1
					final_rover_position.x_coordinate = boundary[0] if final_rover_position.x_coordinate == -1
				end
				if move == "b"
					final_rover_position.x_coordinate = current_rover_position.x_coordinate + 1
					final_rover_position.x_coordinate = 0 if final_rover_position.x_coordinate > boundary[0]
				end
		end

		return final_rover_position

	end



end