class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one_attached :image 


  def total
    total_price = 0
    cart.each do |cart_item|
      total_price += cart.total_price
    end
    total_price
  end
end
