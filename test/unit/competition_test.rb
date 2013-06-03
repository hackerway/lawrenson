require 'test_helper'

class CompetitionTest < ActiveSupport::TestCase
  test "name must not be empty" do
  	competition = Competition.new
	assert competition.invalid?
	assert competition.errors[:name].any?
	assert_equal "can't be blank", competition.errors[:name].join('; ')
  end
  
  test "sport id must be valid" do
  	competition = Competition.new(:name => 'EPL 2013', :sport_id => '10')
	assert competition.invalid?
	assert_equal "does not exist", competition.errors[:sport_id].join('; ')
  end
  
  test "end_date must be after start_date" do
  	competition = Competition.new(:name => 'EPL 2013', :sport_id => '1', :start_date => "2013-01-01", :end_date => "2012-01-01")
	assert competition.invalid?
	assert_equal "must be after start_date", competition.errors[:end_date].join('; ')
  end
  
  test "should be able to create valid competition" do
  	game = Competition.new(:name => "EPL 2013", :start_date => "2013-01-01", :end_date => "2014-01-01", :sport_id => 1)
	assert game.valid?
  end
end
