class Game < ActiveRecord::Base
  extend Enumerize
  enumerize :my_class, in: [:mage, :hunter, :rogue, :warrior, :druid, :warlock, :shaman, :priest, :paladin]
  enumerize :opp_class, in: [:mage, :hunter, :rogue, :warrior, :druid, :warlock, :shaman, :priest, :paladin]
  enumerize :result, in: [:win, :lose]
  enumerize :type_of_a_game, in: [:arena, :ranked, :casual]

  validates_presence_of :my_class, :opp_class, :result, :type_of_a_game
end
