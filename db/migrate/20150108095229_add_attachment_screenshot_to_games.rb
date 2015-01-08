class AddAttachmentScreenshotToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :screenshot
    end
  end

  def self.down
    remove_attachment :games, :screenshot
  end
end
