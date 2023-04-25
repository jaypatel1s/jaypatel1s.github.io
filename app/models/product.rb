class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products
  has_one_attached :image
  has_many :cart_items
  has_many :cart_items

  def total_price
    quantity * product.selling_price
  end
end
