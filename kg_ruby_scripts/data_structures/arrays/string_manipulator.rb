class StringManipulator

########################################################################
# Implement an algorithm to determine if a string has all unique
# characters. Assuming case insenstivity
########################################################################

	# The Ruby way
	def self.is_string_unique_1 sample_string
		sample_string.downcase.split("").size == sample_string.downcase.split("").uniq.size
	end

	# Using a Hash
	def self.is_string_unique_2 sample_string
		hash_char_count = {}
		sample_string.chars.each do |char|
			hash_char_count[char.downcase] ||= 0
			hash_char_count[char.downcase] += 1
		end

=begin
		string_unique = true
		hash_char_count.values.each do |el|
			if el > 1
				string_unique = false
				break
			end
		end
		string_unique
=end
		(hash_char_count.values.select { |e| e > 1 }).size < 1
	end

	# Improvement - use a boolean array of size 256
	# makes assumption that only valid ASCII characters involved

	# What if you can not use additional data structures?
	def self.is_string_unique sample_string
		0.upto(sample_string.size - 1) do |i|
			(i + 1).upto(sample_string.size - 1) do |j|
				return false if sample_string[j].downcase == sample_string[i].downcase
			end
		end
		true
	end

########################################################################
# Design an algorithm and write code to remove the duplicate characters
# in a string without using any additional buffer. NOTE: One or two
# additional variables are fine. An extra copy of the array is not.
# FOLLOW UP : Write the test cases for this method.
########################################################################
	def self.remove_duplicate_characters sample_string
		return nil unless sample_string
		return if sample_string.empty?

		# sample_string_array = sample_string.split("")
		# sample_string_array.each_index do |index_outer|
		# 	(index_outer + 1).upto(sample_string_array.size - 1) do |index_inner|
		# 		sample_string_array.delete_at(index_inner) if sample_string_array[index_inner] == sample_string_array[index_outer]
		# 	end
		# end
		# sample_string_array.join


		(0).upto(sample_string.size - 1) do |index_outer|

			index_inner = index_outer + 1
			while index_inner < sample_string.size
				if sample_string[index_outer] == sample_string[index_inner]
					sample_string[index_inner] = ""
				else
					index_inner += 1
				end
			end
		end
		sample_string
	end

#####################
# Check Palindrome
#####################
	def self.check_palindrome_1 sample_string_1, sample_string_2
		# The Ruby way
		sample_string_1.reverse == sample_string_2
	end
	def self.check_palindrome_2 sample_string_1, sample_string_2
		# Algo way
		return false if sample_string_1.nil? || sample_string_2.nil?
		return false if sample_string_1.size == 0 || sample_string_2.size == 0
		return false if sample_string_1.size != sample_string_2.size
		size = sample_string_1.size
		index = 0
		while index < size
			break if sample_string_1[index] != sample_string_2[size - 1 - index]
			index += 1
		end
		if index == sample_string_1.size
			true
		else
			false
		end
	end

#####################
# Check Anagram
#####################
	def self.check_anagrams sample_string_1, sample_string_2

		sample_string_tmp = sample_string_2.clone

		return false if sample_string_1.nil? || sample_string_2.nil?
		return false if sample_string_1.size == 0 || sample_string_2.size == 0
		return false if sample_string_1.size != sample_string_2.size
		0.upto(sample_string_1.size - 1) do |index_1|
			0.upto(sample_string_tmp.size - 1) do |index_2|
				if sample_string_tmp[index_2] == sample_string_1[index_1]
					sample_string_tmp[index_2] = ""
					break
				else
					return false if index_2 == sample_string_tmp.size - 1
				end
			end
		end
		if sample_string_tmp.size == 0
			true
		else
			false
		end
	end


	###########
	# TESTING
	###########

	def self.test_string_uniqueness
		ss = "kaushik"
		puts "String #{ss} uniqueness = #{StringManipulator.is_string_unique ss}"
		puts "String #{ss} uniqueness = #{StringManipulator.is_string_unique_1 ss}"
		puts "String #{ss} uniqueness = #{StringManipulator.is_string_unique_2 ss}"
	end

	def self.palindrome_checker
		[
			["god", "dog"],
			["god", "god"],
			["god", "we trust"],
			["god", ""]
		].each do |sample_strings|
			puts "---------------------------------- "
			puts "Two strings #{sample_strings[0]} and #{sample_strings[1]} are palindromes :" + StringManipulator.check_palindrome_1(sample_strings[0], sample_strings[1]).to_s
			puts "Two strings #{sample_strings[0]} and #{sample_strings[1]} are palindromes :" + StringManipulator.check_palindrome_2(sample_strings[0], sample_strings[1]).to_s
		end
	end

	def self.anagram_checker
		[
			["abcd", "dcba"],
			["abcd", "dbca"],
			["abcd", "aaa"],
			["caaab", "aaabc"],
			["aaa", "aaa"]
		].each do |ss|
			puts "#{ss[0]} and #{ss[1]} are anagrams : #{StringManipulator.check_anagrams ss[0], ss[1]}"
		end

	end
end
