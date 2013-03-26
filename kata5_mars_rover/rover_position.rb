class RoverPosition

	attr_accessor :x_coordinate, :y_coordinate, :direction

	def initialize(x=0, y=0, d="N")
		set_position(x, y, d)
	end

	def set_position(x, y, d)
		@x_coordinate = x
		@y_coordinate = y
		@direction = d
	end
end