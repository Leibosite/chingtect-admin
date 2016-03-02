class MembersHabtmPermissions < ActiveRecord::Migration
  def up
    create_table :permissions_members, :id => false do |t|
      t.references :permission
      t.references :member
    end
    add_index :permissions_members, [:member_id, :permission_id]
    add_index :permissions_members, [:permission_id, :member_id]
  end

  def down
    drop_table :permissions_members
  end
end
