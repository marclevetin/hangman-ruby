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

class Hangman
  def initialize
    @hangman = "hangman"
    @missed_letters = 0
    @random_word = generate_word
    @size = word_size(@random_word)
    @board = initialize_board(@random_word)
    @alphabet = 'A'.upto('Z').to_a
    binding.pry
  end

  def generate_word
    words = ['apple', 'bear', 'castle'] # we can expand this in the future
    random_number = rand(words.size)
    random_word = words[random_number].upcase.each_char.to_a
  end

  def word_size(word)
    word.size
  end

  def initialize_board(word)
    obfuscated_word = []
    word.size.times do
      obfuscated_word.push("_")
    end

    obfuscated_word.join(" ")
  end

  def announce_board
    puts "The current state of the board is:\n#{@board}"
  end

  def announce_alphabet
    puts "The available letters are:\n#{@alphabet}"
  end

  def get_input
    puts "Choose a letter"
    print "> "
    letter = gets.chomp.upcase
    validate_input(letter)
  end

  def validate_input(letter)
    while letter.size != 1
      puts "Oops.  Please enter just a single letter."
      get_input
    end
  end

end

a = Hangman.new


# print out outstanding letters
total_alphabet = 'A'.upto('Z').to_a
chosen_letters = []
available_alphabet = total_alphabet - chosen_letters # make this a method so you don't need to regen total_alphabet
puts "The available letters are:"
puts available_alphabet.join(" ")

binding.pry
# need to add validation to require 1 letter only


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
