# frozen_string_literal: true

# Add basic tables to application
class AddTurdleRecords < ActiveRecord::Migration[7.0]
  def change
    create_games
    create_animals
  end

  def create_games
    create_table :games do |t|
      t.belongs_to :animal
      t.integer :round
      t.boolean :won
      t.integer :guess_one_id
      t.integer :guess_two_id
      t.integer :guess_three_id
      t.integer :guess_four_id
      t.integer :guess_five_id
      t.integer :guess_six_id
    end
  end

  def create_animals
    create_table :animals do |t|
      t.string :name
      t.integer :weight
      t.integer :height
      t.integer :lifespan
      t.integer :gestation
    end
  end
end
