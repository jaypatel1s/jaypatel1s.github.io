class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.integer :mrp
      t.integer :quantity
      t.integer :selling_price
      t.integer :discount
      t.string :discount_type
      t.integer :total_price
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
