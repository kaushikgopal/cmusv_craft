# require "./book_type.rb"
class Potter

	attr_accessor :total_book_qty, :book1_qty, :book2_qty, :book3_qty, :book4_qty, :book5_qty

	BOOK_COST = 8
	BOOK_DISCOUNT = { 1 => 1, 2 => 0.95, 3 => 0.9, 4 => 0.8, 5 => 0.75, }

	# write code to calculate the price of any conceivable shopping basket, as big a discount as possible.
	def calc(basket = [])
		
		parse_basket(basket)

		if @total_book_qty == @book1_qty || @total_book_qty == @book2_qty || @total_book_qty == @book3_qty || @total_book_qty == @book4_qty || @total_book_qty == @book5_qty 
			# Only one book variety is bought
			return @total_book_qty * BOOK_COST
		elsif @book1_qty < 2 && @book2_qty < 2 && @book3_qty < 2 && @book4_qty < 2 && @book5_qty < 2 && @total_book_qty > 0
			# No book is bought twice
			return @total_book_qty * BOOK_COST * BOOK_DISCOUNT[@total_book_qty]
		else
			# Some books may be bought twice						

			# --------------
			# Create "stacks"
			# --------------
			
			# create the correct amount of stacks
      max_number_of_stacks = basket.values.max
			stacks_created = false
			stack_hash = {}


			# OPTIMIZE with Ruby magic?
			[
				[:book1, @book1_qty],
				[:book2, @book2_qty],
				[:book3, @book3_qty],
				[:book4, @book4_qty],
				[:book5, @book5_qty]
			].each do |book, qty|
					if qty == max_number_of_stacks && !stacks_created
						while qty > 0
							key = "s"+qty.to_s        # creating a stack s1, s2, s3 etc. containing one book of the book_type with maximum count.
							stack_hash[key] = [book]
							reduce_book_quantity(book, 1)
							qty = qty - 1
						end
						stacks_created = true
					end
			end

      # add all books to one of the stacks (making sure stacks are unique)
			[
				[:book1, @book1_qty],
				[:book2, @book2_qty],
				[:book3, @book3_qty],
				[:book4, @book4_qty],
				[:book5, @book5_qty]
			].each do |book, qty|
				if qty > 0					
						(1..max_number_of_stacks).each do |n|
							key = "s"+n.to_s
							unless stack_hash[key].nil? || stack_hash[key].include?(book) || qty < 1
								stack_hash[key] << book
								reduce_book_quantity(book, 1)
								qty = qty - 1
							end
						end
				end
			end

      # ------------------
      # optimize the stacks
      # ------------------
      # look for maximum count
      # see the minimum count

      max_stack_size = 0
      max_stack_name = ""
      min_stack_size = 100
      min_stack_name = ""
			o_computed_weight = 0

      while max_stack_size - min_stack_size > 1 || max_stack_name == ""

      	o_computed_weight = 0
        # find the biggest and smallest stack
        stack_hash.each do |stack_name, book_array|
					
					o_computed_weight = o_computed_weight + book_array.length * BOOK_DISCOUNT[book_array.length]

          if book_array.length > max_stack_size
            max_stack_size = book_array.length
            max_stack_name = stack_name
          end
          if book_array.length < min_stack_size
            min_stack_size = book_array.length
            min_stack_name = stack_name
          end
        end


        # doing a deep_copy
        tmp_stack_hash = Marshal.load(Marshal.dump(stack_hash))

        # if the difference between them is more than 2 attempt a transfer of book to different stack
        if max_stack_size - min_stack_size > 1
        	transfer_book(tmp_stack_hash, max_stack_name, min_stack_name) 
						# reset
    	      max_stack_size = 0
			      max_stack_name = ""
			      min_stack_size = 100
        end

        n_computed_weight = 0
        tmp_stack_hash.each do |stack_name, book_array|
        	n_computed_weight = n_computed_weight + book_array.length * BOOK_DISCOUNT[book_array.length]
        end

        if o_computed_weight > n_computed_weight
        	stack_hash = tmp_stack_hash
        else
          break
        end

      end

			cost = 0
			# calculate cost by iterating through each hash
			stack_hash.each do |book_name, unique_book_list|
				book_count = unique_book_list.length
				case book_count 
				when 1
					cost = cost + (book_count * BOOK_COST)
				when 2
					cost = cost + (book_count * BOOK_COST * 0.95)
				when 3
					cost = cost + (book_count * BOOK_COST * 0.9)
				when 4
					cost = cost + (book_count * BOOK_COST * 0.8)
				when 5
					cost = cost + (book_count * BOOK_COST * 0.75)
				end
			end

			return cost

		end


	end		


	def transfer_book(trf_stack_hash, from_stack_name, to_stack_name)
		# Expecting stack names
		from_stack = trf_stack_hash[from_stack_name]
		to_stack = trf_stack_hash[to_stack_name]
		book_to_be_transferred = nil
		transferred = false
		
		from_stack.each do |book|
			if !(to_stack.include?(book)) && !transferred
				to_stack << book
				transferred = true
				book_to_be_transferred = book
			end
		end
		# remove the book from from_stack
		from_stack.delete(book_to_be_transferred)
	end

	def reduce_book_quantity(book, qty)
		case book
		when :book1
			@book1_qty = @book1_qty - qty
		when :book2
			@book2_qty = @book2_qty - qty
		when :book3
			@book3_qty = @book3_qty - qty
		when :book4
			@book4_qty = @book4_qty - qty
		when :book5
			@book5_qty = @book5_qty - qty
		end
	end


	def parse_basket(basket)
		# clear out values
		@book1_qty = basket[:book1] unless basket[:book1].nil?
		@book2_qty = basket[:book2] unless basket[:book2].nil?
		@book3_qty = basket[:book3] unless basket[:book3].nil?
		@book4_qty = basket[:book4] unless basket[:book4].nil?
		@book5_qty = basket[:book5] unless basket[:book5].nil?
		@total_book_qty = @book1_qty + @book2_qty + @book3_qty + @book4_qty + @book5_qty
	end

	# CONSTANTS
	# BOOK1 = "Philosopher's Stone"
	# BOOK2 = "Chamber of Secrets"
	# BOOK3 = "Prisoner of Azkaban"
	# BOOK4 = "Goblet of Fire"
	# BOOK5 = "Order of the Phoenix"
	
	# BOOK6 = "(Unreleased) Half-Blood Prince"
	# BOOK7 = "(Unreleased) Deathly Hallows"

end