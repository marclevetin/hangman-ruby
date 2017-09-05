# Get word
#
#
# Show user how many letters are in the word
# Show user available letters in alphabet
# Show user how close to losing they are (user gets 7 chances)
#
# User selects a letter
# Letter is no longer available to be selected again
# If letter is within word, then those letters appear
# If letter is not within word, then user is 1 closer to losing.  Show this by spelling “hangman”
#
# Repeat until user either wins (all letters of word are selected) or loses (all letters of hangman are shown)

require 'pry'
# generate word
words = ['apple', 'bear', 'castle'] # we can expand this in the future
random_number = rand(words.size)
random_word = words[random_number].upcase.each_char.to_a
random_word_size = random_word.size

hangman = "hangman"
missed_letters = 0


# build initial obfuscated_word
obfuscated_word = []
random_word_size.times do
  obfuscated_word.push("_")
end

# show state of current board
puts "The current state of the board is:"
puts obfuscated_word.join(" ")
puts

# print out outstanding letters
total_alphabet = 'A'.upto('Z').to_a
chosen_letters = []
available_alphabet = total_alphabet - chosen_letters # make this a method so you don't need to regen total_alphabet
puts "The available letters are:"
puts available_alphabet.join(" ")

binding.pry
# need to add validation to require 1 letter only
puts "Choose a letter"
print "> "
letter = gets.chomp.upcase

#handle letter
chosen_letters << letter
available_alphabet = available_alphabet - chosen_letters

# messaging
if random_word.include?(letter)
  puts "the letter is in the word!"
  index = random_word.index(letter)
  obfuscated_word[index] = letter
elsif !random_word.include?(letter)
  puts "the letter is not in the word!"
  missed_letters += 1
  puts hangman[missed_letters - 1]
else
  puts "problem in the handle letter method"
end

# repeat
binding.pry
