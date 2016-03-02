class DropTableMem < ActiveRecord::Migration
  def up
    drop_table :permissions_members
  end
end
