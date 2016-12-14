require 'rails_helper'

describe UsersController do

  describe 'users#new' do

    it 'allows creation of a new user' do
      user = build(:user)
      expect{
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it 'fails with bad parameters' do
      expect{
        post :create, user: { name: "p" }
      }.to_not change(User, :count)
    end

  end

  
end
