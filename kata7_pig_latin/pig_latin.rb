class PigLatin

	VOWELS = %w(a e i o u)

	def translate(text)
		text_array = text.split(" ")
		split_period_into_independent_characters(text_array)
					.each_with_index { |word, index| text_array[index] = translate_word(word) }
		join_back_period_to_previous_words(text_array).join(" ")
	end

	private

	def split_period_into_independent_characters(text_array)
		text_array.each_with_index do |word, index|
			if word.end_with?(".") && word.size > 1
				text_array[index] = word[0..-2]
				text_array.insert(index + 1, ".")
			end
		end
	end

	def join_back_period_to_previous_words(text_array)
		text_array.each_index do |index|
			if text_array[index + 1] == "."
				text_array[index] << "."
				text_array[index + 1] = nil
			end
		end.compact
	end

	def translate_word(word)
		if starts_with_vowel?(word)
			return perform_vowel_replacement(word)
		elsif starts_with_normal_chars?(word)
			return perform_consonant_replacement(word)
		end
		word
	end

	def starts_with_vowel?(word)
		VOWELS.include?(word[0].downcase)
	end

	def starts_with_normal_chars?(word)
		word[0] =~ /^[[:alpha:]]/
	end

	def starts_with_upcase?(word)
		word[0] == word[0].upcase
	end

	def perform_vowel_replacement(word)
		word << "way"
	end

	def perform_consonant_replacement(word)
		word_array = word.split("")
		word_array.push(word_array.shift(get_number_of_consonants_to_shift(word))
															.map(&:downcase))
		word_array[0] = word_array[0].upcase if starts_with_upcase?(word)
		word_array.push("ay").join
	end

	def get_number_of_consonants_to_shift(word)
		num_of_chars_to_shift = 0
		prev_char_was_q = (word[0].downcase == "q")

		word.split("").each do |char|
			num_of_chars_to_shift += 1 if !starts_with_vowel?(char) || prev_char_was_q
			break if starts_with_vowel?(char) && !prev_char_was_q
			prev_char_was_q = (char.downcase == "q")
		end

		num_of_chars_to_shift
	end
end