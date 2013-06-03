class PigLatin

	VOWELS = %w(a e i o u)

	def translate(word)
		if starts_with_vowel?(word)
			return perform_vowel_replacement(word)
		elsif starts_with_normal_chars?(word)
			return perform_consonant_replacement(word)
		end
		word
	end

	private

	def starts_with_vowel?(word)
		VOWELS.include?(word[0].downcase)
	end

	def starts_with_normal_chars?(word)
		(word[0] =~ /^[[:alpha:]]/)
	end

	def perform_consonant_replacement(word)
		word_array = word.split("")

		shift_char_count = 0
		word_array.each do |char|
			shift_char_count += 1 unless starts_with_vowel?(char)
			break if starts_with_vowel?(char)
		end

		word_array.push(	word_array.shift(shift_char_count)
																.map(&:downcase)
																.push("ay")
																.join)

		word_array[0] = word_array[0].upcase if starts_with_upcase?(word)
		word_array.join
	end

	def perform_vowel_replacement(word)
		word << "way"
	end

	def starts_with_upcase?(word)
		word[0] == word[0].upcase
	end

end