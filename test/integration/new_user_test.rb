require 'test_helper'

class NewUserTest < ActionDispatch::IntegrationTest
  test "invalid signup information shouldn't work" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "buttkiss@bx", 
                                         password: "foo", 
                                         password_confirmation: "bar" } }
      end
    assert_select 'h1', text: 'Create user'
    assert_not flash[:danger].empty?
  end

  test 'valid signup information should create a user' do
    get new_user_path
    assert_difference('User.count', 1) do
      post users_path, params: { user: { name: "Buttkiss", 
                                         email: "butt@kiss.com",
                                         password: "password", 
                                         password: "password" } }
    end
    assert_not flash[:success].empty?
  end
end
