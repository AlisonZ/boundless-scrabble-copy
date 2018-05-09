require_relative "./dictionary.rb"
require_relative "./scoreboard.rb"
require_relative "./letter_points.rb"
require_relative "./player.rb"

module Scrabble
  class Game
    attr_reader :dictionary, :player, :valid_words, :letter_points, :player
    # accessor because will need to read and write on it to modify scoreboard when words are played
    attr_accessor :scoreboard
    def initialize
      @dictionary = dictionary
      @letter_points = letter_points
      @player = player
      @scoreboard = Scrabble::Scoreboard.new()
      create_dictionary
      create_letter_points
      start_game
    end


    # TODO: remove these create and just have new instance on initialization
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
