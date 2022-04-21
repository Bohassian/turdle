# frozen_string_literal: true

# main entry for the app
class TurdlesController < ApplicationController
  before_action :find_or_create_game

  def index
  end
  
  def create
    @game = Game.find(params.dig("game", "id").to_i)
    @guess = params.dig("game", "guess").to_i
    @game.record_guess(Animal.find(@guess))
    @game.check_guess
    @game.reload

    puts @game.inspect
    
    reset_session if @game.won? || @game.round > 6
    
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
end
