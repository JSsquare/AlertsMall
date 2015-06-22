class AddCritiqukingToUsersScores < ActiveRecord::Migration
  def change
    add_column :users_scores, :critiquking, :boolean
  end
end
