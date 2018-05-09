module Scrabble
  class Scoring
    def self.score_words(valid_words, letter_points)
      word_scores = {}
      valid_words.each do |word|
        current_score = 0
        word.split("").each do |char|
          current_score += letter_points[char].to_i
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
      puts "="* 30 + "RESULTS" + "=" * 30
      best_words = high_score[1].sort.uniq
      best_words.each do |word|
        puts "#{word.upcase} - #{high_score[0]}"
      end
    end
  end
end
