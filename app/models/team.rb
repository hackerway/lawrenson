class Team < ActiveRecord::Base
  attr_accessible :logo_url, :name, :sport_id
  
  belongs_to :sport
end
