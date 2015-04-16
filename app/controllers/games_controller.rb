class GamesController < ApplicationController
  before_action :authenticate_profile!
  skip_before_filter :verify_authenticity_token

  helper_method :page, :per

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
        render nothing: true, status: 200 and return if request.xhr?

        redirect_to root_path
      else
        render 'new'
      end
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update! game_params
    redirect_to games_path
  end

  def edit
    @game = Game.find(params[:id])
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
    params.require(:game).permit(:my_class, :opp_class, :type_of_a_game, :result, :comment, :screenshot)
  end
end
