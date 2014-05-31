class CreateBlockedUsers < ActiveRecord::Migration
  def change
    create_table :blocked_users do |t|
      t.string :username
      t.string :provider
      t.text :reason

      t.timestamps
    end
  end
end
