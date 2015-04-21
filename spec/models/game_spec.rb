require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'создает запись игры' do
    game = Game.create(my_class: 'paladin', opp_class: 'paladin', result: 'win', type_of_a_game: 'arena')

    expect(game).to eq(Game.last)
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
