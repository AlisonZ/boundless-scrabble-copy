module Scrabble
  # Player can be expanded to keep track of points scored, words played, etc.
  class Player
    attr_reader :name, :letters, :word
    def initialize
      @name = name
      @letters = letters
      @word = word
      begin_game
    end


    # added some command line/user-interface and added an example of how to add additional play feature
    def begin_game
      puts "What's your name?"
      @name = gets.chomp

      puts "Select a number to determine how you would like to proceed:"
      puts "1. Enter my letters and find the highest scoring word I can play"
      puts "2. Play a word and get the score"
      selection = gets.chomp
      #
      if selection === "1"
        puts "Great! Enter your letters and I can tell you what your best play(s) are!"
        # can add checks in here to see if the user entered the correct letters or wants to re-enter
        # add edge case checks in here
        @letters = gets.chomp

      elsif selection === "2"
        puts "Enter the word you would like to play."
        @word = gets.chomp
      else
        puts "Please start again. You have entered an incorrect response."
      end

    end
  end
end
