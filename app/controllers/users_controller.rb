class UsersController < ApplicationController

    def index
      @users = User.all
    end

    def show
      @user = User.find_by_id(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "User successfully created!"
        redirect_to @user
      else
        flash.now[:danger] = "User not created"
        render 'new'
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
