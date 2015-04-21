class ProfilesController < ApplicationController
  include ApplicationHelper

  helper_method :math_stat, :win_stat, :lose_stat

  before_action :authenticate_profile!

  def index
    @games = Game.search { with :user_id, current_profile.id; paginate page: 1, per_page: Game.count }.results

    @game = Game.new

    @unique_classes = @games.map(&:my_class).uniq
    @last_game = Game.where(user_id: current_profile.id).last
  end
end
