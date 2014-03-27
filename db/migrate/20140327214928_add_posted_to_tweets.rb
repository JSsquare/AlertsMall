class AddPostedToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :posted, :boolean, :default => false
  end

  def self.down
    remove_column :tweets, :posted
  end

end
