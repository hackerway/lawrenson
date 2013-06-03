class Sport < ActiveRecord::Base
  attr_accessible :name
  
  has_many :team
  has_many :competition
  
  validates :name, :presence => true
  validates :name, :uniqueness => true
end
