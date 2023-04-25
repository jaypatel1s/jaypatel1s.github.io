class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:home,:about,:contact]

    def index
       @pagy, @products =pagy( Product.all)
    end

    def show
      @product= Product.find(params[:id])
    end



    def new
    end


    def edit
    end



    def update
      @product= Product.find(params[:id])

      if @product.update_attributes(params[:name])
        redirect_to :action => 'index'
      else
        render :edit
      end
    end

    def product_params
        params.require(:product).permit(:name,:description,:image,:mrp,:selling_price,:discount,:discount_type,:category_id)
    end

end
