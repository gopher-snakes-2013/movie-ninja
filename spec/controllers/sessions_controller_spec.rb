require 'spec_helper'

describe SessionsController do
  let(:user){User.create(email: 'bob@example.com', password: 'password')}

  describe '#create' do
    it 'should create a new session for the user' do
      post :create , user: { email: user.email, password: 'password'}
      expect(session[:user_id]).to_not be_nil
    end
  end

  describe '#destroy' do
    xit 'should clear sessions hash' do
      post :create , user: { email: user.email, password: 'password'}

      expect(session[:user_id]).to be_nil
    end
  end
end