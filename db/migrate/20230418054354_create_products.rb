class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.text :description
      t.string :mrp
      t.string :selling_price
      t.string :discount
      t.string :discount_type
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
