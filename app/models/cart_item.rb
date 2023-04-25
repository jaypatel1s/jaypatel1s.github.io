class CartItem < ApplicationRecord
    belongs_to :product
    validates :quantity, presence: true, numericality: { greater_than: 0 }
  belongs_to :cart, foreign_key: 'cart_id'


end
