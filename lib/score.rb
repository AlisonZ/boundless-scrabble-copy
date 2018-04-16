
# TODO: add class structure
# put the dictionary hash and scoreboard creator in the class for starting new game of Scrabble
def create_dictionary_hash
  dictionary = {}
  File.open("../data/dictionary.txt", "r") do |f|
    f.each_line do |line|
      dictionary[line.strip] = true;
    end
  end
  return dictionary
end

def create_scoreboard
  scoreboard = {}

  File.open("../data/points.txt", "r") do |f|
    f.each_line do |line|
      line.strip!
      scoreboard[line[0].downcase] = line[2..line.length]
    end
  end

  return scoreboard

end


# class Score
def find_permutations(letters)
  letters.downcase!
  perms_arr = []
  letters_arr = letters.split("")

  # start with 2 letter words and continue to find perms up to number of letters
  i = 2
  while i <= letters.length
    # get permutation for length of i
    perms = letters_arr.permutation(i).to_a

    # add each permutation to the perms_arr as a string
    perms.each do |p|
      word = p.join("")
      if !perms_arr.include?(word)
        perms_arr.push(word)
      end
    end
    i +=1
  end
  validate_words(perms_arr)
end


# validate which permutations are found in the dictionary
def validate_words(perms_arr)
  dictionary = create_dictionary_hash
  scoreboard = create_scoreboard
  valid_words = {}

  perms_arr.each do |word|
    current_score = 0
    # TODO: add functionality for blank tiles
    if dictionary[word]
      # try to refactor - not happy about this loop in a loop: On*m
      word.split("").each do |char|
        current_score += scoreboard[char].to_i
      end
        if valid_words[current_score]
          valid_words[current_score] += [word]
        else
          valid_words[current_score] = [word]
        end
    end
  end
  find_highest_score(valid_words)
end

def find_highest_score(valid_words)
  high_score = valid_words.max_by{|k,v| k}
  high_words = high_score[1].sort

  high_words.each do |word|
    puts "#{word.upcase} - #{high_score[0]}"
  end

end


# letters = "ARPNNLA"
# letters = "CREB_AL"
# letters = "YPOBINX"
letters = "istf"
find_permutations(letters)
