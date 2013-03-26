class MarsRover
	attr_accessor :coordinates, :direction
	FORWARD = 1
	BACKWARD = -1

	def initialize
		@coordinates = [0,0]
	end

	def move command_array
		command_array[0].chars.each do |command|
			move_single command
		end
	end

	private

	def move_single command
		case @direction
		when "N"
			move_north command
		when "S"
			move_south command
		end
	end


	def move_north command
		case command.downcase
		when "f"
			@coordinates[1]+=1
		when "b"
			@coordinates[1]+=(-1)
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
		when "b"
			@coordinates[1]+=(1)
		when "r"
			@direction = "W"
		when "l"
			@direction = "E"
		else
			puts "couldn't understand the command '#{command}'"
		end
	end

end