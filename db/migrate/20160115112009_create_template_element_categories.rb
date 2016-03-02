class CreateTemplateElementCategories < ActiveRecord::Migration
  def change
    create_table :template_element_categories do |t|
      t.string :name
      t.string :detail
      t.string :version
      t.integer :state
      t.string :annotion

      t.timestamps null: false
    end
  end
end
