require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user2@example.com",
                     password: "password", password_confirmation: "password")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user should authenticate with correct password" do
    assert @user.authenticate("password")
  end

  test "user should fail auth with incorrect password" do
    assert_not @user.authenticate("jackass")
  end
end
