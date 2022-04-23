# frozen_string_literal: true

# main entry for the app
class TurdlesController < ApplicationController
  before_action :check_new_game, :find_or_create_game

  def create
    @game.check_guess(guessed_animal)

    respond_to do |format|
      format.html { redirect_to root_path, notice: "moo" }
      format.turbo_stream
    end
  end

  private

  # @return [Game]
  def find_or_create_game
    return @game = Game.find(session[:game]["id"]) if session[:game]

    @game = Game.create(animal: Animal.all.sample, round: 1)
    session[:game] = @game
  end

  # @return [Animal]
  def guessed_animal
    @guessed_animal ||= Animal.find(params.dig("game", "guess").to_i)
  end

  def check_new_game
    reset_session if params["reset"]
  end
end
