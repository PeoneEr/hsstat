class AddUserIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :user_id, :integer
    Game.update_all :user_id => 1
  end
end
