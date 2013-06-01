class Cell
	attr_accessor :alive, :location
	def initialize
		@alive = false
		@location = [0,0]
	end

	def alive?
		@alive
	end

	def neighbor_locations

		neighbor_locations = []

		neighbor_locations << top_left
		neighbor_locations << top_right
		neighbor_locations << top_middle
		neighbor_locations << bottom_left
		neighbor_locations << bottom_right
		neighbor_locations << bottom_middle

		neighbor_locations << left
		neighbor_locations << right

	end

	private

	def top_left
		[@location[0]-1, @location[1]+1]
	end
	def top_right
		[@location[0]+1, @location[1]+1]
	end
	def top_middle
		[@location[0], @location[1]+1]
	end

	def bottom_left
		[@location[0]-1, @location[1]-1]
	end
	def bottom_right
		[@location[0]+1, @location[1]-1]
	end
	def bottom_middle
		[@location[0], @location[1]-1]
	end

	def left
		[@location[0]-1, @location[1]]
	end
	def right
		[@location[0]+1, @location[1]]
	end



end