class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.string :name
      t.text :limit
      t.text :normative
      t.text :termDefinition
      t.text :elementSetExp
      t.text :metadataStructure
      t.string :version
      t.integer :state
      t.string :annotation
      t.datetime :releaseDate
      t.references :SpecCategory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
