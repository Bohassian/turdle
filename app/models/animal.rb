# frozen_string_literal: true

class Animal < ApplicationRecord
  has_many :games
  has_many :guesses
end
