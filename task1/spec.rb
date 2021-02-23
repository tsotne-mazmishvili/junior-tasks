require 'rspec/autorun'
require_relative 'word_analyzer'

describe 'duplicates counter' do
  let(:word_analyzer) { WordAnalyzer.new }

  it 'checks if first letters are duplicates' do
    word_analyzer.count_duplicates("vvvabaco")

    expect(word_analyzer.duplicated_letters.count).to eq 2
    expect(word_analyzer.duplicated_letters.values[0]).to eq 3
  end

  it 'checks if last letters are duplicates' do
    word_analyzer.count_duplicates("vabacoooo")

    expect(word_analyzer.duplicated_letters.count).to eq 2
    expect(word_analyzer.duplicated_letters.values[1]).to eq 4
  end

  it 'checks case-insensitive' do
    word_analyzer.count_duplicates("Vvabaco")

    expect(word_analyzer.duplicated_letters.count).to eq 2
    expect(word_analyzer.duplicated_letters.values[0]).to eq 2
  end

  it 'checks if no duplicates' do
    word_analyzer.count_duplicates("vbaco")

    expect(word_analyzer.duplicated_letters.count).to eq 0
  end

  it 'checks if numbers in string' do
    word_analyzer.count_duplicates("Vabaco11")

    expect(word_analyzer.duplicated_letters.count).to eq 2
    expect(word_analyzer.duplicated_letters.values[1]).to eq 2
  end


end

