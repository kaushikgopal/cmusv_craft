class MyHash
	attr_reader :keys, :values
	def initialize key = nil, value = nil
		@keys =[]
		@values =[]
		add_element key, value if key
	end

	def size
		@keys.size
	end

	def add_element key, value
		@keys	<< key
		@values << value
	end


end