class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :slug
      t.string :state
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
