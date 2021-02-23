require_relative 'word_analyzer'

def count_duplicates_in_word
  puts "enter word: "
  word_analyzer = WordAnalyzer.new
  word_analyzer.count_duplicates(gets.chomp)
  puts word_analyzer.get_duplicates
end

count_duplicates_in_word