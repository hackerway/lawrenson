class Team < ActiveRecord::Base
  attr_accessible :logo_url, :name, :sport_id
  
  belongs_to :sport
  
  validates :name, :sport_id, :presence => true
  validates :sport_id, :numericality => {:only_integer => true}
end
