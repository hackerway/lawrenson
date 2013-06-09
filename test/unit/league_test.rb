require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  test "retrieve league members" do
  	league = League.find(1)
	members = league.members
    assert members.size == 2
	assert members.include?(users(:peter))
	assert members.include?(users(:anne))
	assert !members.include?(users(:bryan))
  end
end
