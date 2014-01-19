class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # Owned by devise
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Owned by app
  attr_accessible :first_name, :last_name
  
  has_many :predictions
  has_many :league_members
  has_many :leagues, :through => :league_members
  
  validates :email, :presence => true
  validates :email, :format => {:with => /\A.+@.+\..+\z/, :message => "must be email address" }

end
