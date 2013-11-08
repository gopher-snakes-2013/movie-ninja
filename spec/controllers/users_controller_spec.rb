require 'spec_helper'

describe UsersController do

  describe '#create' do
    it 'creates a new user in the database' do
      expect{
        post :create , user: { email: 'bob@example.com', password: 'password'}
      }.to change{User.count}.by(1)
    end

    it "doesn't create a new user if its given invalid params" do
      expect {
        post :create, user: {email: 'gtsai@com'}
      }.to_not change { User.count }
    end
  end
end