class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
