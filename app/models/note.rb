class Note < ActiveRecord::Base
  
  before_validation :lookup_or_create_recipient
  
  attr_accessor :recipient_email_address
  
  belongs_to :sender, :class_name=>"User",:foreign_key=>"from_user_id"
  belongs_to :recipient, :class_name=>"User",:foreign_key=>"to_user_id"
  
  def lookup_or_create_recipient
    if recipient_email_address
      user = User.find_by_email(recipient_email_address)
      if user.nil?
        user = User.create!(:email=>recipient_email_address)
      end
      self.recipient = user
    end
  end
end
