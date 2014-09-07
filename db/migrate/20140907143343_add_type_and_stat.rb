class AddTypeAndStat < ActiveRecord::Migration
  def change
    add_column :games, :type_of_a_game, :string
    add_column :games, :stat, :string
  end
end
