class AddUsernameIndexToEmail < ActiveRecord::Migration
  def change
    add_index :emails, :username, unique: true
  end
end
