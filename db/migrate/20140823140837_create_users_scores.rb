class CreateUsersScores < ActiveRecord::Migration
  def change
    create_table :users_scores do |t|
      t.string :username
      t.integer :score
      t.boolean :posted
      t.string :provider

      t.timestamps
    end
  end
end
