require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#name returns the full name" do
    user = User.new
    user.first_name = "Rap"
    user.last_name = "Mendoza"
    user.save
    assert_equal "Rap Mendoza", user.name
  end
end
