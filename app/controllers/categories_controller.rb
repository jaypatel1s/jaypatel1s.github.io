class CategoriesController < ApplicationController
    def index
        @categories = Category.order("created_at DESC")
    end

    def show 
        @category = Category.find(params[:id])
    end
end
