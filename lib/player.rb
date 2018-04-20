module Scrabble
  class Player
    attr_reader :name, :letters, :word
    def initialize
      @name = name
      @letters = letters
      @word = word
      begin_game
    end

    def get_letters

      letters = gets.chomp

      if letters.length < 2
        puts "You must enter at least two letters to play a word"
        puts "Let's try again! Enter your letters:"
        get_letters
      end

      if letters !~ /[^A-Za-z_]/ && letters.count('_') <= 2
        @letters = letters
      else
        puts "_" * 75
        puts "You can only enter letters and two '_' for blank tiles"
        puts "Try again!"
        get_letters
      end

    end

    def get_name
      puts "What's your name?"
      @name = gets.chomp
      choose_game
    end

    def choose_game
      puts "Select a number to determine how you would like to proceed:"
      puts " " * 50
      puts "1. Enter my letters and find the highest scoring word I can play"
      puts "2. Play a word and get the score"
      puts "3. End game"
      selection = gets.chomp
      if selection === "1"
        puts "Great! Enter your letters and I can tell you what your best play(s) are!"
        get_letters
      elsif selection === "2"
        puts "Enter the word you would like to play."
        get_word
      elsif selection === "3"
        return
      else
        puts "Please start again. You have entered an incorrect response."
        choose_game
      end
    end

    def get_word
      @word = gets.chomp
    end

    def begin_game
      get_name
    end
  end
end
