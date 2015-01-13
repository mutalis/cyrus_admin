class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :username
      t.string :quota
      t.string :password

      t.timestamps null: false
    end
  end
end
