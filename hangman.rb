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
words = ['apple', 'bear', 'castle']
random_number = rand(words.size) + 1

random_word = words[random_number]

puts random_word

binding.pry
