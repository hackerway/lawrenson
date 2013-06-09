class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  
  has_many :predictions
  has_many :league_members
  has_many :leagues, :through => :league_members
  
  validates :email, :presence => true
  validates :email, :format => {:with => /\A.+@.+\..+\z/, :message => "must be email address" }

end
