class League < ActiveRecord::Base
  attr_accessible :name, :competition_ids
  
  has_and_belongs_to_many :competitions
  
end
