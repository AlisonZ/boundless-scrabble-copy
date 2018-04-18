module Scrabble
  class Scoring
    def self.score_words(valid_words)
      scoreboard = self.create_scoreboard
      word_scores = {}
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
