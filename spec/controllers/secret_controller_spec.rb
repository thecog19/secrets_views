require 'rails_helper'

describe SecretsController do

  describe 'secrets#show' do
    it 'sets secrets variable' do
      secret = create(:secret)
      get :show, { id: secret.id }
      expect(assigns(:secret)).to eq(secret)
    end

  end

  describe 'valid user' do
    # before do
    #   user = create(:user)
    #   secret = create(:secret, author: user)
    # end

    it 'can edit their own secrets' do
      user = create(:user)
      secret = create(:secret, author: user)
      session[:user_id] = user.id
      put :update, id: secret.id, secret: {title: "test title", body: "test body"}
      user.reload
      expect(secret.title).to eq("test title")
    end

  end

end
