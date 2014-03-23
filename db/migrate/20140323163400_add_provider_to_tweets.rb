class AddProviderToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :provider, :string, :default => "johndoe", :null => true
  end

  def self.down
    remove_column :tweets, :provider
  end
end
