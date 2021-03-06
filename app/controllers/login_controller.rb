class LoginController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
    else
      @user = User.new(username: params[:user][:username])
      @user.errors[:base] << "Username / password is invalid"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end