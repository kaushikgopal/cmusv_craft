# Fibonacci Series Recursively
# 1 1 2 3 5 8 13 21 34

def fibonacci_number_at_location n
	# Break condition 1
	if n == 0
		return 0
	elsif n == 1
		# Break condition 2
		return 1
	else
		return fibonacci_number_at_location(n-1) + fibonacci_number_at_location(n-2)
	end
end

# puts "fibo sequence for 6 is #{fibonacci_number_at_location 6}"

# Fibonacci Series Iteratively
# 1 1 2 3 5 8 13 21 34

def fibonacci_number_iterative n
		print " Fibo sequence : "
		prev_prev_num = 1
		prev_num = 1
		1.upto(n) do |num|
			if num == 1
				print " #{prev_prev_num}, "
			elsif num == 2
				print "#{prev_num}, "
			else
				tmp = prev_num
				prev_num += prev_prev_num
				prev_prev_num = tmp
				print "#{prev_num}"
				print ", " unless num == n
			end
		end
end

fibonacci_number_iterative 6