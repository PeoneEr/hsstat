class RenameUserIdToProfileId < ActiveRecord::Migration
  def change
    rename_column :games, :user_id, :profile_id
  end
end
