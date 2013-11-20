require 'faker'

FactoryGirl.define do
  factory :movie do
    title Faker::Company.catch_phrase
    synopsis Faker::Lorem.paragraph
  end
end