class UserPublisher < Facebooker::Rails::Publisher
  def connected_template
    one_line_story_template "{*actor*} connected their account!"
    short_story_template "{*actor*} connected their account!", "Connect your account too!"
  end
  
  def connected(user)
    send_as :user_action
    from user
  end
  
  def note_sent_template
    one_line_story_template "{*actor*} sent a note using notes!"
    short_story_template "{*actor*} sent a note using notes!","{*short_note_body*}"
    full_story_template "{*actor*} sent a note using notes!","{*note_body*}"
  end
  
  def note_sent(note,facebook_session)
    send_as :user_action
    from facebook_session.user
    data :short_note_body=>simple_format(h(truncate(note.body,:length=>20))),:note_body=>simple_format(h(note.body))
  end
end
