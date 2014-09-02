class RegisterController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      password: params[:user][:password],
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
      flash[:notice] = "Thank you for registering"
    else
      flash[:notice] = "Your account could not be created"
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(
      username: params[:user][:username],
      password: params[:user][:password],
    )
      redirect_to root_path
      flash[:notice] = "Your profile was successfully updated!"
    else
      render :edit
    end
  end
end