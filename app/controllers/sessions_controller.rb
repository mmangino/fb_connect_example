class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user
      session[:user_id] = @user.id
    end
    if current_user
      redirect_to session[:return_to]||notes_path
      session[:return_to]=nil
    else
      flash[:error] = "Unable to log you in"
      render :action=>"new"
    end
  end
  
  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end
end
