require_relative "./game.rb"

class CLI
  attr_reader :game
  def initialize
    # run
    @game = game
  end
  # def run
    # puts "Your input is: #{ARGV[0]}"
  # end

  def run
    @game = Scrabble::Game.new()
  end
end


new_game = CLI.new()
