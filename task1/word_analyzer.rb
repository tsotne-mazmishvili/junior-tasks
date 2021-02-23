class WordAnalyzer
	attr_reader :duplicated_letters

	def count_duplicates(string)
		string = string.downcase
		@duplicated_letters = {}

		string.each_char do |letter|
			next if duplicated_letters.include?(letter)
			count = string.count(letter)
			duplicated_letters[letter] = count if count > 1
		end

	duplicated_letters
	end

	def get_duplicates(duplicated_letters=@duplicated_letters)
		answer = ""
		return "0 # no duplicates" if (duplicated_letters.empty?)

		answer += duplicated_letters.count.to_s + "# "

		duplicated_letters.each do |key, value|
			answer += "'" + key.to_s + "'-> " + value.to_s + "times "
		end

		return answer
	end
end





