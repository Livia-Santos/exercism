class Scrabble
  attr_reader :word
  LETTER_VALUES = {
    ['A','E','I','O','U','L','N','R','S','T'] => 1,
    ['D','G'] => 2,
    ['B','C','M','P'] => 3,
    ['F','H','V','W','Y'] => 4,
    ['K'] => 5,
    ['J', 'X'] => 8,
    ['Q', 'Z'] => 10
  }

  def initialize(word)
    word ||= ""
    @word = word.upcase.split("")
  end

  def self.score(word)
    new(word).score
  end

  def score
    word_score = []
    LETTER_VALUES.map do |letters, value|
      word.each do |char|
        word_score << value if letters.include?(char)
      end
    end
    word_score.reduce(0, :+)
  end
end
