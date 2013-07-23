class League < ActiveRecord::Base
  attr_accessible :name, :competition_ids
  
  has_and_belongs_to_many :competitions
  has_many :league_members
  has_many :members, :through => :league_members, :source => :user
  
  before_validation :add_user_as_owner
  
  # Should validate that a new league is created with an owner
  
  def owner
  	ownerRole = Role.where('role = ?', 'owner')[0]
  	ownerRow = LeagueMember.where('league_id = ? AND role_id = ?', id, ownerRole.id)[0]
	owner = User.find(ownerRow.user_id)
  end
  
  private
  
  def add_user_as_owner
  	# Create a LeagueMember for current user and give them the owner role
  end
  
end
