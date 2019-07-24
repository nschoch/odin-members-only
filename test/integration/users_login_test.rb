require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example)
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' } }
    assert is_logged_in?
  end
end
