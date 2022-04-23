# frozen_string_literal: true

# main entry for the app
class TurdlesController < ApplicationController
  before_action :find_or_create_game
  before_action :check_new_game

  def create
    @game.check_guess(guess)

    respond_to do |format|
      format.html { redirect_to root_path, notice: "moo" }
      format.turbo_stream
    end
  end

  private

  def find_or_create_game
    return @game = Game.find(session[:game]["id"]) if session[:game]

    @game = Game.create(animal: Animal.all.sample, round: 1)
    session[:game] = @game
  end

  def guess
    @guess ||= params.dig("game", "guess").to_i
  end

  def check_new_game
    reset_session if params["reset"]
  end
end
