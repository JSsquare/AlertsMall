class CreateConnectedUserinfos < ActiveRecord::Migration
  def change
    create_table :connected_userinfos do |t|
      t.string :info
      t.boolean :mobilenumber

      t.timestamps
    end
  end
end
