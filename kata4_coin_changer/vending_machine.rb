class VendingMachine

	def get_num_of_coins (total_amt, denomination_array)
		
		output = []		
		
		denomination_array.sort.reverse.each_with_index do |denomination, index|
			output[index] = total_amt/denomination
			total_amt = total_amt%denomination
		end

		output.reverse

	end

end