
# TODO: add class structure
# put this dictionary hash creator in the class for starting new game of Scrabble
def create_dictionary_hash
  dictionary = {}
  File.open("../data/sample_dictionary.txt", "r") do |f|
    f.each_line do |line|
      dictionary[line.strip] = true;
    end
  end
  return dictionary
end

def find_permutations(letters)
  letters.downcase!
  perms_arr = []
  letters_arr = letters.split("")
  # puts perms_arr

  # start with 2 letter words and continue to find perms up to number of letters
  i = 2
  while i <= letters.length
    # get permutation for length of i
    perms = letters_arr.permutation(i).to_a

    # add each permutation to the perms_arr as a string
    perms.each do |p|
      perms_arr.push(p.join(""))
    end

    i +=1
  end

  validate_words(perms_arr)
end


# validate which permutations are found in the dictionary
def validate_words(perms_arr)
  dictionary = create_dictionary_hash
  valid_words = []

  perms_arr.each do |word|
    # TODO: add functionality for blank tiles
    if dictionary[word] && !valid_words.include?(word)
        valid_words.push(word)
    end
  end

  puts valid_words
end


letters = "ARPNNLA"
find_permutations(letters)
