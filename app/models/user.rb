class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  
  has_many :predictions
  
  validates :email, :presence => true
  validates :email, :format => {:with => /\A.+@.+\..+\z/, :message => "must be email address" }

end
