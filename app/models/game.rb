class Game < ActiveRecord::Base
  attr_accessible :away_score, :away_team_id, :date, :home_score, :home_team_id
  
  belongs_to :away_team, :class_name => 'Team'
  belongs_to :home_team, :class_name => 'Team'
  
  validates :date, :away_team_id, :home_team_id, :presence => true
  validates :away_team_id, :home_team_id, :numericality => {:only_integer => true}
  validates :away_score, :home_score, :numericality => {:only_integer => true, :allow_blank => true}
  validates :away_team_id, :home_team_id, :existence => true
  validate :teams_must_differ
  
  def teams_must_differ
  	if away_team_id == home_team_id
		errors.add(:away_team_id, "must be different from home team")
	end
  end
  
end
