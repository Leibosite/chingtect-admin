class CreateSpecCategories < ActiveRecord::Migration
  def change
    create_table :spec_categories do |t|
      t.string :name
      t.string :detail

      t.timestamps null: false
    end
  end
end
