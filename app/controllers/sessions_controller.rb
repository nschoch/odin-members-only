class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Log in success!"
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      remember @user
      redirect_to @user
    else
      flash.now[:danger] = "Invalid email/password combination."
      render 'new'
    end
  end

  def destroy
    if logged_in?
      log_out
      flash[:success] = "Logged out!"
    end
    redirect_to root_path
  end

end
