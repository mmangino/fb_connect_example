class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      @error = "Unable to log you in"
      render :action=>"new"
    end
  end
end
