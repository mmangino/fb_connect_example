class AddFacebookIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_id, :string
    add_column :users, :facebook_session_key, :string
  end

  def self.down
    remove_column :users, :facebook_session_key
    remove_column :users, :facebook_id
  end
end
