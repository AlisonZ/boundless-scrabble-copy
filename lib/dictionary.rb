require_relative "./scoring.rb"

module Scrabble
  class Dictionary
    attr_reader :dictionary, :valid_words
    def initialize
      @dictionary = {}
      @valid_words = []
      create_dictionary_hash
    end

    def create_dictionary_hash
      File.open("../data/dictionary.txt", "r") do |f|
        f.each_line do |line|
          @dictionary[line.strip] = true;
        end
      end
    end

    def blank_tiles(letters)
      # this is a lot of processing and makes the program slow
      # is there a way to do this more effective, different approaches?
      ('a'..'z').each do |letter|
        new_letters = letters.gsub(/(_)/, letter )
        @valid_words.push(find_permutations(new_letters))
      end

    end

    def find_permutations(letters)
        letters.downcase!
        if letters.include?("_")
          return blank_tiles(letters)
        end

        letters_arr = letters.split("")
          # start with 2 letter words and continue to find perms up to number of letters
        i = 2
        while i <= letters.length
          perms = letters_arr.permutation(i).to_a
          perms.each do |p|
            word = p.join("")
            validate_words(word)
          end
          i +=1
        end
      Scoring.score_words(@valid_words.flatten)
    end

    def validate_words(word)
      if @dictionary[word] && !@valid_words.include?(word)
        @valid_words.push(word)
      end
    end

  end
end


# letters = "CREB_AL"
letters = "ARPNNLA"
# letters = "YPOBINX"
# letters = "istf"

my_game = Scrabble::Dictionary.new
my_game.find_permutations(letters)
