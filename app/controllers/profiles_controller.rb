class ProfilesController < ApplicationController
  helper_method :math_stat

  before_action :authenticate_profile!

  def index
    @games = Game.where(user_id: current_profile.id).order('id desc')
  end

  def math_stat(my_class, opp_class, type)
    all_games = Game.where(my_class: my_class, opp_class: opp_class, type_of_a_game: type).count
    win_games = Game.where(my_class: my_class, opp_class: opp_class, type_of_a_game: type, result: 'win').count
    (win_games.to_f / all_games.to_f) * 100
  end
end
