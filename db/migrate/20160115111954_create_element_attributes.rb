class CreateElementAttributes < ActiveRecord::Migration
  def change
    create_table :element_attributes do |t|
      t.string :name
      t.text :definition
      t.text :constraint
      t.string :comments

      t.timestamps null: false
    end
  end
end
