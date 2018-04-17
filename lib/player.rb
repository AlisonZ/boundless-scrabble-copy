require_relative "./dictionary.rb"

module Scrabble
  # class Player can be expanded to keep track of points scored, words played as well as handle Player word plays
  class Player
    attr_reader :name, :letters
    def initialize
      @name = name
      @letters = letters
    end

    def get_name
      puts "What's your name?"
      @name = gets.chomp
      puts "Welcome #{self.name}!"

      play_letters
    end

    def play_letters
      puts "Enter 7 letters and I'll find the word(s) with the highest score you can make from them!"
      @letters = gets.chomp.downcase!
      puts "The letters you've selected are #{letters}"

      Dictionary.find_permutations(letters)
    end


  end
end

me = Scrabble::Player.new()
me.get_name
# me.name = "Alison"
# puts me.name
