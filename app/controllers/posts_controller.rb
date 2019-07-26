class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build if logged_in?
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Posted!"
      redirect_to posts_path
    else
      flash.now[:danger] = "Post attempt failed."
      render new
    end

  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
