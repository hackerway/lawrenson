require 'test_helper'

class TeamTest < ActiveSupport::TestCase
 
  test "team name must not be empty" do
  	team = Team.new
	assert team.invalid?
	assert team.errors[:name].any?
	assert_equal "can't be blank", team.errors[:name].join('; ')
  end
  
  test "team sport_id must not be empty" do
  	team = Team.new(:name => "LA Galaxy")
	assert team.invalid?
	assert team.errors[:sport_id].any?
	assert_match %r{can't be blank}i, team.errors[:sport_id].join('; ')
  end
  
  test "team sport_id must be valid sport" do
  	team = Team.new(:name => "LA Galaxy", :sport_id => 10)
	assert team.invalid?
	assert_equal "does not exist", team.errors[:sport_id].join('; ')
  end
  
  test "team logo_url must have correct format" do
  	team = Team.new(:name => "LA Galaxy", :sport_id => 1, :logo_url => "http://sillypog.com")
	assert team.invalid?
	assert_match %r{must be a URL for GIF, JPG or PNG image}i, team.errors[:logo_url].join('; ')
  end
  
  test "should be able to create valid team" do
  	team = Team.new(:name => "Arsenal", :sport_id => 1)
	assert team.valid?
  end
end
