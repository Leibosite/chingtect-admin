class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
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
      t.references :spec, index: true, foreign_key: true
      t.references :encodingScheme, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
