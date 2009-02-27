class User < ActiveRecord::Base
  
  validates_presence_of :email
  validates_uniqueness_of :email
  
  has_many :sent_notes, :class_name=>"Note", :foreign_key=>"from_user_id"
  has_many :received_notes, :class_name=>"Note", :foreign_key=>"to_user_id"
  
  def connected?
    !facebook_id.blank?
  end
end
