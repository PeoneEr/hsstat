module ApplicationHelper
  def percentages(win, all, precision = 1)
    number_to_percentage((win / all) * 100, precision: precision)
  end

  def percentages_for_stat(stat, precision = 1)
    number_to_percentage(stat, precision: precision)
  end

  def math_stat(my_class, opp_class, type)
    all_games = current_profile.games.search { with :my_class, my_class; with :opp_class, opp_class; with :type_of_a_game, type; paginate page: 1, per_page: Game.count }.results.count
    win_games = Game.where(my_class: my_class, opp_class: opp_class, type_of_a_game: type, result: 'win', user_id: current_profile.id).count
    (win_games.to_f / all_games.to_f) * 100
  end

  def win_stat
    current_profile.games.search { with :result, 'win'; paginate page: 1, per_page: Game.count }.results.count
  end

  def lose_stat
    current_profile.games.search { with :result, 'lose'; paginate page: 1, per_page: Game.count }.results.count
  end
end
