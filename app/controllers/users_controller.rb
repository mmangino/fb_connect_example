class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.create!(params[:user])
    redirect_to @user
  rescue ActiveRecord::RecordInvalid => e
    @user = e.record
    render :action=>"new"
  end
  
  def show
    @user = User.find(params[:id])
  end
end
