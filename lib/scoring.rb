module Scrabble
  class Scoring
    # TODO: how to get these to initialize and use these instance variables?
    # attr_reader :scoreboard
    # def initialize
    #   @word_scores = {}
    #   create_scoreboard
    # end


    def self.create_scoreboard
      scoreboard = {}
      File.open("../data/points.txt", "r") do |f|
        f.each_line do |line|
          line.strip!
          scoreboard[line[0].downcase] = line[2..line.length]
        end
      end
      return scoreboard
    end


    def self.score_words(valid_words)
      scoreboard = self.create_scoreboard
      word_scores = {}
      # # # puts "This is the scoreboard #{scoreboard}"
      # # # puts "This is the valid_words #{valid_words}"
      # # # think of a different way to do this - not happy about the On*m complexity
      # # # puts "this is the word_scores #{scoreboard}"
      valid_words.each do |word|
        current_score = 0
        word.split("").each do |char|
          current_score += scoreboard[char].to_i
          if word_scores[current_score]
            word_scores[current_score] += [word]
          else
            word_scores[current_score] = [word]
          end
        end
      end
      self.find_highest_score(word_scores)
    end


    def self.find_highest_score(word_scores)
      self.report_findings(high_score = word_scores.max_by{|k,v| k})
    end

    def self.report_findings(high_score)
      best_words = high_score[1].sort.uniq
      best_words.each do |word|
        puts "#{word.upcase} - #{high_score[0]}"
      end
    end
  end
end

# letters = "ARPNNLA"
# # letters = "CREB_AL"
# # letters = "YPOBINX"
# # letters = "istf"
#
# # TODO: organize classes and where this can be effective
# def play_game(letters)
#   my_game = Scrabble.new
#   results =  my_game.find_permutations(letters)
#   best_words = results[1].sort.uniq
#   best_words.each do |word|
#     puts "#{word.upcase} - #{results[0]}"
#   end
# end
#
# play_game(letters)
# my_score = Scrabble::Scoring.new
# my_score.score_words
