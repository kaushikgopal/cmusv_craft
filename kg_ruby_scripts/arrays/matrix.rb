module Matrix
	def self.pretty_print(matrix)
		(matrix.size).times {print "-"}
		puts ""
		matrix.each do |row|
			row.each do |element|
				print " #{element} "
			end
			puts ""
		end
		(matrix.size).times {print "-"}
	end
end