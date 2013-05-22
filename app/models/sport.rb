class Sport < ActiveRecord::Base
  attr_accessible :name
  
  has_many :team
end
