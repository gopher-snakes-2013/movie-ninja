class Trigram < ActiveRecord::Base
  attr_accessible :score, :trigram, :owner_type
  include Fuzzily::Model
end
