
# TODO: add class structure

def find_permutations(letters)

  perms_arr = []
  letters_arr = letters.split("")

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

  # validate which perms are found in the dictionarys
  validate_words(perms_arr)
end


def validate_words(arr)
  puts arr
end

letters = "ARPNNLA"
find_permutations(letters)
