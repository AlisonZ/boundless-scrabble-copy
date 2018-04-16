module Scrabble
  class Scoring
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
