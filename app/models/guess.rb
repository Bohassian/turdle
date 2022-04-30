# frozen_string_literal: true

# In memory model representing a guess
class Guess
  attr_reader :guess, :answer

  # @param answer [Guess]
  def initialize(guess, answer)
    @guess = guess
    @answer = answer
  end

  def pending?
    guess.nil?
  end

  def correct?
    guess == answer
  end

  def diet_correct?
    guess.diet == answer.diet
  end

  %i[weight height lifespan gestation].each do |sym|
    define_method("#{sym}_difference".to_sym) do
      return -1 if guess.send(sym).nil?

      guess.send(sym) - answer.send(sym)
    end
  end
end
