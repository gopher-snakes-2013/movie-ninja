require 'spec_helper'

describe Showtime do

  it { should validate_presence_of :title }

  it "should create a showtimes with valid params" do
    @showtime.save
    expect(Showtime.count).to eq(1)
  end
end
