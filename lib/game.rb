require_relative "./dictionary.rb"

module Scrabble
  class Game
    attr_reader :dictionary, :player, :valid_words
    def initialize
      @dictionary = dictionary
      # @player = player
      @valid_words = []
      # @scoreboard
      create_dictionary
      # create_scoreboard
    end


    def create_dictionary
      @dictionary = Scrabble::Dictionary.new()
    end

    # def create_player
    #   @player = Scrabble::Player.new
    # end

    # this is what is gonna kick it off and get all the permutations and validate and THEN score
    def find_highest_score
      # get letters from players
      find_permutations("CREB_AL")
      puts @valid_words
      # find scores
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
          if @dictionary.validate_words(word) && !@valid_words.include?(word)
            @valid_words.push(word)
          end
        end
        i +=1
      end
    end

  end
end

my_game = Scrabble::Game.new()
my_game.find_highest_score
