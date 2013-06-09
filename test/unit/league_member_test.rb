require 'test_helper'

class LeagueMemberTest < ActiveSupport::TestCase
  test "league must be valid" do
  	leagueMember = LeagueMember.new(:league_id => 10, :user_id => 1)
    assert leagueMember.invalid?
	assert_equal "does not exist", leagueMember.errors[:league_id].join('; ')
  end
  
  test "user must be valid" do
  	leagueMember = LeagueMember.new(:league_id => 1, :user_id => 10)
    assert leagueMember.invalid?
	assert_equal "does not exist", leagueMember.errors[:user_id].join('; ')
  end
  
end
