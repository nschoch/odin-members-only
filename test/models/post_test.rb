require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:example)
    @post = @user.posts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "content must be populated" do
    @post.content = "   "
    assert_not @post.valid?
  end

  test "content should be limited to 140 characters" do
    @post.content = "a" * 141
    assert_not @post.valid?
  end
end
