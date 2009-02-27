class NotesController < ApplicationController
  before_filter :login_required
  def index
    
  end
  
  def new
    @note = Note.new
  end
  
  def create
    @note = current_user.sent_notes.create!(params[:note])
    flash[:notice] = "Note sent to #{@note.recipient.email}"
    if facebook_session
      flash[:user_action_to_publish] = UserPublisher.create_note_sent(@note,facebook_session)
    end
    redirect_to notes_path
  end
end
