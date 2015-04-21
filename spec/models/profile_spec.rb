require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'создает пользователя' do
    profile = Profile.create(email: '1234@qq.qq', password: '12345678')

    expect(profile).to eq(Profile.last)
  end
end
