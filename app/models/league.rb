class League < ActiveRecord::Base
  attr_accessible :name, :competition_ids
  
  has_and_belongs_to_many :competitions
  has_many :league_members
  has_many :members, :through => :league_members, :source => :user
  
end
