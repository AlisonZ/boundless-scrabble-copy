require_relative "./dictionary.rb"
require_relative "./scoring.rb"
require_relative "./letter_points.rb"
require_relative "./player.rb"

module Scrabble
  class Game
    attr_reader :dictionary, :player, :valid_words, :letter_points, :player
    def initialize
      @dictionary = dictionary
      @letter_points = letter_points
      @player = player
      create_dictionary
      create_letter_points
      start_game
    end

    def create_dictionary
      @dictionary = Scrabble::Dictionary.new()
    end

    def create_letter_points
      @letter_points = Scrabble::LetterPoints.new().letter_points
    end

    def start_game
      puts "Welcome to a new game!"

      # TODO: create player :belongs_to game relationship with database to not have to pass game to player
      game = self

      @player = Scrabble::Player.new(game)
    end



    # def blank_tiles(letters)
    #   # this is a lot of processing and makes the program slow
    #   # is there a way to do this more effective, different approaches?
    #   # Nil words were being saved in the array of valid words, used compact! as a quick solution to get rid of them
    #   # with more time, i would identify where and why Nil is getting saved in the array and would remedy the code
    #   ('a'..'z').each do |letter|
    #     new_letters = letters.gsub(/(_)/, letter )
    #     @valid_words.push(find_permutations(new_letters))
    #   end
    #   @valid_words.compact!
    # end

  end
end

@game = Scrabble::Game.new()
