class Prediction < ActiveRecord::Base
  attr_accessible :away_score, :game_id, :home_score, :user_id
  
  belongs_to :user
  belongs_to :game
  
  validates :away_score, :home_score, :game_id, :user_id, :presence => true
  validates :away_score, :home_score, :game_id, :user_id, :numericality => {:only_integer => true}
  validates :game_id, :user_id, :existence => true
  validate :prediction_is_unique
  
  # Shouldn't allow the user to predict the same game twice
  def prediction_is_unique
  	existing = Prediction.where("user_id = ? AND game_id = ?", user_id, game_id)
	unless existing.empty?
		errors.add(:base, "user has already predicted this game")
	end
  end
end
