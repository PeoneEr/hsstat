module ApplicationHelper
  def percentages(win, all, precision = 1)
    number_to_percentage((win / all) * 100, precision: precision)
  end

  def percentages_for_stat(stat, precision = 1)
    number_to_percentage(stat, precision: precision)
  end

  def math_stat(my_class, opp_class, type)
    all_games = Game.where(my_class: my_class, opp_class: opp_class, type_of_a_game: type, user_id: current_profile.id).count
    win_games = Game.where(my_class: my_class, opp_class: opp_class, type_of_a_game: type, result: 'win', user_id: current_profile.id).count
    (win_games.to_f / all_games.to_f) * 100
  end
end
