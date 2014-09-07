class Game < ActiveRecord::Base
  extend Enumerize
  enumerize :my_class, in: [:mage, :hunter, :rogue, :warrior, :druid, :warlock, :shaman, :priest, :paladin]
  enumerize :opp_class, in: [:mage, :hunter, :rogue, :warrior, :druid, :warlock, :shaman, :priest, :paladin]
  enumerize :result, in: [:win, :lose]

  validates_presence_of :my_class, :opp_class, :result
end
