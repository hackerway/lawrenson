require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "required fields must not be empty" do
  	game = Game.new
	assert game.invalid?
	assert game.errors[:date].any?
	assert_equal "can't be blank", game.errors[:date].join('; ')
	assert game.errors[:competition_id].any?
	assert_match %r{can't be blank}i, game.errors[:competition_id].join('; ')
  end
  
  test "competition id must be valid" do
  	game = Game.new(:date => "2013-01-01", :competition_id => 10)
	assert game.invalid?
	assert_equal "does not exist", game.errors[:competition_id].join('; ')
  end
  
  test "team fields must not be empty" do
  	game = Game.new(:date => "2013-01-01")
	assert game.invalid?
	assert game.errors[:home_team_id].any?
	assert_match %r{can't be blank}i, game.errors[:home_team_id].join('; ')
	assert game.errors[:away_team_id].any?
	assert_match %r{can't be blank}i, game.errors[:away_team_id].join('; ')
  end
  
  test "team ids must be valid" do
  	game = Game.new(:date => "2013-01-01", :home_team_id => 10, :away_team_id => 11, :competition_id => 1)
	assert game.invalid?
	assert_equal "does not exist", game.errors[:home_team_id].join('; ')
	assert_equal "does not exist", game.errors[:away_team_id].join('; ')
  end
  
  test "team ids must not be the same" do
  	game = Game.new(:date => "2013-01-01", :home_team_id => 1, :away_team_id => 1, :competition_id => 1)
	assert game.invalid?
	assert_match %r{must be different from home team}i, game.errors[:away_team_id].join('; ')
  end
  
  test "team sports must match competition sport" do
  	game = Game.new(:date => "2013-01-01", :home_team_id => 1, :away_team_id => 2, :competition_id => 1)
	assert game.invalid?
	assert_match %r{must match competition sport}i, game.errors[:away_team_id].join('; ')
  end
  
  test "should be able to create valid game" do
  	game = Game.new(:date => "2013-01-01", :home_team_id => 1, :away_team_id => 3, :competition_id => 1)
	assert game.valid?
	#puts game.errors.full_messages.join('; ')
  end
end
