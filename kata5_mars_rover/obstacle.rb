class Obstacle
	attr_accessor :obstacle	
	
	def initialize(obstacles = [])
		@obstacle = [obstacles]
	end

	def add_obstacle(cell_coordinates = [])
		@obstacle << cell_coordinates unless cell_coordinates.empty?
	end
	def is_obstacle_present?(cell_coordinates)
		@obstacle.include? cell_coordinates
	end

end