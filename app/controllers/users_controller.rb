class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.create!(params[:user])
    session[:user_id] = @user.id
    redirect_to @user
  rescue ActiveRecord::RecordInvalid => e
    @user = e.record
    flash[:error] = @user.errors.full_messages.to_sentence
    render :action=>"new"
  end
  
  def update
    @user = current_user.update_attributes!(params[:user])
    redirect_to notes_path
  rescue ActiveRecord::RecordInvalid => e
    @user = e.record
    flash[:error] = @user.errors.full_messages.to_sentence
    render :action=>"show"    
  end
  
  def show
    @user = User.find(params[:id])
  end
end
