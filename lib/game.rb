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
      @valid_words = []
      create_dictionary
      create_letter_points
      start_game
    end

    # to make these create functions more expandable, alter to take in the text file
    # then will be able to play in different languages
    def create_dictionary
      @dictionary = Scrabble::Dictionary.new()
    end

    # used separate class to capture that different languages will have different letters and different point systems
    # debated putting this in the Scoring class, but because scoring methods will be the same across games, kept that separate
    # interested in feedback/a discussion on this approach
    def create_letter_points
      @letter_points = Scrabble::LetterPoints.new().letter_points
    end

    def start_game
      puts "Welcome to a new game!"
      @player = Scrabble::Player.new()
      if @player.letters
        find_highest_score(@player.letters)
      elsif @player.word
        find_word_score(@player.word)
      end
    end

    def find_highest_score(letters)
      find_permutations(letters)
      if @valid_words.length === 0
        puts "Sorry - there are no valid words with those letters"
      else
        Scoring.score_words(@valid_words, @letter_points)
      end
    end

    def find_word_score(word)
      puts "Please stand by! This feature coming soon."
    end


    def blank_tiles(letters)
      # this is a lot of processing and makes the program slow
      # is there a way to do this more effective, different approaches?
      # Nil words were being saved in the array of valid words, used compact! as a quick solution to get rid of them
      # with more time, i would identify where and why Nil is getting saved in the array and would remedy the code
      ('a'..'z').each do |letter|
        new_letters = letters.gsub(/(_)/, letter )
        @valid_words.push(find_permutations(new_letters))
      end
      @valid_words.compact!
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

@game = Scrabble::Game.new()
# puts @game.class
