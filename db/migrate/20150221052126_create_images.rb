class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :alt
      t.text :description
      t.string :file
      t.string :tag
      t.integer :position
      t.references :gallery, index: true

      t.timestamps null: false
    end
    add_foreign_key :images, :galleries
  end
end
