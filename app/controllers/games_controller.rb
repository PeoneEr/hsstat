class GamesController < ApplicationController
  helper_method :math_stat

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      render 'new'
    end
  end

  def math_stat(my_class, opp_class, type)
    all_games = Game.where(my_class: my_class, opp_class: opp_class, type_of_a_game: type).count
    win_games = Game.where(my_class: my_class, opp_class: opp_class, type_of_a_game: type, result: 'win').count
    (win_games.to_f / all_games.to_f) * 100
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:my_class, :opp_class, :type_of_a_game, :result)
  end
end
