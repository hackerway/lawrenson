class Game < ActiveRecord::Base
  attr_accessible :away_score, :away_team_id, :date, :home_score, :home_team_id, :competition_id
  
  belongs_to :away_team, :class_name => 'Team'
  belongs_to :home_team, :class_name => 'Team'
  belongs_to :competition
  has_many :predictions
  
  validates :date, :away_team_id, :home_team_id, :competition_id, :presence => true
  validates :away_team_id, :home_team_id, :competition_id, :numericality => {:only_integer => true}
  validates :away_score, :home_score, :numericality => {:only_integer => true, :allow_blank => true}
  validates :away_team_id, :home_team_id, :competition_id, :existence => true
  validate :teams_must_differ
  validate :team_sports_must_match_competition
  
  def teams_must_differ
  	if away_team_id == home_team_id
		errors.add(:away_team_id, "must be different from home team")
	end
  end
  
  def team_sports_must_match_competition
  	return unless home_team && away_team && competition
  	unless home_team.sport == competition.sport
		errors.add(:home_team_id, "must match competition sport")
	end
	
	unless away_team.sport == competition.sport
		errors.add(:away_team_id, "must match competition sport")
	end
  end
  
end
