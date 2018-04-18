module Scrabble
  class Dictionary
    attr_reader :dictionary_text, :valid_words
    def initialize
      @dictionary_text = {}
      create_dictionary_hash
    end

    def create_dictionary_hash
      File.open("../data/dictionary.txt", "r") do |f|
        f.each_line do |line|
          @dictionary_text[line.strip] = true;
        end
      end
    end

    def validate_words(word)
      if @dictionary_text[word]
        return true
      end
    end

  end
end
