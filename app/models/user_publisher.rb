class UserPublisher < Facebooker::Rails::Publisher
  
  def note_sent_template
    one_line_story_template "{*actor*} sent a note using notes!"
    short_story_template "{*actor*} sent a note using notes!","{*short_note_body*}"
    full_story_template "{*actor*} sent a note using notes!","{*note_body*}"
  end
  
  def note_sent(note,facebook_session)
    send_as :publish_stream
    from facebook_session.user
    a = Facebooker::Attachment.new
    a.name = "#{facebook_session.user.name} sent a not using notes!"
    a.href = note_url(note)
    a.description = truncate(note.body,:length=>100)
    attachment a
    action_links [action_link("Use notes now!",root_url)]
  end
  
  def default_url_options
    {:canvas=>false,:host=>HOST}
  end
  
end
