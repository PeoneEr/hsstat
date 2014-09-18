module ApplicationHelper
  def percentages(win, all, precision = 1)
    number_to_percentage((win / all) * 100, precision: precision)
  end

  def percentages_for_stat(stat, precision = 1)
    number_to_percentage(stat, precision: precision)
  end
end
