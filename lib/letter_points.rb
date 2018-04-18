module Scrabble
  class LetterPoints
    attr_reader :letter_points

    def initialize
      @letter_points = {}
      create_letter_points
    end

    def create_letter_points
      File.open("../data/points.txt", "r") do |f|
        f.each_line do |line|
          line.strip!
          @letter_points[line[0].downcase] = line[2..line.length]
        end
      end
    end
  end
end
