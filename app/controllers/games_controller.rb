class GamesController < ApplicationController
  before_action :authenticate_profile!

  def index
    @games = Game.where(user_id: current_profile.id).order('id desc')
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params.merge(user_id: current_profile.id))
    if @game.save
      redirect_to profiles_path
    else
      render 'new'
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to profiles_path
  end

  private

  def game_params
    params.require(:game).permit(:my_class, :opp_class, :type_of_a_game, :result)
  end
end
