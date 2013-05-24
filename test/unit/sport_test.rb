require 'test_helper'

class SportTest < ActiveSupport::TestCase
  
  test "sport name must not be empty" do
  	sport = Sport.new
	assert sport.invalid?
	assert sport.errors[:name].any?
  end
  
  test "sport name must be unique" do
  	sport = Sport.new(:name => "soccer")
	assert sport.invalid?
	assert sport.errors[:name].any?
	assert_equal "has already been taken", sport.errors[:name].join('; ')
  end
  
  test "new sport can be added" do
  	sport = Sport.new(:name => "football")
	assert sport.valid?
  end
end
