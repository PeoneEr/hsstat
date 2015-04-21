require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  it 'обязательная авторизация' do
    get :index

    expect(response).to redirect_to(new_profile_session_path)
  end
end
