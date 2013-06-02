class Floor
	attr_accessor :floor_number, :rooms
	def initialize floor_number
		@floor_number = floor_number
	end
	def room room_type
		@rooms ||= []
		@rooms << room_type
	end
	def room_desc
		room_description = "("
		@rooms.each do |room|
			room_description << "#{room}, "
		end
		room_description = room_description[0..-3]
		room_description << ")"
	end
end

class House
	attr_accessor :name, :floors
	def initialize name
		@name = name
		@floors = []
	end

	def floor floor_number, &block
		floor = Floor.new floor_number
		floor.instance_eval(&block)
		@floors << floor
	end

	def to_s
		puts "House named #{@name} has #{@floors.size} floors."
		@floors.each do |floor|
			puts "Floor #{floor.floor_number} has #{floor.rooms.size} rooms #{floor.room_desc}."
		end

# House named home has 2 floors.
# Floor 1 has 2 rooms (den, kitchen)
# Floor 2 has 2 rooms (bedroom, bathroom)
	end

end


class CustomHouse

	def self.build name, &block
		house = House.new name
		house.instance_eval(&block)
		house
	end

end



# Build DSL for below

house1 = CustomHouse.build :home do
  floor(1) {
    room :den
    room :kitchen
  }

  floor(2) {
    room :bedroom
    room :bathroom
  }
end

house1.to_s

# calling to_s on the instance of House which gets returned),
# House named home has 2 floors.
# Floor 1 has 2 rooms (den, kitchen)
# Floor 2 has 2 rooms (bedroom, bathroom)