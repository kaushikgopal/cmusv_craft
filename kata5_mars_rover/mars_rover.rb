require_relative "./obstacle"

class MarsRover
	attr_accessor :coordinates, :direction, :boundary, :obstacle_hit, :obstacle_handler, :stop_on_hitting_obstacle

	def initialize(coordinates = [0,0], direction = "N", boundary = [100,100])
		reset_rover_position
		@boundary = boundary
		
		@obstacle_hit = false
		@obstacle_handler = Obstacle.new
		@stop_on_hitting_obstacle = false
	end
	def reset_rover_position
		@coordinates = [0,0]
		@direction = "N"
	end

	def move command_array
		command_array[0].chars.each do |single_command|
			move_single single_command
			break if @obstacle_hit && @stop_on_hitting_obstacle
		end
	end

	private

	def move_single command
		@x_coordinate_destination = @coordinates[0]
		@y_coordinate_destination = @coordinates[1]
		case @direction
			when "N"
				move_north command
			when "S"
				move_south command
			when "E"
				move_east command
			when "W"
				move_west command
		end
	end
	
	def move_north command
		case command.downcase
			when "f"
				@y_coordinate_destination+=1
				@y_coordinate_destination = 0 if @y_coordinate_destination > @boundary[1]
				move_if_obstacle_not_hit @x_coordinate_destination, @y_coordinate_destination
			when "b"
				@y_coordinate_destination-=1
				@y_coordinate_destination = @boundary[1] if @y_coordinate_destination == -1
				move_if_obstacle_not_hit @x_coordinate_destination, @y_coordinate_destination
			when "r"
				@direction = "E"
			when "l"
				@direction = "W"
			else
				puts "couldn't understand the command '#{command}'"
		end
	end
	def move_south command
		case command.downcase
			when "f"
				@y_coordinate_destination-=1
				@y_coordinate_destination = @boundary[1] if @y_coordinate_destination == -1
				move_if_obstacle_not_hit @x_coordinate_destination, @y_coordinate_destination
			when "b"
				@y_coordinate_destination+=1
				@y_coordinate_destination = 0 if @y_coordinate_destination > @boundary[1]
				move_if_obstacle_not_hit @x_coordinate_destination, @y_coordinate_destination
			when "r"
				@direction = "W"
			when "l"
				@direction = "E"
			else
				puts "couldn't understand the command '#{command}'"
		end
	end
	def move_east command
		case command.downcase
			when "f"
				@x_coordinate_destination+=1
				@x_coordinate_destination = 0 if @x_coordinate_destination > @boundary[0]
				move_if_obstacle_not_hit @x_coordinate_destination, @y_coordinate_destination
			when "b"
				@x_coordinate_destination-=1
				@x_coordinate_destination = @boundary[0] if @x_coordinate_destination == -1
				move_if_obstacle_not_hit @x_coordinate_destination, @y_coordinate_destination
			when "r"
				@direction = "S"
			when "l"
				@direction = "N"
			else
				puts "couldn't understand the command '#{command}'"
		end	
	end
	def move_west command
		case command.downcase
			when "f"
				@x_coordinate_destination-=1
				@x_coordinate_destination = @boundary[0] if @x_coordinate_destination == -1
				move_if_obstacle_not_hit @x_coordinate_destination, @y_coordinate_destination
			when "b"
				@x_coordinate_destination+=1
				@x_coordinate_destination = 0 if @x_coordinate_destination > @boundary[0]
				move_if_obstacle_not_hit @x_coordinate_destination, @y_coordinate_destination
			when "r"
				@direction = "N"
			when "l"
				@direction = "S"
			else
				puts "couldn't understand the command '#{command}'"
		end	
	end	

	def move_if_obstacle_not_hit x_coordinate, y_coordinate
		unless obstacle_handler.is_obstacle_present?([x_coordinate,y_coordinate])
			@coordinates = [x_coordinate, y_coordinate]
			@obstacle_hit = false
		else
			@obstacle_hit = true
		end
	end


end