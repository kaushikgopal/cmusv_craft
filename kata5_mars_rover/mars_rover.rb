require_relative "./obstacle"

class MarsRover
	attr_accessor :coordinates, :direction, :boundary, :obstacle_hit
	FORWARD = 1
	BACKWARD = -1

	def initialize(coordinates = [0,0], direction = "N", boundary = [100,100])
		@coordinates = coordinates
		@direction = direction
		@boundary = boundary
		@obstacle_hit = false
	end

	def move command_array
		command_array[0].chars.each do |command|
			move_single command
			# move_single_alg command
		end
	end

	private

	def move_single command
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
			@coordinates[1]+=1
			@coordinates[1] = 0 if @coordinates[1] > @boundary[1]
		when "b"
			@coordinates[1]+=(-1)
			@coordinates[1] = @boundary[1] if @coordinates[1] == -1
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
			@coordinates[1]+=(-1)
			@coordinates[1] = @boundary[1] if @coordinates[1] == -1
		when "b"
			@coordinates[1]+=(1)
			@coordinates[1] = 0 if @coordinates[1] > @boundary[1]
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
			@coordinates[0]+=(1)
			@coordinates[0] = 0 if @coordinates[0] > @boundary[0]
		when "b"
			@coordinates[0]+=(-1)
			@coordinates[0] = @boundary[0] if @coordinates[0] == -1
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
			@coordinates[0]+=(-1)
			@coordinates[0] = @boundary[0] if @coordinates[0] == -1
		when "b"
			@coordinates[0]+=(1)
			@coordinates[0] = 0 if @coordinates[0] > @boundary[0]
		when "r"
			@direction = "N"
		when "l"
			@direction = "S"
		else
			puts "couldn't understand the command '#{command}'"
		end	
	end	
end