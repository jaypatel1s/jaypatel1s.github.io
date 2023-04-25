class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :sub_total
      t.string :payment_type
      t.string :payment_id
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
