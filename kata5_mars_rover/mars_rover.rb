require_relative "./rover_position"
require_relative "./move_rules"
require_relative "./obstacle"

class MarsRover
	attr_accessor :rover_position, :boundary, :obstacle_hit, :obstacle_handler, :stop_on_hitting_obstacle

	def initialize(boundary = [100,100])
		reset_rover_position
		@boundary = boundary

		@obstacle_hit = false
		@obstacle_handler = Obstacle.new
		@stop_on_hitting_obstacle = false
	end
	def reset_rover_position
		@rover_position = RoverPosition.new
	end

	def move command_array
		command_array[0].chars.each do |single_command|
			move_single single_command
			break if @obstacle_hit && @stop_on_hitting_obstacle
		end
	end

	private

	def move_single command
		destination_rover_position = MoveRules.get_next_position(@rover_position, command, @boundary)
		unless obstacle_handler.is_obstacle_present?([destination_rover_position.x_coordinate, destination_rover_position.y_coordinate])
			@rover_position = destination_rover_position
			@obstacle_hit = false
		else
			@obstacle_hit = true
		end

	end

end