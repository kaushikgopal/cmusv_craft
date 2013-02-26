class VendingMachine

	def get_num_of_coins (total_amt, denomination_array)
		
		tmp_total_amt = total_amt
		output = Array.new(denomination_array.length)
		
		denomination_array.sort.reverse.each_with_index do |denomination, index|
			if denomination > tmp_total_amt
					output[index] = 0 
			else
					# we're storing it in the same place as the reversed denomination_array array, so remember to reverse in the end
					output[index] = tmp_total_amt/denomination
					tmp_total_amt = tmp_total_amt%denomination
			end
		end

		output.reverse

	end

end