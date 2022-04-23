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

      %i[guess_one_id guess_two_id guess_three_id
         guess_four_id guess_five_id guess_six_id].each do |sym|
        t.integer sym
      end
    end
  end

  def create_animals
    create_table :animals do |t|
      t.string :name
      t.integer :diet
      t.integer :weight
      t.integer :height
      t.integer :lifespan
      t.integer :gestation
    end
  end
end
