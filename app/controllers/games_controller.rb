class GamesController < ApplicationController
  before_action :authenticate_profile!

  helper_method :page
  helper_method :per

  def index
    @games = Game.where(user_id: current_profile.id).order('id desc').page(page).per(per)
  end

  def new
    @game = Game.new
  end

  def create
    if current_profile
      @game = Game.new(game_params.merge(user_id: current_profile.id))
      if @game.save
        redirect_to profiles_path
      else
        render 'new'
      end
    end
  end

  def my_class
    @games = Game.where(my_class: params[:my_class], user_id: current_profile.id).order('id desc').page(page).per(per)
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to games_path
  end

  def page
    params[:page] || 1
  end

  def per
    20
  end

  private

  def game_params
    params.require(:game).permit(:my_class, :opp_class, :type_of_a_game, :result, :comment)
  end
end
