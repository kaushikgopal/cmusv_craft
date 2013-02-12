# require "./book_type.rb"
class Potter

	attr_accessor :total_book_qty, :book1_qty, :book2_qty, :book3_qty, :book4_qty, :book5_qty

	BOOK_COST = 8

	# write code to calculate the price of any conceivable shopping basket, as big a discount as possible.
	def calc(basket = [])
		
		parse_basket(basket)

		return 0 if @total_book_qty == 0

		if @total_book_qty == @book1_qty || @total_book_qty == @book2_qty || @total_book_qty == @book3_qty || @total_book_qty == @book4_qty || @total_book_qty == @book5_qty 
			# Only one book variety is bought
			return @total_book_qty * BOOK_COST
		
		elsif @book1_qty < 2 && @book2_qty < 2 && @book3_qty < 2 && @book4_qty < 2 && @book5_qty < 2 && @total_book_qty > 0
			# No book is bought twice

			# 5 different books and you get 25% discount
			return @total_book_qty * BOOK_COST * 0.75 if @total_book_qty == 5
			# 4 different books and you get 20% discount
			return @total_book_qty * BOOK_COST * 0.8 if @total_book_qty == 4
			# 3 different books and you get 10% discount
			return @total_book_qty * BOOK_COST * 0.9 if @total_book_qty == 3
			# 2 different books and you get 5% discount
			return @total_book_qty * BOOK_COST * 0.95 if @total_book_qty == 2
		
		else
			# Some books may be bought twice						

			# -------------------------------------------------------
			# Create "sets" & then optimize the sets
			# -------------------------------------------------------
			
			# --------------
			# Create "sets" 
			# --------------
			
			# create the correct amount of sets
      max_number_of_sets = basket.values.max
			sets_created = false
			set_hash = {}

			puts "-------------------------------"
			[
				["b1", @book1_qty],
				["b2", @book2_qty],
				["b3", @book3_qty],
				["b4", @book4_qty],
				["b5", @book5_qty]
			].each do |book, qty|
				puts "#{book} quantity = #{qty}"
			end
			puts "-------------------------------"


			# OPTIMIZE with Ruby magic?
			[
				[:book1, @book1_qty],
				[:book2, @book2_qty],
				[:book3, @book3_qty],
				[:book4, @book4_qty],
				[:book5, @book5_qty]
			].each do |book, qty|
				if !sets_created
					if qty == max_number_of_sets
						while qty > 0
							key = "s"+qty.to_s
							set_hash[key] = [book]
							reduce_book_quantity(book, 1)
							qty = qty - 1
						end
						sets_created = true
					end
				end
			end
			
			puts set_hash.inspect
			puts "-------------------------------"
			[
				["b1", @book1_qty],
				["b2", @book2_qty],
				["b3", @book3_qty],
				["b4", @book4_qty],
				["b5", @book5_qty]
			].each do |book, qty|
				puts "#{book} quantity = #{qty}"
			end
			puts "-------------------------------"

      # add all books to one of the sets (making sure sets are unique)
			[
				[:book1, @book1_qty],
				[:book2, @book2_qty],
				[:book3, @book3_qty],
				[:book4, @book4_qty],
				[:book5, @book5_qty]
			].each do |book, qty|
				if qty > 0					
						(1..max_number_of_sets).each do |n|
							key = "s"+n.to_s
							unless set_hash[key].nil? || set_hash[key].include?(book) || qty < 1
								set_hash[key] << book
								reduce_book_quantity(book, 1)
								qty = qty - 1
							end
						end
				end
			end


			puts set_hash.inspect
			puts "-------------------------------"
			[
				["b1", @book1_qty],
				["b2", @book2_qty],
				["b3", @book3_qty],
				["b4", @book4_qty],
				["b5", @book5_qty]
			].each do |book, qty|
				puts "#{book} quantity = #{qty}"
			end
			puts "-------------------------------"


      # ------------------
      # optimize the sets
      # ------------------
      # look for maximum count
      # see the minimum count




      max_set_size = 0
      max_set_name = ""
      min_set_size = 100
      min_set_name = ""

      while max_set_size - min_set_size > 1 || max_set_name == ""
        # find the biggest and smallest set
        set_hash.each do |set_name, book_array|
          if book_array.length > max_set_size
            max_set_size = book_array.length
            max_set_name = set_name
          end
          if book_array.length < min_set_size
            min_set_size = book_array.length
            min_set_name = set_name
          end
        end

        # puts "#{max_set_name} is #{max_set_size} and #{min_set_name} is #{min_set_size}"

        # if the difference between them is more than 2, remove and add to one of the other sets.
        if max_set_size - min_set_size > 1
        	transfer_book(set_hash, max_set_name, min_set_name) 
						# reset
    	      max_set_size = 0
			      max_set_name = ""
			      min_set_size = 100
        end

      end

      puts set_hash.inspect
			puts "-------------------------------"

			cost = 0
			# calculate cost by iterating through each hash
			set_hash.each do |book_name, unique_book_list|
				book_count = unique_book_list.length
				case book_count 
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

      puts "cost is #{cost}"
			puts "-------------------------------"
			return cost


			# # -------------------------------------------------------
			# # FIXME Trial 1 - Create 5 sub baskets, where Standard Deviation is least
			# # 
			# # -------------------------------------------------------
			
			# # Start off by creating 5 "sets" for the 5 book types
			
			# set1 = []
			# set2 = []
			# set3 = []
			# set4 = []
			# set5 = []

			# # Go through the basket once, and add a book to each set
			# # OPTIMIZE (i could just use the count and check?)
			# # Horizontal Traversal
			# tmp_basket.each do |book, qty|
			# 	# this will iterate only once for each book
			# 	# add each book to the unique set, to begin with
			# 	case book
			# 	when :book1
			# 		set1 << book if qty > 0
			# 	when :book2
			# 		set2 << book if qty > 0
			# 	when :book3
			# 		set3 << book if qty > 0
			# 	when :book4
			# 		set4 << book if qty > 0
			# 	when :book5
			# 		set5 << book if qty > 0
			# 	end
			# 	qty = qty -1
				
			# 	# remove the book from the hash if 0 quantity
			# 	# OPTIMIZE I don't think i need to do this anymore?
			# 	tmp_basket.tap { |hs| hs.delete(book) } if qty == 0
			# end
			
			# # add only those sets to the hash that actually have elements
			# set_hash[:set1] = set1 if set1.length > 0
			# set_hash[:set2] = set2 if set2.length > 0
			# set_hash[:set3] = set3 if set3.length > 0
			# set_hash[:set4] = set4 if set4.length > 0
			# set_hash[:set5] = set5 if set5.length > 0

			# # Now the other direction
			# # traverse vertically through same book, and add one book to each different set (to maximize uniqueness)
			# # but make sure no duplicates added.
			# tmp_basket.each do |book, qty|
			# 	while qty != 0
			# 		# iterate through your set of hashes
			# 		set_hash.each do |set|
			# 			 # Add the book to a different set until all the other sets
			# 			if !(set.include?(book))
			# 				set << book
			# 				qty = qty -1	
			# 			end
			# 		end
			# 	end
			# end

			# # if there are still some books in the temp basket, they will be charged at single price.
















			# take only sets that have elements?

			# while difference between all sets is 1 or they're =
				# start with the set with the highest count, move to set (with lowest count or difference atleast 1)


			# Take biggest set
				# find smallest set
				#  add one book (unique) to the set
				# repeat loop


		end


	end		


	def transfer_book(set_hash, from_set_name, to_set_name)
		# Expecting set names
		from_set = set_hash[from_set_name]
		to_set = set_hash[to_set_name]
		book_to_be_transferred = nil
		transferred = false
		
		from_set.each do |book|
			if !(to_set.include?(book)) && !transferred
				to_set << book
				transferred = true
				book_to_be_transferred = book
			end
		end
		# remove the book from from_set
		from_set.delete(book_to_be_transferred)
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

		# debugging
		# puts "total book quantity is #{@total_book_qty}"
		# puts "there are #{@book1_qty} book1"
		# puts "there are #{@book2_qty} book2"
		# puts "there are #{@book3_qty} book3"
		# puts "there are #{@book4_qty} book4"
		# puts "there are #{@book5_qty} book5"


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



# require "./potter"
# p = Potter.new
# basket = {:book1 => 5,:book2 => 3,:book3 => 3,:book4 => 0,:book5 => 0}
# p.calc(basket)