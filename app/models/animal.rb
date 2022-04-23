# frozen_string_literal: true

# t.string "name"
# t.integer "weight"
# t.integer "height"
# t.integer "lifespan"
# t.integer "gestation"
class Animal < ApplicationRecord
  has_many :games
  has_many :guesses
end
