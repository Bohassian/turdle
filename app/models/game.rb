# frozen_string_literal: true

# Turdle game data and logic
class Game < ApplicationRecord
  belongs_to :animal

  %i[guess_one guess_two guess_three guess_four guess_five guess_six].each do |sym|
    belongs_to sym, class_name: "Animal", optional: true
  end

  attr_accessor :guess

  # first records the guess passed in, then checks it and updates the
  # game accordingly. game is won if it matches, otherwise the round
  # incremented by one.
  #
  # @param guess [Animal] Animal submitted by the select.
  def check_guess(guess)
    record_guess(guess)

    if round_to_guess == animal
      update(won: true)
    else
      update(round: round + 1)
    end
  end

  def guesses
    (1..6).map { |i| new_guess(i) }
  end

  private

  def new_guess(int)
    Guess.new(round_to_guess(int), animal)
  end

  def record_guess(guess)
    case round
    when 1 then update(guess_one: guess)
    when 2 then update(guess_two: guess)
    when 3 then update(guess_three: guess)
    when 4 then update(guess_four: guess)
    when 5 then update(guess_five: guess)
    when 6 then update(guess_six: guess)
    end
  end

  def round_to_guess(int = round)
    case int
    when 1 then guess_one
    when 2 then guess_two
    when 3 then guess_three
    when 4 then guess_four
    when 5 then guess_five
    when 6 then guess_six
    end
  end
end
