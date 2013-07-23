class LeagueMember < ActiveRecord::Base
  attr_accessible :league_id, :user_id, :role_id
  
  belongs_to :league
  belongs_to :user
  belongs_to :role

  validates :league_id, :user_id, :role_id, :numericality => {:only_integer => true}
  validates :league_id, :user_id, :role_id, :existence => true
end
