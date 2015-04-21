class Game < ActiveRecord::Base
  validates_presence_of :my_class, :opp_class, :result, :type_of_a_game

  belongs_to :profile

  alias_attribute :user_id, :profile_id

  extend Enumerize
  enumerize :my_class, in: [:mage, :hunter, :rogue, :warrior, :druid, :warlock, :shaman, :priest, :paladin]
  enumerize :opp_class, in: [:mage, :hunter, :rogue, :warrior, :druid, :warlock, :shaman, :priest, :paladin]
  enumerize :result, in: [:win, :lose]
  enumerize :type_of_a_game, in: [:arena, :ranked, :casual]

  has_attached_file :screenshot, :styles => { :medium => "500x500>", :thumb => "300x300>"  },
    :default_url => "/images/:style/missing.png", :storage => :elvfs, :elvfs_url => Settings['storage.url']

  validates_attachment_content_type :screenshot, :content_type => /\Aimage\/.*\Z/

  searchable do
    string :my_class
    string :opp_class
    string :result
    string :type_of_a_game

    integer :user_id
    integer :id
  end
end

# == Schema Information
#
# Table name: games
#
#  id                      :integer          not null, primary key
#  my_class                :string
#  opp_class               :string
#  result                  :string
#  created_at              :datetime
#  updated_at              :datetime
#  type_of_a_game          :string
#  stat                    :string
#  user_id                 :integer
#  comment                 :text
#  screenshot_file_name    :string
#  screenshot_content_type :string
#  screenshot_file_size    :integer
#  screenshot_updated_at   :datetime
#  screenshot_url          :text
#
