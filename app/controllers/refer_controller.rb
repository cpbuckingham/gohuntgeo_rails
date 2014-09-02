class ReferController < ApplicationController

  def new
    @refer = Refer.new
  end

  def create
    @refer = Refer.new(
      name: params[:refer][:name],
      email: params[:refer][:email],
    )
    if @refer.save
      ReferMailer.refer_email(@refer).deliver
      redirect_to user_path(session[:user_id])
      flash[:notice] = "Thank you for refering someone"
    else
      flash[:notice] = "Sorry we could not send a request to this person"
      render :new
    end
  end
  end
