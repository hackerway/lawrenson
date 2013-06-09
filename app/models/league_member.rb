class LeagueMember < ActiveRecord::Base
  attr_accessible :league_id, :user_id
  
  belongs_to :league
  belongs_to :user
  
  validates :league_id, :user_id, :numericality => {:only_integer => true}
  validates :league_id, :user_id, :existence => true
end
