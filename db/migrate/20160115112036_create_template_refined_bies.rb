class CreateTemplateRefinedBies < ActiveRecord::Migration
  def change
    create_table :template_refined_bies do |t|
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
      t.references :templateEncodingScheme, index: true, foreign_key: true
      t.references :templateElement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
