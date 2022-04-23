# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_17_213837) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.integer "diet"
    t.integer "weight"
    t.integer "height"
    t.integer "lifespan"
    t.integer "gestation"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "animal_id"
    t.integer "round"
    t.boolean "won"
    t.integer "guess_one_id"
    t.integer "guess_two_id"
    t.integer "guess_three_id"
    t.integer "guess_four_id"
    t.integer "guess_five_id"
    t.integer "guess_six_id"
    t.index ["animal_id"], name: "index_games_on_animal_id"
  end

end
