require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example)
  end

  test "post interface" do
    log_in_as(@user)
    get new_post_path
    assert_select 'form.new_post'
    # invalid submission
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "" } }
    end
    assert_select 'div#error_explanation'
  
  end
end
