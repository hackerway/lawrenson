require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be present" do
  	user = User.new
    assert user.invalid?
	assert_match %r{can't be blank}i, user.errors[:email].join('; ')
  end
  
  test "email must be valid" do
  	user = User.new(:email => 'bad_email')
    assert user.invalid?
	assert_match %r{must be email address}i, user.errors[:email].join('; ')
  end
  
  test "should be able to create valid user" do
  	user = User.new(:email => 'pete@sillypog.com', :first_name => 'Peter', :last_name => 'Hastie')
	assert user.valid?
  end
end
