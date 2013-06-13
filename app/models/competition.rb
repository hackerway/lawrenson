class Competition < ActiveRecord::Base
  attr_accessible :active, :end_date, :name, :sport_id, :start_date
  
  belongs_to :sport
  has_many :games
  has_and_belongs_to_many :leagues
  
  validates :name, :sport_id, :presence => true
  validates :sport_id, :existence => true
  validates :end_date, :timeliness => {:after => :start_date, :allow_blank => true, :after_message => "must be after start_date"}	

end
