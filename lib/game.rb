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
  end
end

@game = Scrabble::Game.new()
