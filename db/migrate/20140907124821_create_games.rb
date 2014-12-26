class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :my_class
      t.string :opp_class
      t.string :result
      t.timestamps
    end
  end
end
