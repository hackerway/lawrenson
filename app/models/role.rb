class Role < ActiveRecord::Base
  attr_accessible :role
  
  has_many :league_members
  
  validates :role, format: { with: /\A[a-z]+\z/, message: 'must be lower case' }
  
end
