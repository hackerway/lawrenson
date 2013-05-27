class Game < ActiveRecord::Base
  attr_accessible :away_score, :away_team_id, :data, :home_score, :home_team_id
end
