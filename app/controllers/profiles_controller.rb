class ProfilesController < ApplicationController
  helper_method :math_stat

  before_action :authenticate_profile!

  def index
    @games = Game.where(user_id: current_profile.id).order('id desc')
    @game = Game.new
    unique = Game.where(user_id: current_profile.id)
    @unique_classes = unique.uniq.pluck(:my_class)
    @last_game = Game.where(user_id: current_profile.id).last
  end

end
