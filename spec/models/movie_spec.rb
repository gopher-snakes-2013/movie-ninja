require 'spec_helper'
require 'faker'

describe Movie do
  it { should validate_presence_of :title }

  before(:each) do
    @movie = FactoryGirl.build(:movie)
  end

  it "should create a movie with valid params" do
    @movie.save
    expect(Movie.count).to eq(1)
  end
end