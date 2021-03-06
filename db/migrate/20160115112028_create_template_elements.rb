class CreateTemplateElements < ActiveRecord::Migration
  def change
    create_table :template_elements do |t|
      t.string :name
      t.string :eName
      t.text :definition
      t.string :identifier
      t.text :definedBy
      t.string :label
      t.string :language
      t.string :occurence
      t.string :keyWords
      t.string :version
      t.string :comments
      t.references :templateElementCategory, index: true, foreign_key: true
      t.references :templateEncodingScheme

      t.timestamps null: false
    end
  end
end
