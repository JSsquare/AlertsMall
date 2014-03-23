class DropShops < ActiveRecord::Migration
  def up
    drop_table :shops
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
