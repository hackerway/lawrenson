require 'test_helper'

class PredictionTest < ActiveSupport::TestCase
  test "references must be valid" do
  	prediction = Prediction.new(:user_id => 10, :game_id => 10, :home_score => 0, :away_score => 4)
	assert prediction.invalid?
	assert_equal "does not exist", prediction.errors[:user_id].join('; ')
	assert_equal "does not exist", prediction.errors[:game_id].join('; ')
  end
  
  test "user should not be able to predict same game twice" do
  	prediction = Prediction.new(:user_id => 1, :game_id => 2, :home_score => 1, :away_score => 0)
	assert prediction.invalid?
	assert_equal "user has already predicted this game", prediction.errors[:base].join('; ')
  end

  test "should be able to create valid prediction" do
  	prediction = Prediction.new(:user_id => 1, :game_id => 3, :home_score => 0, :away_score => 4)
	assert prediction.valid?
  end
end
