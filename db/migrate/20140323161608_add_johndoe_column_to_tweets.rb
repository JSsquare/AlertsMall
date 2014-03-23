class AddJohndoeColumnToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :johndoe, :boolean, :default => true
  end

  def down
    change_column :tweets, :johndoe, :boolean, :default => nil
  end
end
