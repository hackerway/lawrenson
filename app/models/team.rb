class Team < ActiveRecord::Base
  attr_accessible :logo_url, :name, :sport_id
  
  belongs_to :sport
  has_many :game
  
  validates :name, :sport_id, :presence => true
  validates :sport_id, :numericality => {:only_integer => true}
  validates :sport_id, :existence => true
  validates :logo_url, :format => {:with => %r{\.(gif|jpg|png)$}i, :message => 'must be a URL for GIF, JPG or PNG image.'}, :allow_blank => true
  
  def self.sport_all(sport)
  	Team.where("sport_id = ?", sport.id)
  end
  
end
