class JoiningsController < ApplicationController
  before_filter :login_required
  def create
    if current_user and facebook_session
      current_user.update_attribute(:facebook_id,facebook_session.user.uid)
      redirect_to notes_path
    else
      flash[:error] = "You must be logged in to facebook"
      redirect_to current_user
    end
  end
end
