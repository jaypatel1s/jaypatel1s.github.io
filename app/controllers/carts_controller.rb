class CartsController < ApplicationController
    before_action :authenticate_user!, except: [:home,:about,:contact]

    def add_item
       product = Product.find(params[:product_id])
       @cart = session[:cart] || {}
       @cart[product.id] ||= 0
       @cart[product.id] += 1
       session[:cart] = @cart
       redirect_to products_path, notice: 'Item added to cart!'
     end

     def remove_item
       product = Product.find(params[:product_id])
       @cart = session[:cart] || {}
       @cart.delete(product.id)
       session[:cart] = @cart
       redirect_to carts_path, notice: 'Item removed from cart!'
     end

     def update_quantity
       product = Product.find(params[:product_id])
       @cart = session[:cart] || {}
       @cart[product.id] = params[:quantity].to_i
       session[:cart] = @cart
       redirect_to cart_path, notice: 'Cart updated!'
     end

     def show
       @cart = session[:cart] || {}
     end
     def total_price
         total = 0
         @cart.each do |product_id, quantity|
           product = Product.find(product_id)
           total += product.price * quantity
         end
         total
       end

       def get_product_details(product_id)
         product = Product.find(product_id)
             if product
                  { name: product.name, price: product.price }
                else
                  { name: 'Unknown', price: 0 }
                end
           end

end
